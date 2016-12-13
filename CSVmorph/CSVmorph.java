



// This is the core of the CSVmorph patch, where most of the processing is done.



import com.cycling74.max.*;
import com.cycling74.msp.*;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.apache.commons.math3.analysis.interpolation.SplineInterpolator;
import org.apache.commons.math3.analysis.polynomials.PolynomialSplineFunction;


public class CSVmorph extends MSPPerformer {

	
	////////////////////////////////////////////////////////////////////////////////
	// Declaration of variables
	

    // Data set variables
    private String filepath = (MaxSystem.getDefaultPath() + "/hailun.csv");
    
    private List<List<Double>> dataSet;						// Initialize dynamic two-dimensional list of values, to contain content of imported CSV file
    private List<List<Double>> dataSetReverse;				
    private List<List<Double>> dataSetOut;
    
    private int 		tableSize 			= 0,
    					tableLastIndex      = 0,
						columns	 			= 0,			// Number of columns in data set
    					column 				= 0;			// Current column to operate on
    private double[] 	maxValues;			           		// Array of maximum value of each column, for normalization operations
	
    // Drawing variables
    private double 		drawInterval 		= 50;          	// Draw interval. Lower values can have a substantial impact on performance
    private MaxClock 	drawIntervalTimer;					// Draw interval timer		
    private int 		multisliderSize 	= 400;			// Size of Max multislider, determined by number of rows in data set
    private double 		drawXScaler;						// Scaling factor, table size, multislider size
    private double 		outDrawValue 		= 0,
    			   		currentDrawValue 	= 0,			
    			   		previousDrawValue 	= 0;			// One value delay for use with filters
    
    private boolean 	minimizeFlag 		= false;
    
    // MSP variables
    private int 		vectorSize;							// Size of each sample array
    private double 		outMSPValue 		= 0,
    			   		currentMSPValue 	= 0,
    			   		previousMSPValue 	= 0;			// One sample delay for use with filters

    // Play control variables
    private boolean 	loop 				= false;
    private double 		playIndex 			= 0,
    			   		beginning 			= 0,
    			   		end 				= 1;
    
    // Algorithm variables
    private double 		softenFactor 		= 0,			// Low-pass filter soften factor
    			   		sharpenFactor 		= 0,			// High-pass filter sharpen factor
    			   		scale				= 0.5,
    			   		offset 				= 0.5,
    			   		rotateFactor 		= 0.5,
    			   		bendFactor          = 1,
    			   		speed 				= 0;
    private boolean 	tanhTopOn 			= false,		// Soft clip of values approaching 1				
    					tanhBottomOn 		= false;		// Soft clip of values approaching 0
	
    // Default values
    private int 		columnDefault 		= 1;
    private double 		smoothDefault 		= 0.0,
    			   		hipassDefault 		= 0.0,
    			   		scaleYDefault 		= 0.5,
    			   		offsetYDefault 		= 0.5,    
    			   		rotateFactorDefault = 0.5,
    			   		bendFactorDefault   = 0.5,
    			   		speedDefault 		= 0.55;
    private boolean 	loopDefault 		= true,
    					reverseDefault 		= false,
    					tanhTopOnDefault 	= true,
    					tanhBottomOnDefault = true;
   
    // Load timer
    private MaxClock 	loadBoomTimer;
    
    
    
	//////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Constructor
	
	public CSVmorph() {
		
		declareInlets(new int[]{SIGNAL, SIGNAL, SIGNAL, SIGNAL, SIGNAL, SIGNAL, SIGNAL, SIGNAL, SIGNAL, SIGNAL});
		declareOutlets(new int[]{SIGNAL, DataTypes.ALL, DataTypes.ALL, DataTypes.ALL, DataTypes.ALL});

		readFile();																	// Read .csv file

		loadBoomTimer = new MaxClock(this, "loadBoom");
		loadBoomTimer.delay(100.);
	}

	
	public void dspsetup(MSPSignal[] in, MSPSignal[] out) {
		vectorSize = in[0].n;														// Get vector size
	}
	
	
	//////////////////////////////////////////////////
	// MSP processing method
	
	public void perform(MSPSignal[] in, MSPSignal[] out) {
		
		// Create arrays for audio in/out vectors
		float[] in0 = in[0].vec,                                         			// Playback position
				in1 = in[1].vec,                                         			// Low-pass filter
				in2 = in[2].vec,                                         			// High-pass filter
				in3 = in[3].vec,                                         			// Scale
				in4 = in[4].vec,                                         			// Offset
				in5 = in[5].vec,                                         			// Rotate
				in6 = in[6].vec,                                         			// Speed	
				in7 = in[7].vec,                                         			// Selection beginning
				in8 = in[8].vec,                                         			// Selection end
				in9 = in[9].vec,                                         			// Rotate
				
				out0 = out[0].vec;													// Vector of output
	
		
		/////////////////////////////////////////////////////////////////////////////////////////////
        // Process a vector

		for(int i = 0; i < vectorSize; i++) { 

					
			//////////////////////////////////////////////////////////////////////////////////////////
			// Playback controls
			
				
			// If no external position control: manage playback speed
			if(!in[0].connected) {
				if (speed > 0) playIndex += (speed) / (tableSize / 7);
				if (speed < 0) playIndex +=  (speed) / (tableSize / 7);
	
				if (loop == true) {
					if (playIndex > end) playIndex = beginning;
					if (playIndex < beginning) playIndex = end;
				}
							
				if (loop == false) {
					if (playIndex > tableLastIndex) playIndex = tableLastIndex;
					if (playIndex < 0) playIndex = 0;
				}
			}
			
			
			
			// Check for external control of playback position
			if(in[0].connected) {
				if (loop == true)
					playIndex = in0[i] * (end - beginning) + beginning;
					
				if (loop == false)
					playIndex = in0[i] * tableLastIndex;		
			}
				
			if(in[7].connected) {
				beginning = in7[i] * tableLastIndex;
			}
			
			if(in[8].connected) {
				end = in8[i] * tableLastIndex;
			}
				
	
			
			//////////////////////////////////////////////////////////////////////////////////////////
			// Process current table value 
			
			
	        // Get current value (interpolated)
		    outMSPValue = polySplineF.value(playIndex);

		    
		    // Read inlet values
			if(in[1].connected) soften(in1[i]);					// Receive and set softenFactor
			if(in[2].connected) hipass(in2[i]);					// Receive and set sharpenFactor
       
			if (in[3].connected) scale = curve(in3[i]) * 2;  	// Receive and set Scale factor
			if (in[4].connected) offset = in4[i] * 2 - 1;		// Receive and set Offset factor
		    if (in[5].connected) rotate(in5[i]);				// Receive and set Rotate factor
		    if (in[9].connected) bend(in9[i]);					// Receive and set Rotate factor

			if (in[6].connected) speed = tangentCurve(in6[i]);	// Speed
			
	
		

        	// low pass filter
        	currentMSPValue = outMSPValue;                                   
        	outMSPValue = previousMSPValue + ((currentMSPValue - previousMSPValue) * (softenFactor/1024));

        	// high pass filter
        	currentMSPValue = outMSPValue;
        	outMSPValue = currentMSPValue - (sharpenFactor * (previousMSPValue + ((currentMSPValue - previousMSPValue) * (0.000001/1024))));
        	
        	// Filter delay
        	previousMSPValue = currentMSPValue;
	        		
			// Scale
			outMSPValue *= scale;
		        
			// Offset
	    	outMSPValue += offset;	   

		    // Rotate
		    outMSPValue = calculateRotation((double) playIndex, outMSPValue);
		    
        	// bend
        	outMSPValue = outMSPValue * 1 + ( bendFactor * (Math.sin(Math.PI / (double) tableLastIndex * playIndex )));
        	
			// Soft clip top
			if (tanhTopOn){
				outMSPValue = Math.tanh(outMSPValue * (Math.PI/2));}
		
        	// Soft clip bottom
			if (tanhBottomOn){
				outMSPValue = Math.tanh((outMSPValue - 1) * (Math.PI/2) ) + 1;}
				
			// Limit output value
			if (outMSPValue < 0) outMSPValue = 0;
			if (outMSPValue > 1) outMSPValue = 1;
			
			// Output value
			out0[i] = (float) outMSPValue;
		}
	}
	
	

    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Read and parse .csv file method
	
	public void readFile() {

	    dataSet = new ArrayList<List<Double>>();	
		
        String tempLine = "";															// Temporary line for reading into
        
        // Read file, catch file IO errors
        try {	
            FileReader fileReader = new FileReader(filepath);                          	// Create FileReader object
            BufferedReader bufferedReader = new BufferedReader(fileReader);            	// Wrap FileReader in BufferedReader
            
            // Read lines from file if line exists
            while((tempLine = bufferedReader.readLine()) != null) {  	
            	
            	String[] tempStringArray = (tempLine.split(","));                  		// Temporary array for holding split string
            	Double[] tempDoubleArray = new Double[tempStringArray.length];			// Temporary array for holding converted values
        
            	// For each element of split string
            	for (int i = 0; i < tempStringArray.length; i++){                                     			
            		try {   															// Catch not double error
                		tempDoubleArray[i] = Double.parseDouble(tempStringArray[i]);    // Fill double array with elements from converted string array
            		} catch (Exception e) {
            			tempDoubleArray[i] = 0.0;                                       // If not double, set to default value of 0.0
            		}	
            	}

            	dataSet.add(Arrays.asList(tempDoubleArray));	 						// Add list of doubles to main table	
            }   

            bufferedReader.close();                										// Close file    
      
        // Catch file errors
        } catch(FileNotFoundException e) {
            error("Unable to open file '" + filepath + "'");                

        } catch(IOException e) {
            error("Error reading file '" + filepath + "'");
        }
		
       
    	end = dataSet.size();                                                         	// Get endpoint
        columns = dataSet.get(0).size();   												// Get number of columns
    	tableSize = dataSet.size();
    	tableLastIndex = tableSize - 1;
    	

		// Set column slider range to number of columns in data set
		outlet(1, new Atom[]{Atom.newAtom("column"), Atom.newAtom("setmax"), Atom.newAtom(columns - 1)});
		
       
        // Find maximum value of each row of .csv file   
        maxValues = new double[dataSet.get(0).size()];
        double[] previousMaxValues = new double[dataSet.get(0).size()];
        
    	for (int column = 0; column < columns; column++)  {								// Scan each column for maximum value
    		for (int row = 0; row < dataSet.size(); row++){	
    			if (dataSet.get(row).get(column) > previousMaxValues[column]) {
            		maxValues[column] = dataSet.get(row).get(column);      
            		previousMaxValues[column] = dataSet.get(row).get(column);
    			}		      
        	}
        }
    
    	// Scale columns according to max value
    	for (int column = 0; column < columns; column++)  {								
    		for (int row = 0; row < dataSet.size(); row++){	
    			dataSet.get(row).set(column, dataSet.get(row).get(column)/maxValues[column]);   
        	}
        }
    		

    	// Create a copy of data set to be used for operations
		dataSetOut = new ArrayList<List<Double>>(dataSet);
		
		// Create a reversed copy of data set
		dataSetReverse = new ArrayList<List<Double>>(dataSet);
		Collections.reverse(dataSetReverse);
	}
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////
	// Load defaults at start
	
	public void loadBoom() {                                            // After object is completely initialized, set default values
		
		outlet(1, "column", columnDefault);
		outlet(1, "lowpass", smoothDefault);
		outlet(1, "highpass", hipassDefault);
		outlet(1, "scaleY", scaleYDefault);
		outlet(1, "offsetY", offsetYDefault);
		outlet(1, "rotate", rotateFactorDefault);
		outlet(1, "bend", bendFactorDefault);
		outlet(1, "reverse", reverseDefault);
		outlet(1, "softClipTop", tanhTopOnDefault);
		outlet(1, "softClipBottom", tanhBottomOnDefault);
		outlet(1, "loop", loopDefault);
		outlet(1, "speed", speedDefault);
		outlet(1, "drawInterval", drawInterval);
		outlet(1, "filepath", filepath);

        outlet(2, "size" , multisliderSize);
        
		drawIntervalTimer = new MaxClock(this, "draw");
		drawIntervalTimer.tick();
	}
	  

	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Interpolation function
	// Gives access to all points between discrete values in .csv file column
	
	// Initialize interpolator instances
	SplineInterpolator interpolator;
	PolynomialSplineFunction polySplineF;
	
	public void interpolate() {
		
		interpolator = new SplineInterpolator();
		
		// Create and fill array of each point around which the spline will curve
		// In this case all original points are wanted, since we want greater resolution.
		double[] knotArray = new double[tableSize]; 
		for (int i=0; i<tableSize; i++) {
			knotArray[i] = i;
		}
		
		// Create and fill array with all values from original data
		double[] valueArray = new double[tableSize];
		for (int i=0; i<tableSize; i++) {
			valueArray[i] = dataSetOut.get(i).get(column);
		}

		polySplineF = interpolator.interpolate(knotArray, valueArray);
	}
	
	
	

	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Draw method:
	// Output data to graphic objects
	
	public void draw() {
		
		// Do not expend resources on drawing if graphic window is not visible
		if (minimizeFlag == false) {
		
			// Initialize array to contain set command plus all table index and value pairs
			Atom[] drawAtom = new Atom[1 + multisliderSize * 2];
			int atomCounter = 0;

	    	drawAtom[0] = Atom.newAtom("set"); atomCounter++;
	    	
			drawXScaler = 1 / (double) multisliderSize * (double) tableLastIndex;
	
	    	// For each value in column perform calculations and fill array
	        for (int i = 0; i < multisliderSize; i++){

	        	outDrawValue = polySplineF.value((double) i * drawXScaler);


	        	// low pass filter
	        	if (i == 0) previousDrawValue = outDrawValue;
	        	currentDrawValue = outDrawValue;
	        	outDrawValue = previousDrawValue + ((currentDrawValue - previousDrawValue) * softenFactor);
	        	
	        	// high pass filter
	        	currentDrawValue = outDrawValue;
	        	outDrawValue = currentDrawValue - (sharpenFactor* (previousDrawValue + ((currentDrawValue - previousDrawValue) * 0.000001)));
	        
	        	// Filter delay
	        	if (Double.isNaN(currentDrawValue))
	        		currentDrawValue = 0.0;
	        	previousDrawValue = currentDrawValue;
	        	
	        	// scale
	        	outDrawValue *= scale;

	        	// offset
	        	outDrawValue += offset;
	        	
	        	// rotation
	        	outDrawValue = calculateRotation((double) i * drawXScaler, outDrawValue);
	        	
	        	// bend
	        	outDrawValue = outDrawValue  + ( bendFactor * (Math.sin(Math.PI / 400 * (double) i )));
	        	
	        	// soft clip top by hyperbolic tangent
	        	if (tanhTopOn) outDrawValue = Math.tanh(outDrawValue * (Math.PI/2));
	
	        	// soft clip top by hyperbolic tangent
	        	if (tanhBottomOn) outDrawValue =  Math.tanh((outDrawValue - 1) * (Math.PI/2) ) + 1;

	        	// Add values to drawAtom
	        	drawAtom[atomCounter] = Atom.newAtom(i + 1);		atomCounter++;
	        	drawAtom[atomCounter] = Atom.newAtom(outDrawValue);	atomCounter++;
	        }
	
	   
	        // Output complete array
			outlet(2, drawAtom);
			outlet(3, playIndex / tableLastIndex);
			outlet(4, new Atom[]{Atom.newAtom("set"), Atom.newAtom(beginning/tableLastIndex), Atom.newAtom(end/tableLastIndex)});
		}	
		
		// Initialize next draw event
		drawIntervalTimer.delay(drawInterval);
	}
	


	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Algorithm methods
	
	
	double calculateRotation(double index, double value) {
		value += ((1 - 1/(double) tableLastIndex * index) * 2 - 1) * (rotateFactor * 2 - 1);
		return value;	
	}
	
	
	
	
	//////////////////////////////////////////////////////////
	// Receiver methods:
	// Receive and format messages from parent max patch

	
	public void beginning(double i) {
		beginning = i * tableLastIndex;
	}

	public void bend(double d) {
		bendFactor = (d - 0.5) * 2;
	}
	
	public void clipHi(boolean b) {							// Hyperbolic tangent function for soft clip towards max
		tanhTopOn = b;
	}
	
	public void clipLo(boolean b) {							// Hyperbolic tangent function for soft clip towards max
		tanhBottomOn = b;
	}	

	public void column(int i) {							// Choose column from imported .csv file
		if (i <= columns && i >= 0){
			column = i; }
		
		interpolate();
	}
	
	public void end(double i) {
		end = i * tableLastIndex;
	}

	public void filepath (String s) {
		filepath = s;
		outlet(1, "filepath", filepath);
		readFile();
		column = 0;
		post("columns: " + columns);
		interpolate();
	}

	public void hipass(double d) {
		sharpenFactor = (d);
	}

	public void interval(double d) {
		drawInterval = d;
	}

	public void loop(boolean b) {
		loop = b;
		outlet(1, new Atom[]{Atom.newAtom("loop"), Atom.newAtom("set"), Atom.newAtom(loop)});
	}
	
	public void minimizeFlag(boolean b) {
		minimizeFlag = b;
	}

	public void offsetY(double o) {
		offset = o * 2 - 1;
	}
	
	public void reverse(boolean b){								// Reverse column
		if (b == false) dataSetOut = dataSet;	
		if (b == true) dataSetOut = dataSetReverse;
			
		interpolate();
	}
	public void rotate(double i) {
		if (i != rotateFactor) {
			rotateFactor = i;
		}
	}
	
	public void scaleY(double d) {
		scale = curve(d) * 2;									// Impose cosine curve for soft start of curve
	}

	
	public void soften(double d) {
		softenFactor = 1 - Math.tanh(d * 4);
	}

	public void speed(double d) {
		speed = tangentCurve(d);
	}
	

	public void trigger() {
		playIndex = 0;
	}
	
	
	
	

	//////////////////////////////////////////////////////
	// Utility algorithm methods
	
	
	private static double curve(double d) {								// Impose s-shaped curve on fader input
		return (1 - ((Math.cos(Math.PI * d) + 1) / 2));          		// Part of cosine curve scaled and inverted
	}
	
	
	private static double tangentCurve(double d) {						// Impose tangent curve on input
		return Math.tan(2 * d - 1 );
	}
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////
	// Release on quit

	
	public void notifyDeleted() {                                       // Delete timers on object destroyed
          loadBoomTimer.release();
          drawIntervalTimer.release();
	}
	
	  
	  
	
	
	
	
	
	
}
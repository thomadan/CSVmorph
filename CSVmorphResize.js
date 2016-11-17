

// This is JavaScript code for resizing CSVmorph bpatcher


var bpatcherName = "CSVmorph";
var bpatcherWidth = 486;
var bpatcherHeight = 148;
var minWidth = 84;
var minHeight = 22;
var left, top, right, bottom;
var resizeFlag;


function resize() {
	
	
	// Start with first object of parent patcher, if parent patcher exists
	try {
		var currentobject = this.patcher.parentpatcher.firstobject;
	}
	catch(error) {
		// There is no parent patcher, probably means patch was loaded as parent
	}
	
	
	// While there is an object
	while (currentobject) { 
	
		// If object is an instance of CSVmorph (no occurrence of search string in bpatcher name returns -1)
		if (currentobject.varname.indexOf(bpatcherName) !== -1) {
			
			// Get resize flag
			resizeFlag = currentobject.subpatcher().getnamed("minimizeFlag").getvalueof();
			
			// if minimize flag is 0
			if (resizeFlag == 0) {
				// set presentation rectangle array to original size
				left   = currentobject.rect[0];
				top    = currentobject.rect[1];
				right  = currentobject.rect[0] + bpatcherWidth;
				bottom = currentobject.rect[1] + bpatcherHeight;
			}	

			// if minimize flag is 1
			if (resizeFlag == 1) {
				// set presentation rectangle array to minimum size
				left   = currentobject.rect[0];
				top    = currentobject.rect[1];
				right  = currentobject.rect[0] + minWidth;
				bottom = currentobject.rect[1] + minHeight;	
			}	
			
			// If object is not already correct size (if at least one dimension is wrong)
			if (currentobject.rect[2] - currentobject.rect[0] != right - left
			 || currentobject.rect[3] - currentobject.rect[1] != bottom - top) {
			
				// Resize object (takes an array of top left corner X and Y, bottom right corner X and Y)
				currentobject.rect = new Array(left, top, right, bottom);
				
				// Bring to CSVmorph instance to front when maximized
				if (resizeFlag == 0) {
					this.patcher.parentpatcher.bringtofront(currentobject);					
				}	
		
				if (resizeFlag == 1) {
					this.patcher.parentpatcher.sendtoback(currentobject);	
				}	
			}		
		}
		
		// Find next object
		currentobject = currentobject.nextobject;	
	}
}


// Wait for patch to initialize before starting script
delayedStart = new Task(resize, this);
delayedStart.schedule(50);



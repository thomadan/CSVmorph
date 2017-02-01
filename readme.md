# CSVmorph
A [Max](https://cycling74.com/products/max/) patch that is capable of reading and processing CSV files dynamically at audio signal rate. The patch is intended to contribute to a greater dynamism and complexity of sound control. A key feature is the ability to chain multiple instances of the patch together, creating complex control data.

![CSVmorph interface](http://thomasdahlandersen.net/images/csvmorph/CSVmorph3.png)

*The graphical interface as it presents in Max is shown above, with a column of values from a CSV file represented graphically.*

The core code for this project is written in Java, with additional code in JavaScript. Max is hosting the Java and JavaScript code through its APIs, and is utilized primarily for its graphical interface and audio engine.

### The files

* CSVmorph.maxpat - The CSVmorph Max patch, to be used in Max as a *bpatcher*
* CSVmorph.java   - Java source code for performing reading, processing and drawing operations
* CSVmorph.class  - Compiled CSVmorph.java - dependency of CSVmorph.maxpat
* CSVmorph.js     - JavaScript code for resizing bpatcher - dependency of CSVmorph.maxpat
* hailun.csv      - Default CSV file
* example.maxpat  - Example Max patch demonstrating how CSVmorph.maxpat is used

## Running the patch

The patch is developed for Max version 7. Java version 6 or later is required, as well as the [Commons Math](http://commons.apache.org/proper/commons-math/index.html) library. Since both Max and Java are available in both 32- and 64-bit architecture, the installed Java version must be of the same bit architecture as that of the chosen Max version. Both Mac OS and Windows operating systems are supported.

### Requirements

* Windows or macOS operating system
* Max version 7
* Java version 6 or greater
* The [Commons Math](http://commons.apache.org/proper/commons-math/index.html) Java library
* Max and Java versions should be of the same bit architecture (e.g. both are 64-bit)

The CSVmorph patch is meant to be run as a bpatcher in a parent patcher, and not by itself. This is done by typing *bpatcher CSVmorph.maxpat* in a new object creation box. The included example patch demonstrates how CSVmorph is used.


## Operating CSVmorph

Upon creation, the bpatcher is in its minimized state. Clicking the bpatcher will maximize it, showing a graphical representation of the data and various controls for reading and processing the data. Additional controls are available by clicking the 'Settings' button in the lower right. The triangle at the top left corner minimizes the bpatcher.

An orange marker represents the position from which a value is being read from the data. The opaque area represents the limits of the section from which to read values. This area can be set by click-dragging the mouse pointer across the desired area. Modifier keys manipulates the edges of the selection in various ways. Holding shift, control/cmd or alt while click-dragging the opaque area modifies the individual edges, position and size of the area, respectively.

Most of the controls in CSVmorph can be controlled by external input from another instance of the CSVmorph patch, or by any signal input in the range between 0 - 1.

### Controls
* Column - Choose a column from the loaded CSV file
* Low-pass - Low-pass filter the data
* High-pass - High-pass filter the data
* Scale - Scale values by a factor of 0 to 2
* Offset - Offset values by an amount of -1 to 1
* Rotate - Rotate column along its horizontal axis as it presents graphically
* Bend - Bend column along its horizontal axis as it presents graphically
* Trigger - Set read position to start of read area
* Speed - Amount of read position advancement in either direction
* Loop - Loop read area

### Settings
* Lo limit - Soft clip values as they near 0
* Hi limit - Soft clip values as they near 1
* Invert - Reverse the data set
* Load CSV file - Open file dialog for selecting CSV file to load

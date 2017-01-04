# CSVmorph

This project is a [Max](https://cycling74.com/products/max/) patch reading and processing CSV files dynamically at audio signal rate.

![CSVmorph interface](http://thomasdahlandersen.net/images/CSVmorph%20interface%20v2.png)

*The graphical interface as it presents in Max is shown above, with a column of values from a CSV file represented graphically.*

The core code for this project is written in Java, with additional code in JavaScript. Max is hosting the Java and JavaScript code through its APIs, and is used primarily for its graphical interface and audio engine.

### The files

* CSVmorph.maxpat - The patcher, to be used in Max as a *bpatcher*
* CSVmorph.java   - The core Java class. Performing reading, processing and drawing commands.
* CSVmorph.class  - Compiled version of the java source code - dependency of CSVmorph.maxpat
* CSVmorph.js     - JavaScript code for resizing bpatcher - dependency of CSVmorph.maxpat
* hailun.csv      - Included default CSV file
* example.maxpat  - An example patch demonstrating how CSVmorph.maxpat is used

## Running the patch

The CSVmorph patch is meant to be run as a bpatcher in a parent patcher, and not by itself. This is done by pressing the key [n] in a patcher and typing [bpatcher CSVmorph.maxpat].


### Requirements

* Windows or macOS operating system
* Max version 7
* Java version 6 or greater
* The [Commons Math](http://commons.apache.org/proper/commons-math/index.html) Java library
* Max and Java versions should be of the same bit architecture (e.g. both are 64-bit)

The patch is developed for Max version 7. Java version 6 or later is required, as well as the [Commons Math](http://commons.apache.org/proper/commons-math/index.html) library. Since both Max and Java are available in both 32- and 64-bit architecture, one should make sure that the installed Java version is of the same bit architecture as that of the chosen Max version. Both Mac OS and Windows operating systems are supported.





## Operating the patch

Upon creation, the patch is in its minimized state. Clicking the patch will maximize it, showing the graphical representation and various controls. Additional controls are available by clicking the 'Settings' button on the lower right. The triangle at the top left corner minimizes the patch.

An orange marker represents the position from which a value is being read from the column of data.This marker can be controlled either with the speed slider or through input from another instance of the CSVmorph patch. The opaque area represents a limitation of the section from which to read values. This area can be set by click-dragging the mouse pointer across the desired area. Modifier keys of shift, control/cmd and alt manipulates the edges of the area in various ways.
### The controls

* Column - Choose a column from the CSV file

* Low-pass - Low-pass filter the data
* High-pass - High-pass filter the data
* Scale - Scale values by a factor of 0 to 2
* Offset - Offset values by an amount of -1 to 1
* Rotate - Rotate column along its horizontal axis as it presents graphically
* Bend - Bend column along its horizontal axis as it presents graphically

* Trigger - Set read position to start of read area
* Speed - Interval of read position advancement in either direction
* Loop - Loop read area
### Settings

* Lo limit - Soft clip values as they near 0.
* Hi limit - Soft clip values as they near 1.
* Invert - Reverse the values of the column
* Load CSV file - Open file dialog for selscting CSV file to load

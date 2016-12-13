# CSVmorph

This project is a [Max](https://cycling74.com/products/max/) patch reading and processing CSV files dynamically at audio signal rate.

A demonstration video is available [here](https://www.youtube.com/watch?v=ChBopj9Q4lQ)

![CSVmorph interface](http://thomasdahlandersen.net/images/CSVmorph%20interface%20v2.png)

*The graphical interface as it presents in Max is shown above, with a column of values from a CSV file represented graphically.*

The core code for this project is written in Java, with additional code in JavaScript. Max is hosting the Java and JavaScript code through its APIs, and is used primarily for its graphical interface and audio engine.

### The files

* CSVmorph.maxpat - The patcher, to be used in Max as a *bpatcher*
* CSVmorph.java   - The core Java class. Performing reading, processing and drawing commands.
* CSVmorph.class  - Compiled version of the java source code
* CSVmorph.js     - JavaScript code for resizing bpatcher
* hailun.csv      - Included default CSV file
* example.maxpat  - An example patch demonstrating how CSVmorph.maxpat is used

### Running the patch

The CSVmorph patch is meant to be run as a bpatcher in a parent patcher, and not by itself. This is done by pressing [N] on the keyboard in a patcher and typing [bpatcher CSVmorph.maxpat].

### Operating the patch

Upon creation, the patch is in its minimized state. Clicking the patch will maximize it, showing the graphical representation and various controls. Additional controls are available by clicking the 'Settings' button on the lower right.

### The controls

* Column - choose a column from the CSV file
* Low-pass - low-pass filter the data
* High-pass - high-pass filter the data
* Scale - scale values by a factor of 0 to 2
* Offset - offset values by an amouht of -1 to 1
* Rotate - rotate column along its horizontal axis
* Bend - bend column along its horizontal axis

### Settings

* Lo limit - 
* Hi limit - 
* Invert
* Load CSV file

### Requirements

* Windows or macOS operating system
* Max version 7
* Java version 6 or greater
* The [Commons Math](http://commons.apache.org/proper/commons-math/index.html) Java library
* Max and Java versions should be of the same bit architecture (e.g. both are 64-bit)

The patch is developed for Max version 7. Java version 6 or later is required, as well as the [Commons Math](http://commons.apache.org/proper/commons-math/index.html) library. Since both Max and Java are available in both 32- and 64-bit architecture, one should make sure that the installed Java version is of the same bit architecture as that of the chosen Max version. Both Mac OS and Windows operating systems are supported.

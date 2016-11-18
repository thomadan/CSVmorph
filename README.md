# CSVmorph

This project is a [Max](https://cycling74.com/products/max/) patch reading and processing CSV files dynamically at audio signal rate. [The project web page](http://thomasdahlandersen.net/). A demonstration video is available [here](http://thomasdahlandersen.net/)




![CSVmorph interface](http://thomasdahlandersen.net/images/CSVmorph%20interface%20v2.png)



*The graphical interface as it presents in Max is shown above, with a column of values from a CSV file represented as a run chart.*

The core code for this project is written in Java, with additional code in JavaScript. Max is hosting the Java and JavaScript code through its APIs, and is used for its graphical interface and audio engine.


### The files

* CSVmorph.maxpat - The bpatcher to be used in Max patchers
* CSVmorph.java   - the core Java class, processing and drawing commands
* CSVmorph.class  - a compiled version of the java source
* CSVmorph.js     - JavaScript code for resizing bpatcher
* hailun.csv      - The default data set included for
* Example.maxpat  - An example patch showing how CSVmorph.maxpat is used


### Running the patch
The patch runs on Max version 7. Java version 6 or later is required, as well as the [Commons Math](http://commons.apache.org/proper/commons-math/index.html) library. Since both Max and Java are available in both 32- and 64-bit architecture, one should make sure that the installed Java version is of the same bit architecture as that of the Max executable. Both Mac OS and Windows operating systems are supported.

The CSVmorph patch is meant to be run as a bpatcher in a parent patcher, and not by itself.


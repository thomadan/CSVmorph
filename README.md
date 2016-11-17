# CSVmorph

This project is a [Max](https://cycling74.com/products/max/) patch for processing CSV files dynamically at audio signal rate.


![CSVmorph interface](http://thomasdahlandersen.net/images/CSVmorph%20interface.png)

*The graphical interface is shown above, with the CSV file data represented as a graph.*

The core code for this project is written in Java, with additional code in JavaScript. Max is hosting the Java and JavaScript code through its APIs, and is used for its graphical interface and audio engine.

This site was built using [GitHub Pages](https://pages.github.com/).

### The files

* CSVmorph.maxpat - The bpatcher to be used in Max patchers
* CSVmorph.java   - the core Java class, processing and drawing commands
* CSVmorph.class  - a compiled version of the java source
* CSVmorph.js     - JavaScript code for resizing bpatcher
* hailun.csv      - The default data set included for
* Example.maxpat  - An example patch showing how CSVmorph.maxpat is used


### Running it
The patch runs on Max version 7. Java version 6 or later is required. Since both Max and Java are available in both 32- and 64-bit architecture, one should make sure that the installed Java version is of the same bit architecture as that of the Max executable. Both Mac OS and Windows operating systems are supported.


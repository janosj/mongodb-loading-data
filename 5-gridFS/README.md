# GridFS

Demonstrates MongoDB's GridFS API and tooling for storing large files using either the _mongofiles_ command-line tool or a simple custom utility written in Java. 

2 options to run this demo:  

1. In the scripts demo, from the command line, run _convertAndUpload.sh_.  This will do 3 things with any files in the _sampleFiles_ directory:
   1. Convert the docs (pdfs, etc) into json text via Apache Tika.
   2. Import that JSON text into Mongo via mongoimport.
   3. Import the original files into Mongo via _mongofiles_ (a command-line tool).

2. Run the Java utility to upload, download, list, rename, or delete a file:  

        java -jar java-gridFS-client.jar <command>

Omit the command to see the usage.



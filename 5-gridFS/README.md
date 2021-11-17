# GridFS

Use MongoDB's GridFS API and tooling to store and manage large files. Use either *mongofiles* (a command-line tool) or the GridFS API (Java used here).

To run the Java client to upload, download, list, rename, or delete a file(s):

        java -jar java-gridFS-client.jar <command>

Omit the command to see the usage.

Or, run mongofiles. A convenience script is provided with example usage.

Alternatively, running *convertAndUpload.sh* will do 3 things with any files in the _sampleFiles_ directory:
   1. Convert the docs (pdfs, etc) into json text via Apache Tika.
   2. Import that JSON text into Mongo via mongoimport.
   3. Import the original files into Mongo via _mongofiles_ (a command-line tool).


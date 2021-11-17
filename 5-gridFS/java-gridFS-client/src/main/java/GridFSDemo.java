import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.gridfs.*;
import com.mongodb.client.gridfs.model.*;
import org.bson.Document;
import org.bson.types.ObjectId;
import java.io.*;
import java.util.logging.*;


public class GridFSDemo {

	// GridFS Java tutorial is here: http://mongodb.github.io/mongo-java-driver/3.12/driver/tutorials/gridfs/
	
	static final String UPLOAD_FOLDER = "./sampleFiles";
	static final String DOWNLOAD_FOLDER = "./downloadDir";
	static final String DB_NAME = "gridfsDB";
	
	private static void uploadFile(GridFSBucket gridFSBucket, String filename) {

		System.out.print("Uploading file: " + filename + "...");
		
		try {

			InputStream streamToUploadFrom = new FileInputStream(new File(UPLOAD_FOLDER + "/" + filename));
			
			// Create some custom options
			GridFSUploadOptions options = new GridFSUploadOptions()
	                                        .metadata(new Document("any-custom-attr", "any-value"));
	    									//.chunkSizeBytes(358400)

			ObjectId fileId = gridFSBucket.uploadFromStream(filename, streamToUploadFrom, options);
			System.out.println(" done. (fileID: " + fileId+ ")");

        } catch (IOException e) {
            System.out.println("File Upload: Unexpected Exception");
            System.exit(1);
        }        	
    
    
	}
	
	private static void downloadFile(GridFSBucket gridFSBucket, String downloadFilename) {
		
		try {
			
			System.out.print("Downloading file " + downloadFilename + "... ");
			
            FileOutputStream streamToDownloadTo = new FileOutputStream(DOWNLOAD_FOLDER + "/" + downloadFilename);
            
            // The id of a file uploaded to GridFS, initialize to valid file id 
            // ObjectId fileId = new ObjectId("5e5ee88c0ab6df133fedcd1e"); 
            // If you don’t know the _id of the file but know the filename, then you can pass the filename to the downloadToStream method. 
            //gridFSBucket.downloadToStream(fileId, streamToDownloadTo);
            
            gridFSBucket.downloadToStream(downloadFilename, streamToDownloadTo);
            streamToDownloadTo.close();
            
            System.out.println("done.");
            
        } catch (IOException e) {
            System.out.println("File Download: Unexpected Exception");
            System.exit(1);
        }        	
		
	}
	
	/**
     * 
     * @param args takes an optional single argument for the command to be run
     * previous version accepted a connect string, but current version only connects to local instance.
     */
    public static void main(final String[] args) {
    
    	String command = null;
        String mongodbURI = null;
    	
    	// Disables logging so we can better see the demo output.
    	Logger mongoLogger = Logger.getLogger( "org.mongodb.driver" );
    	mongoLogger.setLevel(Level.SEVERE);
    	
    	/*
        if (args.length == 0) {
            // connect to the local database server
            mongoClient = MongoClients.create();
        } else {
            mongoClient = MongoClients.create(args[0]);
        }
        */
    	
        if (args.length < 2) {
        	System.out.println("Usage: GridFSDemo <upload|download|ls|rename|delete|clean> <MongoDB-URI>");
        	System.exit(1);
        } else {

            command = args[0];
            System.out.println("Running with command " + command);

            mongodbURI = args[1];

        }

        // MongoClient mongoClient = MongoClients.create();
        MongoClient mongoClient = MongoClients.create(mongodbURI);
    	
        // get database handle
        MongoDatabase myDatabase = mongoClient.getDatabase(DB_NAME);

        // Create a gridFSBucket using the default bucket name "fs"
        GridFSBucket gridFSBucket = GridFSBuckets.create(myDatabase);
        
        // Create a gridFSBucket with a custom bucket name "files"
        // GridFSBucket gridFSBucket = GridFSBuckets.create(myDatabase, "files");
        
        // GridFS will automatically create indexes on the files and chunks collections 
        // on first upload of data into the GridFS bucket.
        
        // UploadFromStream
        if (command.equals("upload")) {
        	
        	File folder = new File(UPLOAD_FOLDER);
            String[] files = folder.list();
            for (String file : files) {

            	// Macs have a hidden file...
            	if (!file.equals(".DS_Store")) {
            		uploadFile( gridFSBucket, file );
            	}
            	
            }
        	
        }
        
        // Find Files
        if (command.equals("ls")) {
        	
            System.out.println("Fetching list of stored files...");
        	GridFSFindIterable files = gridFSBucket.find();
        	for (GridFSFile file : files) {
    			System.out.println(file.getFilename());
    		}

            // Or, provide a custom filter:
            /*
            gridFSBucket.find(eq("metadata.contentType", "image/png")).forEach(
            	new Block<GridFSFile>() {
            		public void apply(final GridFSFile gridFSFile) {
            			System.out.println(gridFSFile.getFilename());
            		}
            	});
            */
        	
        }

        // Download from GridFS
        if (command.equals("download")) {
        	
            // DownloadToStream
        	
        	// Download all files
        	GridFSFindIterable files = gridFSBucket.find();
        	for (GridFSFile file : files) {
        		downloadFile( gridFSBucket, file.getFilename() );
    		}

        }
        
        // Rename files
        if (command.equals("rename")) {
            System.out.println("Rename: sorry, not implemented here.");
            /*
            ObjectId fileId2 = new ObjectId(); //ObjectId of a file uploaded to GridFS
            gridFSBucket.rename(fileId2, "mongodbTutorial");
            */
        }
        
        // Delete files
        if (command.equals("delete")) {
        	
            // Deletes the first file it finds.
        	GridFSFindIterable files = gridFSBucket.find();
        	GridFSFile firstFile = files.first();
        	System.out.println( "File not specified - deleting file at random (ObjectID " + firstFile.getId().toString() + ")" );
        	gridFSBucket.delete( firstFile.getId() );

        	// Or, delete a specific file
            // ObjectId fileId3 = new ObjectId("5e5ee88c0ab6df133fedcd1e"); 
            // gridFSBucket.delete(fileId3);
            
        }
        
        // Clean up
        if (command.equals("clean")) {
            myDatabase.drop();
            System.out.println("Done. Database gridfsDB dropped.");
        }

        // release resources
        mongoClient.close();
        
    }
}

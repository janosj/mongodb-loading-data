#!/usr/bin/env python3

import getopt, sys
import bson
import pymongo
from datetime import datetime
from apachelogs import LogParser

# Process command-line arguments
if len(sys.argv) == 1:
   print("Usage: import.py --mongdbURI <URI str> --inputFile <filename> --lines <number-of-lines-to-import>")
options = "h:i:l:"
long_options = ["mongodbURI=", "inputFile=", "lines="]
try:
   argumentList = sys.argv[1:]   # Discard the first command-line argument
   arguments, values = getopt.getopt(argumentList, options, long_options)
   for currentArgument, currentValue in arguments:

      if currentArgument in ("-h", "--mongodbURI"):
         mongodbURI = currentValue
         print("URI: " + mongodbURI)
            
      elif currentArgument in ("-i", "--inputFile"):
         inputFile = currentValue
         print("inputFile: " + inputFile)
            
      elif currentArgument in ("-l", "--lines"):
         lines = int(currentValue)
         print("Lines: " + currentValue)
             
except getopt.error as err:
    # output error, and return with an error code
    print (str(err))

# Apache log format
parser = LogParser("%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" \"%X\"")

# Connect to Mongo and hook into the collection
conn = pymongo.MongoClient(mongodbURI)
db = conn.DEMO
collection = db.apache_logs
print("Connected to MongoDB")

recordCount = 1
with open(inputFile) as fp:  
     for entry in parser.parse_lines(fp):
         print("Inserting document", recordCount, "...")

         ###### Create the JSON document.
         event = {
           '_id': bson.ObjectId(),
           'remote_host': entry.remote_host,
           'remote_logname': entry.remote_logname,
           'remote_user': entry.remote_user,
           'timestamp': entry.request_time_fields["timestamp"],
           'request_line': entry.request_line,
           'status': entry.final_status,
           'bytes_sent': entry.bytes_sent,
           'referer': entry.headers_in["Referer"],
           'user-agent': entry.headers_in["User-agent"],
           'connection_status': entry.connection_status
         }

         ##### Insert the document.
         collection.insert_one(event)

         recordCount += 1
         if recordCount > lines:
           break

conn.close()

print("Finished.")

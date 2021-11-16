#!/usr/bin/env python3

import demo_settings
import bson
import pymongo
from datetime import datetime
from apachelogs import LogParser

parser = LogParser("%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" \"%X\"")

conn = pymongo.MongoClient(demo_settings.URI_STRING)
db = conn.DEMO
collection = db.apache_logs
print("Connected to MongoDB")

recordCount = 1
with open(demo_settings.IMPORT_FILE) as fp:  
     for entry in parser.parse_lines(fp):
         print("Inserting document", recordCount, "...")
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
         collection.insert_one(event)
         recordCount += 1
         if recordCount > demo_settings.NUM_LINES:
           break

conn.close()

print("Finished.")

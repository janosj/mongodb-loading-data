# mongofiles - example commands

DATABASE=gridFSdemo
HOST=<host-string>
USERNAME=<username>
PASSWORD=<password>

# Upload a file
# mongofiles --ssl --authenticationDatabase admin -d $DATABASE --host $HOST --username $USERNAME --password $PASSWORD put <FILENAME>

# Download a file 
# mongofiles --ssl --authenticationDatabase admin -d $DATABASE --host $HOST --username $USERNAME --password $PASSWORD get <FILENAME>

# Search
# mongofiles --ssl --authenticationDatabase admin -d $DATABASE --host $HOST --username $USERNAME --password $PASSWORD search Best_Practices

# List
mongofiles --ssl --authenticationDatabase admin -d $DATABASE --host $HOST --username $USERNAME --password $PASSWORD list "./UPLOAD_DOCS/AWS"

# Delete
# mongofiles --ssl --authenticationDatabase admin -d $DATABASE --host $HOST --username $USERNAME --password $PASSWORD delete <FILENAME>



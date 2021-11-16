# Convenience script that runs mongofiles without specifying connect options
# Send in the command using parameters 1 and 2.
# Example: ./mongofiles.sh put file1.doc

DATABASE=gridFSdemo
HOST=<host-string>
USERNAME=<username>
PASSWORD=<password>

mongofiles --ssl --authenticationDatabase admin -d $DATABASE --host $HOST --username $USERNAME --password $PASSWORD $1 $2


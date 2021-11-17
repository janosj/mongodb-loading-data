# Convenience script that runs mongofiles without specifying connect options
# Send in the command using parameters 1 and 2.
# Example: ./mongofiles.sh put sampleFiles/file1.doc

source ../../demo.conf

mongofiles $MDB_CONNECT_URI -d gridfsDB $1 $2


# mongofiles: Example commands

# Upload a file:   mongofiles $MDB_CONNECT_URI -d gridfsDB put <FILENAME>

# Download a file: mongofiles $MDB_CONNECT_URI -d gridfsDB get <FILENAME>

# Search:          mongofiles $MDB_CONNECT_URI -d gridfsDB search Best_Practices

# List:            mongofiles $MDB_CONNECT_URI -d gridfsDB list "./UPLOAD_DOCS/AWS"

# Delete:          mongofiles $MDB_CONNECT_URI -d gridfsDB delete <FILENAME>



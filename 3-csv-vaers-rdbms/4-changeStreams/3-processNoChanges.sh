source ../../demo.conf

# Make sure the change streams listener is running. 
# Illustrates that no changes = no activity.
# Then, modify the data file (e.g. add a new record)
# and observe the console.

mongoimport $MDB_CONNECT_URI --db=VAERS --collection=data --type=csv --headerline --file=./vaersData-NoChanges.csv --ignoreBlanks --mode=merge --upsertFields=VAERS_ID


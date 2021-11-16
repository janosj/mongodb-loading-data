source ../../demo.conf

# Listens for any changes to the VAERS.data collection
# and outputs the activity to the console.
# Uses Change Streams. Requires a replica set.

mongo $MDB_CONNECT_URI listen.js


source ../demo.conf

mongoimport $MDB_CONNECT_URI --db=DEMO --collection=remittances --file=Robust835.json


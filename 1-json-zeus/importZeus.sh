source ../demo.conf

mongoimport $MDB_CONNECT_URI --db=DEMO --collection=zeus --file=zeus-subset.json


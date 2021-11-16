source ../demo.conf

mongoimport $MDB_CONNECT_URI --db=DEMO --collection=ome-roi --file=ROI.ome.json


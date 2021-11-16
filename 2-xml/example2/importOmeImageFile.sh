source ../../demo.conf

mongoimport $MDB_CONNECT_URI --db=DEMO --collection=ome-image --file=single-image.ome.json


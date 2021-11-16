source ../demo.conf

mongoimport $MDB_CONNECT_URI --db=DEMO --collection=network --type=csv --headerline --file=./network10.csv


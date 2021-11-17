source ../demo.conf

python3 ./import.py --mongodbURI=$MDB_CONNECT_URI --inputFile=apache5k.log --lines=500


#!/bin/bash

# Utility script to import all files in a directory.

source ./demo.conf 

FILES=./datadir/*
for f in $FILES
do
  echo "Processing $f file..."
  mongoimport $MDB_CONNECT_URI --db=dbName --collection=collectionName --type=json --file=$f
done


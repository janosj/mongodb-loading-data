echo Converting docs to text using Apache Tika...  
time python ./python_tika_mongodb.py ../sampleFiles/ > sampleDocsConverted.json

echo Uploading converted docs to MongoDB using mongoimport...
time sed 's/\\n//g' ./sampleDocsConverted.json | mongoimport -d gridfsDB -c converted_text

echo Uploading original documents to MongoDB using mongofiles... 
time for f in ../sampleFiles/*; do n=$(basename $f) ;echo "To MongoDB GridFS: --> [\'${n}\'] "; mongofiles --quiet -d gridfsDB put $f ; done 

echo Done.

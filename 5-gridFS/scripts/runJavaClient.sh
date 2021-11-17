source ../../demo.conf

# Supply command arguement when calling this script.
# MDB_CONNECT_URI taken from demo.conf
# runJavaClient.sh <upload|download|ls|rename|delete|clean>

java -jar ../java-gridFs-client/java-gridFS-client.jar $1 $MDB_CONNECT_URI


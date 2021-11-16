source ../../demo.conf

# When merging documents, you want an index on the merge field.

mongo $MDB_CONNECT_URI --eval "
db = db.getSiblingDB('VAERS'); 
db.data.createIndex( { VAERS_ID: 1 }, { name: 'functional primary' } )"


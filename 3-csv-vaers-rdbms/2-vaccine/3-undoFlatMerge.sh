source ../../demo.conf

# Undoes the effects of the previous merge,
# to set the stage for modeling the vaccine data as a subdocument.

mongo $MDB_CONNECT_URI --eval "
db = db.getSiblingDB('VAERS'); 
db.data.updateMany( { }, [ { \$unset: [ 'VAX_TYPE', 'VAX_MANU', 'VAX_LOT', 'VAX_DOSE_SERIES', 'VAX_ROUTE', 'VAX_SITE', 'VAX_NAME' ] } ] )"


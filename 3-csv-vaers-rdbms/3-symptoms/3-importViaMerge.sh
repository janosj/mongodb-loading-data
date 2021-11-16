source ../../demo.conf

# Imports the symptom data as an embedded array of subdocuments 
# in the main document.

# Assumes a 1:1 relationship between main and vaccine,
# but if there are multiple records in the symptoms file then
# later records will overwrite the earlier records.

mongoimport $MDB_CONNECT_URI --db=VAERS --collection=data --type=csv --headerline --file=vaersSymptoms10.recoded.csv --ignoreBlanks --mode=merge --upsertFields=VAERS_ID --useArrayIndexFields



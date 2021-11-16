source ../../demo.conf

# Import the Vaccine CSV data file as a separate collection.

mongoimport $MDB_CONNECT_URI --db=VAERS --collection=vaccine --type=csv --headerline --file=vaersVaccine10.csv --ignoreBlanks



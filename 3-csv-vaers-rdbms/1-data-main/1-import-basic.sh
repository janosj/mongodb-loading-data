source ../../demo.conf

if [ -z "$MDB_CONNECT_URI" ]; then
  echo "MongoDB Connect URI not set.."
  echo "Check that MDB_CONNECT_URI is set in ../../demo.conf."
  echo "Exiting."
  exit 1
fi

# Import the main CSV data file.
# VAERS data sets are available here: https://vaers.hhs.gov/data/datasets.html?
# Download the 2021 Zip File and unzip the 3 CSV data files (data, Symptoms, and Vaccine)

mongoimport $MDB_CONNECT_URI --db=VAERS --collection=data --type=csv --headerline --file=./vaersData10.csv --ignoreBlanks


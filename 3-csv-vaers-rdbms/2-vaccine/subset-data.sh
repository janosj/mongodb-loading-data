# VAERS data sets are available here: https://vaers.hhs.gov/data/datasets.html?
# Download the 2021 Zip File and unzip the 3 CSV data files (data, Symptoms, and Vaccine)

# Uses just 10 records for illustrative purposes.

sed -n '1,11p' 2021VAERSVAX.csv > vaersVaccine10.csv


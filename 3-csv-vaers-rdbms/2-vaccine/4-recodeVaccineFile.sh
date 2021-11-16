# Recodes the CSV headerline to model the vaccine data as a subdocument in the main document.

cp vaersVaccine10.csv vaersVaccine10.recoded.csv

sed -i "" 's/VAX_/vaccine./g' vaersVaccine10.recoded.csv


SYMPTOMS_FILE=vaersSymptoms10.csv
RECODED_FILE=vaersSymptoms10.recoded.csv

# Recodes the CSV headerline to model the symptom data as an 
# embedded array of subdocuments in the main document.
# Assumes a 1:many relationship between main and vaccine,
# which seems evident from the multiple symptoms per record.
# Less evident is why they chose to hardcode a maxium of 5 symptoms 
# in a 1:many relationship. Also unclear is what it means when there are 
# multiple records (with multiple symptoms) in the symptoms file that 
# refer to the same VAERS ID.

cp $SYMPTOMS_FILE $RECODED_FILE

sed -i "" 's/SYMPTOM1/symptoms.0.symptom/g' $RECODED_FILE
sed -i "" 's/SYMPTOMVERSION1/symptoms.0.symptomVersion/g' $RECODED_FILE

sed -i "" 's/SYMPTOM2/symptoms.1.symptom/g' $RECODED_FILE
sed -i "" 's/SYMPTOMVERSION2/symptoms.1.symptomVersion/g' $RECODED_FILE

sed -i "" 's/SYMPTOM3/symptoms.2.symptom/g' $RECODED_FILE
sed -i "" 's/SYMPTOMVERSION3/symptoms.2.symptomVersion/g' $RECODED_FILE

sed -i "" 's/SYMPTOM4/symptoms.3.symptom/g' $RECODED_FILE
sed -i "" 's/SYMPTOMVERSION4/symptoms.3.symptomVersion/g' $RECODED_FILE

sed -i "" 's/SYMPTOM5/symptoms.4.symptom/g' $RECODED_FILE
sed -i "" 's/SYMPTOMVERSION5/symptoms.4.symptomVersion/g' $RECODED_FILE


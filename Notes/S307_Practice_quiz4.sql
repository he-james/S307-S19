--1  We want to figure out the average cost per patient, per day.  Recall we calculate the cost for
--each patient using dose (how much of the drug the patient received) and drug_cost (the cost per dose).
--To complete this query, output the patient name and the average cost per day (using the number of
--days a patient was in the hospital in your calculation). Call this field "Average Cost/Day".  Round this 
--to the nearest two decimal places.  WE want to narrow the results to any patient where the 
--"Average Cost/Day" is at least 100.  Order your output by "Average Cost/Day" ascending.



--2  Output the physician name, drug name, and the number of times the drug was used in a therapy.  
--Call this field "Number Prescribed".  We want to filter the results to show only drugs where the dose 
--given was at least as large as the average dose for all drugs.


--3  We want to identify the patients who are on the highest number of drugs.  If I were to look in the 
--theraoy table, I could see the patient's id number and the drug id for all of the drugs the patient is  
--given.  We are specifically looking for the top 3 patients (on the highest number of drugs).  There is a 
--tie, so the query needs to by dynamic enough to work even when there is a tie.  Your final output should be
--the patient name, the number of days the patient was in the hospital called "Length of Stay", and the patient's
--Age.  Round Age to the nearest whole number.


-- 4  We want to figure out the drug(s) that was given to the most patients.  Recall, when a drug is given to a patient, it is
--recorded in the therapy table. The patient id, and the drug id are both recorded in the therapy table, showing the patient
--received the drug.  Determine which drug(s) was given to the most patients (do not focus on dose but look at how many patients
--received the drug).  Once you've determined which drug was given to the most patients, your final output should be the name of 
--the patient, and how long the patient was in the hospital.  Call this field "Length of Stay".  Hint, more than 1 drug ties for
--the top drug given most often to patients.  Your query needs to be dynamic, so nothing hardcoded except the retrieval of the
--top 1 record where it is appropriate to do so.
--1  We want to figure out the average cost per patient, per day.  Recall we calculate the cost for
--each patient using dose (how much of the drug the patient received) and drug_cost (the cost per dose).
select p.patient_name, sum(t.dose * d.drug_cost)/datediff(day, v.admit_date ,v.discharge_date) as "Average Cost/Day"

--2  Output the physician name, drug name, and the number of times the drug was used in a therapy.  

select physician_name, drug_name, count(t.drug_id) as "Number Prescribed"


--3  We want to identify the patients who are on the highest number of drugs.  If I were to look in the 

select p.patient_name, datediff(day, v.admit_date, v.discharge_date) as "Length of Stay", datediff(year, dob, GetDate()) as "Age"


-- 4  We want to figure out the drug(s) that was given to the most patients.  Recall, when a drug is given to a patient, it is


select distinct patient_name, datediff(day, v.admit_date, v.discharge_date) as "Length of Stay"

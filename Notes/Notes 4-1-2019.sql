-- "Top 1 Item": HAVING >= ALL(subquery) or MAX()
-- Another option: HAVING = (subquery limit results to top 1)

-- Top 2, 3, 5, 10,... <--- will ALWAYS take two queries so it 
-- will work even with a tie

-- 1. Show patient names for the top 3 most expensive patients 
-- (therapy.dose * drug.drug_cost)
-- query must be dynamic


SELECT p.patient_name
FROM THERAPY t, DRUG d, PATIENT p
WHERE t.drug_id = d.drug_id and p.patient_id = t.patient_id
GROUP BY p.patient_name
HAVING SUM(t.dose * d.drug_cost) in (
	SELECT TOP 3 SUM(t.dose * d.drug_cost) AS [Cost] 
	FROM THERAPY t, DRUG d
	WHERE t.drug_id = d.drug_id
	GROUP BY t.patient_id
	ORDER BY SUM(t.dose * d.drug_cost) desc);

-- 2. Find the top 3 highest dosed patients
-- Then show the patient name for any patient in that list
-- Hint: this one has a tie.

SELECT p.patient_name 
FROM PATIENT p, THERAPY t
WHERE t.patient_id = p.patient_id
GROUP BY p.patient_name
HAVING SUM(t.dose) in (
	SELECT TOP 3 SUM(t.dose)
	FROM THERAPY t
	GROUP BY t.patient_id
	ORDER BY SUM(t.dose) desc);

-- 3. Find the top 3 most expensive drugs
-- Once found, output names of patients on these drugs 
-- by patient name descending

SELECT distinct p.patient_name
FROM PATIENT p, THERAPY t, DRUG d
WHERE p.patient_id = t.patient_id and t.drug_id = d.drug_id and d.drug_cost in (
SELECT TOP 3 drug_cost
FROM DRUG d
ORDER BY drug_cost desc) 
ORDER BY p.patient_name desc;
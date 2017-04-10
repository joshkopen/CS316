--Queries
--Find restaurants in WU
SELECT Name
FROM Restaurant
WHERE (Location = 'West Union');




--Find restaurants which serve pizza
SELECT Restaurant_name
FROM Serves
WHERE Food_name = 'Black Bean Soup';

--Find restaurants which are open on Mondays
SELECT Restaurant_name
FROM IsOpen
WHERE Day_of_the_week = 1;

--Find the phone number of Papa Johns
SELECT Phonenumber
FROM Merchant
WHERE Restaurant_name = 'Loop Pizza Grill';

--Find restaurants which close past 10 PM at least one day of the week
SELECT DISTINCT Restaurant_name
FROM IsOpen
WHERE Close_Time >= 22;

--Find all food with calories above 600
SELECT Name
FROM Food
WHERE Calories > 600;

--Find allergens which can be cured with an epipen
SELECT Type
FROM Allergens
WHERE Medication = 'epipen';
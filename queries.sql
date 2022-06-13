-- SQL queries performed on 'dog-and-owner-characteristics-predict-training-success' dataset

-- table creation
CREATE TABLE dog_training_success (
    id numeric, 
    owner_gender varchar(10),
    personality_extraversion_score real, 
    personality_stability_score real, 
    dog_sex varchar(10),
    dog_behavior_bennett_disobedient_score real, 
    dog_behavior_bennett_nervous_score real, 
    cgc_test varchar(10),
    PRIMARY KEY (id)
); 

-- COPY statement to import csv 
COPY dog_training_success FROM '/Users/shannongwie/Desktop/github/1_dog-and-owner-characteristics-predict-training-success/dog_owner.csv' DELIMITER ',' CSV HEADER;

-- 1. the total number of rows in the database
SELECT COUNT(*) FROM dog_training_success;

-- 2. show the first 15 rows, but only display 3 columns (your choice)
SELECT dog_sex, dog_behavior_bennett_disobedient_score, dog_behavior_bennett_nervous_score FROM dog_training_success 
LIMIT 15;

-- 3. do the same as above, but chose a column to sort on, and sort in descending order
SELECT id, dog_behavior_bennett_disobedient_score, dog_behavior_bennett_nervous_score FROM dog_training_success 
ORDER BY id DESC 
LIMIT 15;

-- 4. add a new column without a default value
ALTER TABLE dog_training_success
ADD New_Column real;
SELECT * FROM dog_training_success; 

-- 5. set the value of that new column
UPDATE dog_training_success
SET New_Column = 0;
SELECT * FROM dog_training_success;

-- 6. show only the unique (non duplicates) of a column of your choice
SELECT DISTINCT id FROM dog_training_success;

-- 7.group rows together by a column value (your choice) and use an aggregate function to calculate something about that group 
SELECT COUNT(id), personality_extraversion_score
FROM dog_training_success
GROUP BY personality_extraversion_score;

-- 8. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups 
SELECT COUNT(id), personality_extraversion_score
FROM dog_training_success
GROUP BY personality_extraversion_score
HAVING COUNT(id) > 9; 

-- 9. choose a column to sort on, sort in ascending order, show first 20 rows (smallest values)
SELECT id, personality_extraversion_score FROM dog_training_success 
ORDER BY id ASC 
LIMIT 20;

-- 10. show first record of the table
SELECT * FROM dog_training_success
LIMIT 1;  

-- 11. get the max of a selected column (personality_stability_score) 
SELECT MAX(personality_stability_score)
FROM dog_training_success;

-- 12. get the avg of a selected column (personality_extraversion_score)
SELECT AVG(personality_extraversion_score)
FROM dog_training_success;

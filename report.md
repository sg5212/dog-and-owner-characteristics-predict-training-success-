# Overview

- Title: Dog and owner characteristics predict training success
- Link to Data: https://osf.io/3p5vx/
- Format: CSV
- Size: 16KB
- Source / Origin:
    Author or Creator: Jeffrey R Stevens London Wolff
    Publication Date: 2020-07-10
    Publisher: Open Science Framework (OSF)
    Version or Data Accessed: stevens_etal_2020_data1
- License: CC-By Attribution 4.0 International

- Number of Records: 99
- Number of Columns: 37
- Columns: id, date, class, dog age, dog sex, dog neutered, owner gender, time trained a week, measures of dog behavior, measures of owner personality, and test scores 
- Expected types: ints, floats, strings

# Table Design

Primary Key: id column

The field I will be using for a primary key will be the id column which has 99 unique values to represent each row (each dog); therefore, there are no null values and duplicate values. 

For the null values in other columns, I took them out using pandas in the 'convert.ipynb' file and replaced them with an empty string.

# Import

Selected the 7 columns plus id column (primary key) used in hw03. Selected these columns through pandas in 'part3_dataframe.ipynb.' Updated .csv file is 'dog_owner.csv.'

Import succeeded. 

# Database Information

1. show all of databases in your postgres instance

                                  List of databases
    Name    |    Owner    | Encoding | Collate | Ctype |      Access privileges      
------------+-------------+----------+---------+-------+-----------------------------
 homework06 | shannongwie | UTF8     | C       | C     | 
 postgres   | shannongwie | UTF8     | C       | C     | 
 template0  | shannongwie | UTF8     | C       | C     | =c/shannongwie             +
            |             |          |         |       | shannongwie=CTc/shannongwie
 template1  | shannongwie | UTF8     | C       | C     | =c/shannongwie             +
            |             |          |         |       | shannongwie=CTc/shannongwie


2. (making sure you're connected to homework04 database) show all of the tables in your database

                  List of relations
 Schema |         Name         | Type  |    Owner    
--------+----------------------+-------+-------------
 public | dog_training_success | table | shannongwie
(1 row)

3. finally, show some information about the table you created and imported data into: find a way to show its columns, types and constraints (hint: describe the table)

 Table "public.dog_training_success"
                 Column                 |         Type          | Collation | Nullable | Default 
----------------------------------------+-----------------------+-----------+----------+---------
 id                                     | numeric               |           | not null | 
 owner_gender                           | character varying(10) |           |          | 
 personality_extraversion_score         | real                  |           |          | 
 personality_stability_score            | real                  |           |          | 
 dog_sex                                | character varying(10) |           |          | 
 dog_behavior_bennett_disobedient_score | real                  |           |          | 
 dog_behavior_bennett_nervous_score     | real                  |           |          | 
 cgc_test                               | character varying(10) |           |          | 
Indexes:
    "dog_training_success_pkey" PRIMARY KEY, btree (id)



# Query Results

1. the total number of rows in the database
 count 
-------
    99
(1 row)

2. show the first 15 rows, but only display 3 columns (your choice)
 dog_sex | dog_behavior_bennett_disobedient_score | dog_behavior_bennett_nervous_score 
---------+----------------------------------------+------------------------------------
 Male    |                                  -0.05 |                               0.14
 Male    |                                  -0.18 |                               0.65
         |                                        |                                   
 Female  |                                   0.15 |                              -0.38
         |                                        |                                   
 Female  |                                  -0.26 |                              -0.39
 Female  |                                  -0.89 |                              -0.56
         |                                        |                                   
 Male    |                                  -0.17 |                              -1.06
 Male    |                                  -0.42 |                               0.82
 Female  |                                   0.53 |                              -0.17
         |                                        |                                   
         |                                        |                                   
 Male    |                                  -0.26 |                              -0.56
         |                                        |                                   
(15 rows)

3. do the same as above, but chose a column to sort on, and sort in descending order
 id | dog_behavior_bennett_disobedient_score | dog_behavior_bennett_nervous_score 
----+----------------------------------------+------------------------------------
 99 |                                    0.3 |                              -0.83
 98 |                                    0.1 |                                0.3
 97 |                                    0.5 |                              -0.54
 96 |                                        |                                   
 95 |                                        |                                   
 94 |                                        |                                   
 93 |                                        |                                   
 92 |                                        |                                   
 91 |                                        |                                   
 90 |                                  -0.52 |                               0.48
 89 |                                        |                                   
 88 |                                        |                                   
 87 |                                        |                                   
 86 |                                   0.29 |                              -1.06
 85 |                                   -0.2 |                               1.16
(15 rows)

4. add a new column without a default value -> showing only first 15 rows
 id | owner_gender | personality_extraversion_score | personality_stability_score | dog_sex | dog_behavior_bennett_disobedient_score | dog_behavior_bennett_nervous_score | cgc_test | new_column 
----+--------------+--------------------------------+-----------------------------+---------+----------------------------------------+------------------------------------+----------+------------
  1 | Female       |                              2 |                           5 | Male    |                                  -0.05 |                               0.14 | Pass     | 
  2 | Female       |                            3.5 |                           4 | Male    |                                  -0.18 |                               0.65 | Pass     | 
  3 |              |                                |                             |         |                                        |                                    |          | 
  4 | Female       |                              3 |                         3.5 | Female  |                                   0.15 |                              -0.38 | Pass     | 
  5 |              |                                |                             |         |                                        |                                    |          | 
  6 | Female       |                            4.5 |                           6 | Female  |                                  -0.26 |                              -0.39 |          | 
  7 | Female       |                            3.5 |                           5 | Female  |                                  -0.89 |                              -0.56 |          | 
  8 |              |                                |                             |         |                                        |                                    | Pass     | 
  9 | Female       |                              4 |                         5.5 | Male    |                                  -0.17 |                              -1.06 | Pass     | 
 10 | Female       |                            2.5 |                         3.5 | Male    |                                  -0.42 |                               0.82 |          | 
 11 | Female       |                            4.5 |                         4.5 | Female  |                                   0.53 |                              -0.17 |          | 
 12 |              |                                |                             |         |                                        |                                    |          | 
 13 |              |                                |                             |         |                                        |                                    | Fail     | 
 14 | Female       |                            4.5 |                           6 | Male    |                                  -0.26 |                              -0.56 | Pass     | 
 15 |              |                                |                             |         |                                        |                                    |          | 

5. set the value of that new column -> showing only first 15 rows
 id | owner_gender | personality_extraversion_score | personality_stability_score | dog_sex | dog_behavior_bennett_disobedient_score | dog_behavior_bennett_nervous_score | cgc_test | new_column 
----+--------------+--------------------------------+-----------------------------+---------+----------------------------------------+------------------------------------+----------+------------
  1 | Female       |                              2 |                           5 | Male    |                                  -0.05 |                               0.14 | Pass     |          0
  2 | Female       |                            3.5 |                           4 | Male    |                                  -0.18 |                               0.65 | Pass     |          0
  3 |              |                                |                             |         |                                        |                                    |          |          0
  4 | Female       |                              3 |                         3.5 | Female  |                                   0.15 |                              -0.38 | Pass     |          0
  5 |              |                                |                             |         |                                        |                                    |          |          0
  6 | Female       |                            4.5 |                           6 | Female  |                                  -0.26 |                              -0.39 |          |          0
  7 | Female       |                            3.5 |                           5 | Female  |                                  -0.89 |                              -0.56 |          |          0
  8 |              |                                |                             |         |                                        |                                    | Pass     |          0
  9 | Female       |                              4 |                         5.5 | Male    |                                  -0.17 |                              -1.06 | Pass     |          0
 10 | Female       |                            2.5 |                         3.5 | Male    |                                  -0.42 |                               0.82 |          |          0
 11 | Female       |                            4.5 |                         4.5 | Female  |                                   0.53 |                              -0.17 |          |          0
 12 |              |                                |                             |         |                                        |                                    |          |          0
 13 |              |                                |                             |         |                                        |                                    | Fail     |          0
 14 | Female       |                            4.5 |                           6 | Male    |                                  -0.26 |                              -0.56 | Pass     |          0
 15 |              |                                |                             |         |                                        |                                    |          |          0

6. show only the unique (non duplicates) of a column of your choice
 id 
----
 29
 14
  3
 74
 91
 64
 52
 77
 37
 82
 84
 92
 18
 60
 21
 31
 23
 26
 24
 47
 51
 22
 48
  1
 57
  4
 72
  9
 13
 56
 49
 79
 88
 66
 87
 61
 65
 27
 68
  6
 44
 46
 85
 80
 81
 53
 16
 63
 10
 75
  8
 70
 55
 19
 17
  7
 73
 34
 78
 39
 76
 95
 58
 25
 59
 28
  2
 11
 83
 41
 30
 15
 94
 62
 54
 12
 89
 96
 40
 45
 43
 69
 42
 99
 71
 98
 90
 67
 20
  5
 93
 50
 38
 32
 97
 86
 36
 35
 33
(99 rows)

7. group rows together by a column value (your choice) and use an aggregate function to calculate something about that group (count of all members of the group, the average of a column of the members of the group)
    show the column that is used for grouping AND the result of the aggregate function (so, 2 columns minimum on output)

 count | personality_extraversion_score 
-------+--------------------------------
     4 |                            2.5
     4 |                              2
    10 |                              5
     2 |                            5.5
    36 |                               
    10 |                              3
    11 |                            3.5
     7 |                              4
    10 |                            4.5
     5 |                              6
(10 rows)

8. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups (for example, show all genres that have more than 2 movies in it and only show the genre and the number of movies for that genre).
    you'll use a HAVING clause to do this (covered in the slides on group by)

 count | personality_extraversion_score 
-------+--------------------------------
    10 |                              5
    36 |                               
    10 |                              3
    11 |                            3.5
    10 |                            4.5
(5 rows)


9.choose a column to sort on, sort in ascending order, show first 20 rows (smallest values)

 id | personality_extraversion_score 
----+--------------------------------
  1 |                              2
  2 |                            3.5
  3 |                               
  4 |                              3
  5 |                               
  6 |                            4.5
  7 |                            3.5
  8 |                               
  9 |                              4
 10 |                            2.5
 11 |                            4.5
 12 |                               
 13 |                               
 14 |                            4.5
 15 |                               
 16 |                               
 17 |                              3
 18 |                               
 19 |                               
 20 |                            4.5
(20 rows)

10. show first record of the table
 id | owner_gender | personality_extraversion_score | personality_stability_score | dog_sex | dog_behavior_bennett_disobedient_score | dog_behavior_bennett_nervous_score | cgc_test | new_column 
----+--------------+--------------------------------+-----------------------------+---------+----------------------------------------+------------------------------------+----------+------------
  1 | Female       |                              2 |                           5 | Male    |                                  -0.05 |                               0.14 | Pass     |          0
(1 row)

11. get the highest personality_stability_score
 max 
-----
   6
(1 row)

12. get the avg of a selected column (personality_extraversion_score)
        avg         
--------------------
 3.9761904761904763
(1 row)
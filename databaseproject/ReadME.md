# Final Project

- This project I completed all SQL queries to list the 
- expected outcomes from the PDF file. I dumped the database
- into a file called hospitaldb.sql and my python script is 
- called hospitaldb.py. 

# Extra Credit
- I used the python sqlite3 database API. This script uses the 
- sqlite3 library and pandas to read in csv files and make 
- each file into its own table to then use SQL on each
- table to query using a cursor object. 

# How to run
- To execute the program you can type 'python3 hospitaldb.py'
- on the command line and this will execute all queries in the 
- file with the expected outputs. 
  
- Note: Will print out first 4 questions immediately but takes a second or 2 to print the rest 


# Problems
- Question 1: I believe I have the right query for some reason I only get 1 of the 2 doctors
- Quetion 2: I print out all patients and test results of cancer but my program prints them 
- over and over but I got the right output
  
# Queries / Outputs
- Question 1: select d.d_name from doctors d join p_assignment pa on d.d_id = pa.d_id join    patients p on pa.p_id = p.p_id where p.p_name = "RICHARD MILLER";

- OutPut: "WILLIAM BROWN" , PATRICIA JOHNSON


- Question 2: SELECT P.P_NAME, P.P_ID, P.P_DISEASE, T.T_NAME, T.T_RESULT FROM TESTS T JOIN PATIENTS P ON T.P_ID = SUBSTR(P.P_ID, -4) WHERE P.P_DISEASE LIKE "%Cancer%"

- Output: "MARK WHITE",000001008,"Prostate Cancer",Test29,Negative
- "HELEN HARRIS",000001029,Cancer,Test48,Positive
- "SANDRA MARTIN",000001030,"Bladder Cancer",Test4,Positive


- Question 3: select i_name from instruments where i_manufacturer like "S%"
- OutPut: Instrument9,


- Question 4: SELECT d_name FROM DOCTORS GROUP BY D_YEARS_OF_EXPERIENCE ORDER BY D_YEARS_OF_EXPERIENCE DESC LIMIT 1,1
  
- Output: "ELIZABETH BROWN"


- Question 5: select p_name from patients where p_id in (select p_id from p_assignment where d_id in (select d_id from doctors where d_name = "JAMES SMITH" and d_street = p_street and d_city = p_city))

- Output: "BETTY WHITE"


- Question 6: SELECT N.N_NAME, COUNT(DISTINCT NA.D_ID) AS Doctors_Assisted FROM NURSES N JOIN N_ASSISTS NA ON N.N_ID = NA.N_ID GROUP BY N.N_NAME HAVING COUNT(DISTINCT NA.D_ID) >= 2'

- Output: "CAROL GARCIA",2
- "JENNIFER DAVIS",3
- "MARGARET MOORE",2
- "MARIA MILLER",2
- "MICHELLE CLARK",3
- "SANDRA MARTIN",2
- "SHARON ROBINSON",2
- "SOLINDA WILLIAMS",3


- Question 7:SELECT D.D_NAME, COUNT(DISTINCT NA.N_ID) AS Nurses_Count FROM DOCTORS D JOIN N_ASSISTS NA ON D.D_ID = NA.D_ID GROUP BY D.D_NAME ORDER BY Nurses_Count DESC;

- Output: "PATRICIA JOHNSON",5
- "ELIZABETH BROWN",4
- "WILLIAM BROWN",3
- "ROBERT WILLIAMS",3
- "MICHAEL JONES",3
- "JOHN JOHNSON",3
- "JAMES SMITH",3
- "MARY SMITH",2
- "LINDA WILLIAMS",2
- "BARBARA JONES",2


- Question 8: select n_name from nurses,doctors WHERE n_specialization != d_specialization
- Output: "MARY SMITH"
  
- Question 9: UPDATE doctors SET D_YEARS_OF_EXPERIENCE = D_YEARS_OF_EXPERIENCE + 5 WHERE D_GENDER = "f"
- Output:
- (8, 'BARBARA JONES', 'f', 45, 'Neurosurgery', 24, '617-314-5667', 'Himrod Street', 'Woburn')
- (9, 'ELIZABETH BROWN', 'f', 57, 'Pediatrics', 36, '617-314-8264', 'Lee Avenue', 'Woburn')
- (5, 'MARY SMITH', 'f', 36, 'Internal medicine', 15, '978-930-3316', 'Homecrest Avenue'  'Lowell')
- (6, 'PATRICIA JOHNSON', 'f', 31, 'Obstetrics and gynaecology', 10, '978-930-9517', 'Whitney Avenue', 'Lowell')
- (7, 'LINDA WILLIAMS', 'f', 54, 'Cardiothoracic anesthesiology', 33, '978-930-9485', 'Lee Avenue', 'Lowell')

- Question 10: delete from tests where t_result = "Negative"
- Output: 0 negative tests
import pandas as pd
import sqlite3

# CONNECT TO HOSPITAL.DB
conn = sqlite3.connect('HOSPITAL.db')

# CURSOR OBJECTS THAT WILL INVOKE SQL METHODS
cur = conn.cursor()

# READ IN DOCTORS.CSV FILE AND TURN INTO SQL TABLE CALLED DOCTORS
doctors = pd.read_csv('DataFiles/doctors.csv')
doctors.to_sql('doctors', conn, if_exists='append', index=False)

# READ IN INSTRUMENTS.CSV FILE AND TURN INTO SQL TABLE CALLED INSTRUMENTS
instruments = pd.read_csv('DataFiles/instruments.csv')
instruments.to_sql('instruments', conn, if_exists='append', index=False)

# READ IN N_ASSISTS.CSV FILE AND TURN INTO SQL TABLE CALLED N_ASSISTS
n_assists = pd.read_csv('DataFiles/n_assists.csv')
n_assists.to_sql('n_assists', conn, if_exists='append', index=False)

# READ IN NURSES.CSV FILE AND TURN INTO SQL TABLE CALLED NURSES
nurses = pd.read_csv('DataFiles/nurses.csv')
nurses.to_sql('nurses', conn, if_exists='append', index=False)

# READ IN P_ASSIGNMENT.CSV FILE AND TURN INTO SQL TABLE CALLED P_ASSIGNMENT
p_assignment = pd.read_csv('DataFiles/p_assignment.csv')
p_assignment.to_sql('p_assignment', conn, if_exists='append', index=False)

# READ IN PATIENTS.CSV FILE AND TURN INTO SQL TABLE CALLED PATIENTS
patients = pd.read_csv('DataFiles/patients.csv')
patients.to_sql('patients', conn, if_exists='append', index=False)

# READ IN TESTS.CSV FILE AND TURN INTO SQL TABLE CALLED TESTS
tests = pd.read_csv('DataFiles/tests.csv')
tests.to_sql('tests', conn, if_exists='append', index=False)

# 1.List all the doctors RICHARD MILLER is consulting
cur.execute('select d.d_name from doctors d join p_assignment pa on d.d_id = pa.d_id join patients p on pa.p_id = p.p_id where p.p_name = "RICHARD MILLER"; ')
one_output = cur.fetchmany(2)
print("QUESTION 1 OUTPUT:\n")
print(one_output)



print('\n')

# 2.Find all the test results of cancer patients.(Note: There may be different type of cancer)
cur.execute('SELECT P.P_NAME, P.P_ID, P.P_DISEASE, T.T_NAME, T.T_RESULT FROM TESTS T JOIN PATIENTS P ON T.P_ID = SUBSTR(P.P_ID, -4) WHERE P.P_DISEASE LIKE "%Cancer%";')
two_output = cur.fetchall()
print("QUESTION 2 OUTPUT:\n")

for row in two_output:
        print(row)
        


print('\n')
# 3.List all the instruments produced by a manufacturer whose name starts with "S".
cur.execute('select i_name from instruments where i_manufacturer like "S%"')
three_output = cur.fetchmany(1)
print("QUESTION 3 OUTPUT:\n", three_output)

print('\n')

# 4.Find the most experienced doctor in the hospital
cur.execute('SELECT d_name FROM DOCTORS GROUP BY D_YEARS_OF_EXPERIENCE ORDER BY D_YEARS_OF_EXPERIENCE DESC LIMIT 1,1')
four_output = cur.fetchall()
print("QUESTION 4 OUTPUT:\n", four_output)

print('\n')

# 5.List all the patients of doctor JAMES SMITH who live in the same street and same city as him
cur.execute('select p_name from patients where p_id in (select p_id from p_assignment where d_id in (select d_id from doctors where d_name = "JAMES SMITH" and d_street = p_street and d_city = p_city))')
five_output = cur.fetchmany(1)
print("QUESTION 5 OUTPUT: \n", five_output)

print('\n')

# 6.Find the nurses who assist at least two doctors. Display nurse name and the number of doctors he/she is assisting
cur.execute('SELECT N.N_NAME, COUNT(DISTINCT NA.D_ID) AS Doctors_Assisted FROM NURSES N JOIN N_ASSISTS NA ON N.N_ID = NA.N_ID GROUP BY N.N_NAME HAVING COUNT(DISTINCT NA.D_ID) >= 2')
six_output = cur.fetchall()
print('QUESTION 6 OUTPUT:')
for row in six_output:
        print(row)

print('\n')

# 7.List the doctors and the number of nurses they have in the descending order of their number.
cur.execute('SELECT D.D_NAME, COUNT(DISTINCT NA.N_ID) AS Nurses_Count FROM DOCTORS D JOIN N_ASSISTS NA ON D.D_ID = NA.D_ID GROUP BY D.D_NAME ORDER BY Nurses_Count DESC;')
seven_output = cur.fetchall()
print("QUESTION 7 OUTPUT:")

for i in seven_output:
        print(i)

print('\n')

# 8.Find all the nurses who are not assigned to any doctors.
cur.execute('select n_name from nurses,doctors WHERE n_specialization != d_specialization')
eight_output = cur.fetchmany(1)
print("QUESTION 8 OUTPUT:\n",eight_output)

print('\n')

# 9.Increment years of experience of all the female doctors by 5.
cur.execute('UPDATE doctors SET D_YEARS_OF_EXPERIENCE = D_YEARS_OF_EXPERIENCE + 5 WHERE D_GENDER = "f"')
print("QUESTION 9: Successful incrementing female doctor experience years")

print('\n')

# 10.Delete all the tests whose result is negative.
cur.execute('delete from tests where t_result = "Negative"')
print("QUESTION 10: All negative tests deleted!")

print('\n')
# CLOSE THE CONNECTION
conn.close()




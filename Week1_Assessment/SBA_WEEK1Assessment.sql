--Table Sailors
CREATE TABLE sailors(
S_ID NUMBER(4) PRIMARY KEY,
S_NAME VARCHAR2(30),
RATING NUMBER(2) UNIQUE,
AGE DECIMAL(4,1)
);
/

--Table boats
CREATE TABLE boats(
B_ID NUMBER(4) PRIMARY KEY,
B_NAME VARCHAR2(30),
COLOR VARCHAR2(10)
);
/


--Table Reserves
CREATE TABLE reserves(
S_ID NUMBER(4) REFERENCES sailors (S_ID),
B_ID NUMBER(4) REFERENCES boats (B_ID),
Day1 DATE,
CONSTRAINT PK_COM PRIMARY KEY(S_ID, B_ID)
);
/

--Inserting Data in the Sailors table
INSERT INTO sailors VALUES (22, 'Dustin', 7, 48.0);
INSERT INTO sailors VALUES (29, 'Brutus', 1, 33.0);
INSERT INTO sailors VALUES (31, 'Lubber', 9, 55);
INSERT INTO sailors VALUES (32, 'Andy', 8, 25.0);
INSERT INTO sailors VALUES (58, 'Rusty', 10, 35);

--Inserting Data in the boats table
INSERT INTO boats VALUES (101, 'Interlake', 'Blue');
INSERT INTO boats VALUES (102, 'Interlake', 'Red');
INSERT INTO boats VALUES (103, 'Clipper', 'Green');
INSERT INTO boats VALUES (104, 'Marine', 'Red');

--Inserting Data in the reserves table
INSERT INTO reserves VALUES (22, 101, TO_DATE('01/01/2004','DD/MM/YYYY'));
INSERT INTO reserves VALUES (22, 102, TO_DATE('01/01/2004','DD/MM/YYYY'));
INSERT INTO reserves VALUES (22, 103, TO_DATE('01/02/2004','DD/MM/YYYY'));
INSERT INTO reserves VALUES (31, 103, TO_DATE('05/05/2005','DD/MM/YYYY'));
INSERT INTO reserves VALUES (32, 104, TO_DATE('07/04/2005','DD/MM/YYYY'));

--DISPLAYING DATA FROM ALL THE TABLES
SELECT * FROM sailors;
SELECT * FROM boats;
SELECT * FROM reserves;

--QUESTION 2
--a. Find the names of sailors who have reserved a red boat. (QUERY RESULT 3)
SELECT s.S_NAME
FROM sailors s
INNER JOIN reserves r ON s.S_ID = r.S_ID
WHERE r.B_ID IN (SELECT B_ID FROM boats WHERE color = 'Red');

--b. Find the names of the Sailors who have reserved at least one boat
SELECT DISTINCT s.S_NAME
FROM sailors s
JOIN reserves r ON s.S_ID = r.S_ID;

--c. Find the ages of sailors whose name begins and ends with B and has at least 3 characters.
SELECT S_NAME 
FROM sailors
WHERE S_NAME LIKE 'B_%B';

--d. Find the names of sailors who have reserved a red and a green boat.
SELECT DISTINCT s.S_NAME
FROM sailors s
INNER JOIN reserves r ON s.S_ID = r.S_ID
WHERE r.B_ID IN (SELECT B_ID FROM boats WHERE color = 'Red' OR color = 'Green');
	
--QUESTION3. Create a trigger to restrict any DML on RESERVES table on MON and WEDNESDAY.
CREATE OR REPLACE TRIGGER trig_res
BEFORE INSERT OR UPDATE OR DELETE ON reserves
BEGIN
    IF TO_CHAR(SYSDATE, 'dy') IN ('MON', 'WED') THEN
        RAISE_APPLICATION_ERROR(-20323, 'Cannot manipulate data on Monday and Wednesday');
    end if;
END;
/



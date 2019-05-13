CREATE TABLE COM (
COM_NO NUMBER(10) PRIMARY KEY,
COM_NAME VARCHAR2(30),
COM_EXP VARCHAR2(4000),
COM_ST DATE,
COM_END DATE
);

SELECT * FROM COM WHERE COM_NAME LIKE = '%?%';

SELECT * FROM COM A RIGHT OUTER JOIN CP_COMNO B ON A.COM_NO = B.CP_COMNO;

INSERT INTO COM VALUES (?,?,?);

DELETE COM WHERE COM_NO = ?;
DELETE COM WHERE COM_NAME LIKE = '%?%'

UPDATE COM SET COM_NAME = ? WHERE COM_NO = ?;
UPDATE COM SET COM_ST = ? WHERE COM_NO = ?;
UPDATE COM SET COM_END = ? WHERE COM_NO = ?;
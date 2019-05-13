
CREATE TABLE CO (
CO_NO NUMBER(10) PRIMARY KEY, 
CO_CL VARCHAR2(100),
CO_NAME VARCHAR2(100) NOT NULL, 
CO_EXP VARCHAR2(4000) NOT NULL,
CO_URL VARCHAR2(100), 
CO_ST DATE, 
CO_END DATE, 
CO_LO NUMBER(10)
);


INSERT INTO CO values(SEQ_02.NEXTVAL,'www','www','www','2019-04-01','2019-04-04',0);
INSERT INTO values (?,?,?,?,?,?,?);
SELECT * FROM CO;
SELECT * FROM CO WHERE CO_NAME LIKE '%?%';
SELECT * FROM CO WHERE CO_URL LIKE '%?%';
SELECT * FROM CO WHERE CO_CL IN (?,?,?);
SELECT * FROM CO WHERE CO_ST.MONTH = ?;
SELECT * FROM CO WHERE CO_END.MONTH = ?;

SELECT * FROM CO A LEFT OUTER JOIN PM B ON A.CO_NO = B.PM_CONO;


SELECT * FROM CO;

CREATE SEQUENCE SEQ_02 
START WITH 1
INCREMENT BY 1;

INSERT INTO  values (?,?,?,?,?,?,?);

DELETE CO WHERE CO_NO = ?;
delete from co;

UPDATE CO SET CO_CL = ? WHERE CO_NAME = ?;
UPDATE CO SET CO_NAME = ? WHERE CO_NAME = ?;
UPDATE CO SET CO_EXP = ? WHERE CO_NAME = ?;
UPDATE CO SET CO_URL = ? WHERE CO_NAME = ?;
UPDATE CO SET CO_ST = ? WHERE CO_NAME = ?;
UPDATE CO SET CO_END = ? WHERE CO_NAME = ?;
UPDATE CO SET CO_CH = ? WHERE CO_NAME = ?;

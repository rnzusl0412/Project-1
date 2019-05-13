 CREATE TABLE BBS (
 	BBS_NO NUMBER(20), 
 	BBS_TIT VARCHAR2(100), 
 	BBS_USER VARCHAR2(30), 
 	BBS_DATE DATE, 
 	BBS_CON VARCHAR2(2000), 
 	BBS_UP NUMBER(10), 
 	BBS_DO NUMBER(10)
 	);
 	
select * from bbs;

drop table bbs;

CREATE SEQUENCE BBSNO 
START WITH 1
INCREMENT BY 1;

DROP SEQUENCE BBSNO;

INSERT INTO BBS VALUES (BBSNO.NEXTVAL,'湲��젣紐�','userID',sysdate,'肄섑뀗痢좉�',0,0);  
select * from BBS;

delete from BBS;
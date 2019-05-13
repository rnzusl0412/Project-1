package bbs.dao;

/*CREATE TABLE BBS (
BBS_CO NUMBER(10) NOT NULL,
BBS_NO NUMBER(10) PRIMARY KEY, 
BBS_TIT VARCHAR2(100) NOT NULL, 
BBS_USER VARCHAR2(30), 
BBS_DATE DATE, 
BBS_CON VARCHAR2(2000) NOT NULL, 
BBS_LO NUMBER(10),
BBS_FILE VARCHAR(30)
);*/

public interface IBbs {


	String all_bbs = "select * from bbs";
	String insert_bbs = "insert into bbs values(?,seq_01.NEXTVAL,?,?,sysdate,?,0,?)";
	String select_bbs = "select * from bbs where bbs_no = ?";
	String update_bbs = "update bbs set bbs_tit = ?, bbs_con = ? ,bbs_file =? where bbs_no = ? and bbs_user = ?";
	String delete_bbs = "delete bbs where bbs_no = ?";
	String update_bbs_lo = "update bbs set bbs_lo = bbs_lo+1 where bbs_no = ?";
	
	String all_bbs_re = "select * from bbs a left outer join re b on a.bbs_no = b.re_bno";
	String select_bbs_re = "select * from bbs a left outer join re b on a.bbs_no = b.re_bno where a.bbs_no = ?";	
	
}

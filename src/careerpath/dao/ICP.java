package careerpath.dao;

public interface ICP {

	
	String insert_cp_pm = "INSERT INTO CP(CP_ID,CP_NO,CP_PMNO) VALUES (?,SEQ_CP.NEXTVAL,?)";
	String select_cp_myteam = "select * from CP where CP_PMNO = ?";
	String select_cp = "select * from CP where CP_ID = ?";
	String selelct_cp_myteam_customer = "select * from customer where C_ID = ?";

	
	
	String select_limit_member = "select PM_LIMITM from PM WHERE PM_NO = ?";
	String select_pm_myteam = "SELECT B.PM_NO,C.CO_NAME,B.PM_TEAM FROM CP A LEFT OUTER JOIN PM B ON A.CP_PMNO = B.PM_NO LEFT OUTER JOIN CO C ON B.PM_CONO = C.CO_NO WHERE A.CP_ID = ?";
								//
}

package cont.dao;

public interface IPm {

	String all_pm = "SELECT * FROM PM";
	String select_pm = "SELECT * FROM PM WHERE PM_NO=?";
	String select_pm_co = "SELECT * FROM PM WHERE PM_CONO = ? and PM_LEADER_ID = ?";
	String insert_pm = "INSERT INTO PM values(SEQ_03.NEXTVAL,?,?,?,sysdate,?,0,?,?,?,?,?,?,0)";
	String delete_pm = "DELETE FROM PM WHERE PM_NO = ?";
	String update_pm = "UPDATE PM SET PM_TEAM = ?,PM_LIMITM = ?, PM_CONO = ?, PM_PRIMARY = ?, PM_FUNC = ? , PM_EFFECT = ?, PM_REQSK = ?, PM_ACCSK = ? WHERE PM_NO = ?";
	String update_pm_lo = "UPDATE PM SET PM_LO = PM_LO+1 WHERE PM_NO = ?";
	
	String insert_cp_pm = "INSERT INTO CP(CP_ID,CP_NO,CP_PMNO) VALUES (?,SEQ_CP.NEXTVAL,?)";
	
	String count_pm_member = "SELECT count(*) FROM CP WHERE CP_PMNO = ?";
}

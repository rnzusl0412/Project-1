package cont.dao;

public interface IPmRe {

	
	String all_pmre = "select * from pmre where PMRE_PMNO = ? order by PMRE_NO";
	String insert_pmre = "insert into pmre values (pmreno.nextval,?,?,?,sysdate)";
	String delete_pmre = "delete from pmre where PMRE_NO = ?";
	
}

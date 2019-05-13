package re.dao;

public interface IRe {
	String all_re = "select * from re";
	
	String select_re = "select * from re where re_bno = ? order by re_no";
	String select_re01 = "select * from re_id = ? and re_bno = ?";
	
	String insert_re = "insert into re values (reno.nextval,?,?,?,sysdate)";
	
	String delete_re = "delete from re where re_no = ?";
	
	String update_re = "update re set re_exp = ? where re_no = ?";
	
}

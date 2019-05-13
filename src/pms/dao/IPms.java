package pms.dao;

public interface IPms {
	String all_pms = "select * from pms where pms_pmno = ?";	
	
	String insert_pms = "insert into pms (pms_seq,?,?,?,?,?)";
	
	String delete_pms = "delete form pms where pms_no = ?";
	
	String update_pms = "update pms set (pms_id, pms_st, pms_end) = (?,?,?) where pms_no = ?";
}

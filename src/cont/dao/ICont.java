package cont.dao;



public interface ICont {

	String insert_cont = "INSERT INTO CO values(SEQ_02.NEXTVAL,?,?,?,?,?,0)";
	String all_cont = "SELECT * FROM CO";
	String delete_cont = "DELETE FROM CO WHERE CO_NO = ?";
	String select_cont = "SELECT * FROM CO WHERE CO_NO = ?";
	String update_cont = "UPDATE CO SET CO_NAME = ?,CO_EXP = ?, CO_URL = ?, CO_ST = ?, CO_END = ? WHERE CO_NO = ?";
		
	
}

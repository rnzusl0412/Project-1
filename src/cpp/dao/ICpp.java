package cpp.dao;

public interface ICpp {
	String all_cpp = "SELECT * FROM CP A LEFT OUTER JOIN CPP B ON A.CP_CPPNO = B.CPP_NO WHERE A.CP_ID = ?";
	String insert_cpp = "INSERT INTO CPP VALUES (cpp_seq,?,?,?,?)";
	String delete_cpp = "DELETE CPP WHERE CPP_NO = ?";
	String update_cpp = "UPDATE CPP SET (CPP_NAME, CPP_ST, CPP_END, CPP_EXP) = (?,?,?,?) WHERE CPP_NO = ?";
}

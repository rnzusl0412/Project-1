package com.dao;

public interface ICom {
	String all_com = "select * from com where com_id = ?";
	String insert_com = "insert into com values (com_seq,?,?,?,?)";
	String delete_com = "delete from com where com_no = ?";
	String update_com = "update com set com_name = ?, com_st = ?, com_end = ? where com_no = ?";
}

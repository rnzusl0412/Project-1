package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.entity.ComEntity;

@Repository
public class ComDao implements ICom {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<ComEntity> getAll(String com_id) {
		List<ComEntity> all = jdbcTemplate.query(all_com, new Object[] { com_id }, new RowMapper<ComEntity>() {
			@Override
			public ComEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new ComEntity(rs.getInt("com_no"), rs.getString("com_name"), rs.getString("com_id"),
						rs.getString("com_st"), rs.getString("com_end"));
			}
		});
		return all;
	}

	/*
	 * public ComEntity getEntity(int no) { ComEntity entity =
	 * jdbcTemplate.queryForObject(select_com, new Object[] { no }, new
	 * RowMapper<ComEntity>() {
	 * 
	 * @Override public ComEntity mapRow(ResultSet rs, int rowNum) throws
	 * SQLException { ComEntity e = new ComEntity(rs.getInt(1), rs.getString(2),
	 * rs.getString(3), rs.getString(4)); return e; } }); return entity; }
	 */

	public int getInsertCom(ComEntity entity) {
		return jdbcTemplate.update(insert_com,
				new Object[] { entity.getCom_name(), entity.getCom_st(), entity.getCom_end() });
	}

	public int getDeleteCom(int com_no) {
		return jdbcTemplate.update(delete_com, new Object[] { com_no });
	}

	public int getUpdateCom(ComEntity entity) {
		return jdbcTemplate.update(update_com,
				new Object[] { entity.getCom_name(), entity.getCom_st(), entity.getCom_end(), entity.getCom_no() });
	}
}

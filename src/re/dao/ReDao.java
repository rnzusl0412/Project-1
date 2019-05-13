package re.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import re.entity.ReEntity;

@Repository
public class ReDao implements IRe {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public int getInsertRe(ReEntity entity) {
		System.out.println("DAO : " + entity);
		return jdbcTemplate.update(insert_re,
				new Object[] { entity.getRe_bno(), entity.getRe_exp(), entity.getRe_id() });
	}

	public List<ReEntity> getAll() {
		List<ReEntity> all = jdbcTemplate.query(all_re, new RowMapper<ReEntity>() {

			@Override
			public ReEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new ReEntity(rs.getInt("re_no"), rs.getInt("re_bno"), rs.getString("revo"),
						rs.getString("re_id"), rs.getString("re_day"));
			}

		});
		return all;
	}

	public List<ReEntity> getEntity(int no) {
		List<ReEntity> entity = jdbcTemplate.query(select_re, new Object[] { no }, new RowMapper<ReEntity>() {

			@Override
			public ReEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				ReEntity e = new ReEntity(rs.getInt("re_no"), rs.getInt("re_bno"), rs.getString("re_exp"),
						rs.getString("re_id"), rs.getString("re_day"));
				return e;
			}
		});
		return entity;
	}

	public List<ReEntity> getSelect(ReEntity entity) {
		Object[] a = new Object[] {};
		if (entity.getRe_id().isEmpty()) {
			entity.setRe_id("");
		}

		a = new Object[] { entity.getRe_bno(), entity.getRe_id() };

		List<ReEntity> sel = jdbcTemplate.query(select_re01, a, new RowMapper<ReEntity>() {

			@Override
			public ReEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new ReEntity(rs.getInt("re_no"), rs.getInt("re_bno"), rs.getString("re_exp"),
						rs.getString("re_id"), rs.getString("re.day"));
			}
		});
		return sel;
	}

	public int getDeleteRe(ReEntity entity) {
		System.out.println(entity.getRe_no() + " = Dao");
		Object[] a = new Object[] { entity.getRe_no()};

		int r = jdbcTemplate.update(delete_re, a);
		return r;
	}

	public int getUpdateRe(ReEntity entity) {
		return jdbcTemplate.update(update_re, new Object[] { entity.getRe_exp(), entity.getRe_no() });
	}
}

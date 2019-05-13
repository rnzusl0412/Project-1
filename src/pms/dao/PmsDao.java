package pms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import pms.entity.PmsEntity;

@Repository
public class PmsDao implements IPms {
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<PmsEntity> getAll(int pms_pmno) {
		List<PmsEntity> all = jdbcTemplate.query(all_pms, new Object[] { pms_pmno }, new RowMapper<PmsEntity>() {

			@Override
			public PmsEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new PmsEntity(rs.getInt("pms_no"), rs.getString("pms_id"), rs.getInt("pms_pmno"),
						rs.getString("pms_mission"), rs.getString("pms_st"), rs.getString("pms_end"));
			}
		});
		return all;
	}
	
	public int getInsertPms(PmsEntity entity) {
		return jdbcTemplate.update(insert_pms, new Object[] {
				entity.getPms_id(), entity.getPms_pmno(), entity.getPms_mission(), entity.getPms_st(), entity.getPms_end()
		});
	}
	
	public int getDeletePms(int pms_no) {
		return jdbcTemplate.update(delete_pms, new Object[] {pms_no});
	}
	
	public int getUpdatePms(PmsEntity entity) {
		return jdbcTemplate.update(update_pms, new Object[] {
				entity.getPms_id(), entity.getPms_st(), entity.getPms_end(), entity.getPms_no()
				});
	}
}

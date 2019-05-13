package bbs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import bbs.entity.BbsEntity;

@Repository
public class BbsDAO implements IBbs {

	
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	

	public int getInsertBbs(BbsEntity entity,int bbs_type) {	
		// 다운 캐스팅 해서 게시판 늘릴 것 Object
		return jdbcTemplate.update(insert_bbs,  new Object[] {bbs_type,entity.getBbs_tit(),entity.getBbs_user(),entity.getBbs_con(),entity.getBbs_file()}); 
	}
	
	public List<BbsEntity> getAll() {

		List<BbsEntity> all = jdbcTemplate.query(all_bbs, new RowMapper<BbsEntity>() {

			@Override
			public BbsEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new BbsEntity(rs.getInt("bbs_co"),rs.getInt("bbs_no"), 
						rs.getString("bbs_tit"), rs.getString("bbs_user"),
						rs.getDate("bbs_date"),rs.getString("bbs_con"), 
						rs.getInt("bbs_lo"), rs.getString("bbs_file"));
			}
		});
		return all;
	}
	


	public BbsEntity getEntity(int no) {
			
		BbsEntity entity = jdbcTemplate.queryForObject(select_bbs, new Object[] {no}, new RowMapper<BbsEntity>() {
			@Override
			public BbsEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				BbsEntity e = new BbsEntity(rs.getInt(1),rs.getInt(2), rs.getString(3), rs.getString(4),
						rs.getDate(5), rs.getString(6), rs.getInt(7), rs.getString(8));
				return e;
			}
		});	
		return entity; 
	}
	
	public int getUpdateBbs(BbsEntity entity) {	 
		return jdbcTemplate.update(update_bbs,  new Object[] {entity.getBbs_tit(),entity.getBbs_con(),entity.getBbs_file(),entity.getBbs_no(),entity.getBbs_user()}); 
	}
	
	public int getDeleteBbs(int bbs_no) {
		return jdbcTemplate.update(delete_bbs, new Object[] {bbs_no});
	}
	
	public int getUpdateBbsLo(int bbs_no) {
		return jdbcTemplate.update(update_bbs_lo, new Object[] {bbs_no});
	}
}

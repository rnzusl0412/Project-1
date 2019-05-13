package cont.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import bbs.entity.BbsEntity;
import cont.entity.PmEntity;
import cont.entity.ContEntity;
import cont.vo.PmVo;
import cont.vo.ContVo;

@Repository
public class ContDAO implements ICont {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public int getInsertCont(ContVo Vo) {

		int r = 0;
		try {
			r = jdbcTemplate.update(insert_cont,
					new Object[] { Vo.getCo_name(), Vo.getCo_exp(), Vo.getCo_url(), Vo.getCo_st(), Vo.getCo_end() });
		} catch (Exception e) {
			
		}
		return r;
	}

	public List<ContEntity> getAllCont() {

		List<ContEntity> all = jdbcTemplate.query(all_cont, new RowMapper<ContEntity>() {

			@Override
			public ContEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new ContEntity(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7));
			}
		});

		return all;
	}

	public int getDeleteCont(int co_no) {
		return jdbcTemplate.update(delete_cont, new Object[] { co_no });
	}
	
	public int getUpdateCont(ContEntity entity) {
		int r = 0;
		try {
			r = jdbcTemplate.update(update_cont,
					new Object[] { entity.getCo_name(), entity.getCo_exp(), entity.getCo_url(), entity.getCo_st(), entity.getCo_end(), entity.getCo_no()});
		} catch (Exception e) {
			
		}
		return r;
	}
	
	public ContEntity getSelectCont(int co_no) {
		
		ContEntity entity = jdbcTemplate.queryForObject(select_cont,new Object[] {co_no},new RowMapper<ContEntity>() {

			@Override
			public ContEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				ContEntity e = new ContEntity(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
				return e;
			}
		});
		
		return entity;
	}
	//////////////===========================================================///////////////////////////////
	
	
	

}

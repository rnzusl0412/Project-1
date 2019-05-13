package careerpath.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import careerpath.entity.CPEntity;
import careerpath.entity.PmJoinEntity;
import cont.entity.PmEntity;
import customer.vo.CustomerVO;

@Repository
public class CPDAO implements ICP {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public int getInsertCP_PM(String c_id, int pm_no) {

		int r = 0;
		try {
			r = jdbcTemplate.update(insert_cp_pm, new Object[] { c_id, pm_no });
		} catch (Exception e) {

		}
		return r;
	}

	public CPEntity getMyProject(String userID) {
		CPEntity entity = jdbcTemplate.queryForObject(select_cp, new Object[] { userID }, new RowMapper<CPEntity>() {

			@Override
			public CPEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				CPEntity entity = new CPEntity();
				if (rs.getInt(5) != 0)
					entity.setCp_pmno(rs.getInt(5));
				return entity;
			}

		});

		return entity;
	}

	public CustomerVO getAllmyTeamCustomer(String c_id) {

		CustomerVO customer = jdbcTemplate.queryForObject(selelct_cp_myteam_customer, new Object[] { c_id },
				new RowMapper<CustomerVO>() {

					@Override
					public CustomerVO mapRow(ResultSet rs, int rowNum) throws SQLException {
						return new CustomerVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
								rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
								rs.getString(10), rs.getString(11), rs.getString(12), rs.getInt(13), rs.getString(14));
					}

				});

		return customer;

	}

	public List<CPEntity> getAllmyTeamNO(int pm_no) {

		List<CPEntity> all = jdbcTemplate.query(select_cp_myteam, new Object[] { pm_no }, new RowMapper<CPEntity>() {

			@Override
			public CPEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				CPEntity entity = new CPEntity();

				if (rs.getString(1) != null)
					entity.setCp_id(rs.getString(1));
				if (rs.getInt(2) != 0)
					entity.setCp_no(rs.getInt(2));
				if (rs.getInt(3) != 0)
					entity.setCp_cacno(rs.getInt(3));
				if (rs.getInt(4) != 0)
					entity.setCp_comno(rs.getInt(4));
				if (rs.getInt(5) != 0)
					entity.setCp_pmno(rs.getInt(5));
				if (rs.getInt(6) != 0)
					entity.setCp_cppno(rs.getInt(6));
				if (rs.getInt(7) != 0)
					entity.setCp_jclcod(rs.getInt(7));
				return entity;
			}
		});

		return all;
	}
	
	public List<PmJoinEntity> getAllmyTeam(String userID) {

		List<PmJoinEntity> all = jdbcTemplate.query(select_pm_myteam, new Object[] { userID }, new RowMapper<PmJoinEntity>() {

			@Override
			public PmJoinEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				PmJoinEntity entity = new PmJoinEntity();
				entity.setPm_no(rs.getInt(1));
				entity.setCo_name(rs.getString(2));
				entity.setPm_team(rs.getString(3));
				return entity;
			}
		});
		return all;
	}

	public int getMyTeamLimit(int pm_no) {

		int r = jdbcTemplate.queryForObject(select_limit_member, new Object[] {pm_no },
				new RowMapper<Integer>() {

					@Override
					public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
						return rs.getInt("PM_LIMITM");
					}

				});

		return r;


	}

}

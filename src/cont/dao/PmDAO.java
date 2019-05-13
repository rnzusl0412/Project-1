package cont.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cont.entity.PmEntity;
import cont.vo.PmVo;

@Repository
public class PmDAO implements IPm {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<PmEntity> getAllPm() {

		List<PmEntity> all = jdbcTemplate.query(all_pm, new RowMapper<PmEntity>() {

			@Override
			public PmEntity mapRow(ResultSet rs, int rowNum) throws SQLException {

				return new PmEntity(rs.getInt("pm_no"), rs.getInt("pm_cono"), rs.getString("pm_team"),
						rs.getString("pm_leader_id"), rs.getString("pm_day").split(" ")[0], rs.getString("pm_file"),
						rs.getInt("pm_curm"), rs.getInt("pm_limitm"), rs.getString("pm_primary"),
						rs.getString("pm_func"), rs.getString("pm_effect"), rs.getString("pm_reqsk"),
						rs.getString("pm_accsk"), rs.getInt("pm_lo"));

			}
		});
		return all;
	}

	public int getInsertPm(PmVo Vo, String userID) {

		System.out.println(Vo);
		// String insert_pm = "INSERT INTO PM
		// values(SEQ_03.NEXTVAL,?,?,?,sysdate,?,0,?,?,?,?,?,0)";
		int r = 0;
		try {
			r = jdbcTemplate.update(insert_pm,
					new Object[] { Vo.getPm_cono(), Vo.getPm_team(), userID, Vo.getPm_file(), Vo.getPm_limitm(),
							Vo.getPm_primary(), Vo.getPm_function(), Vo.getPm_effect(), Vo.getPm_reqSkill(),
							Vo.getPm_accSkill() });
		} catch (Exception e) {

		}
		System.out.println(r);
		return r;
	}

	public PmEntity getSelectPm(int no) {

		PmEntity entity = jdbcTemplate.queryForObject(select_pm, new Object[] { no }, new RowMapper<PmEntity>() {

			@Override
			public PmEntity mapRow(ResultSet rs, int rowNum) throws SQLException {

				PmEntity e = new PmEntity(rs.getInt("pm_no"), rs.getInt("pm_cono"), rs.getString("pm_team"),
						rs.getString("pm_leader_id"), rs.getString("pm_day").split(" ")[0], rs.getString("pm_file"),
						rs.getInt("pm_curm"), rs.getInt("pm_limitm"), rs.getString("pm_primary"),
						rs.getString("pm_func"), rs.getString("pm_effect"), rs.getString("pm_reqsk"),
						rs.getString("pm_accsk"), rs.getInt("pm_lo"));
				return e;
			}
		});

		return entity;
	}

	public PmEntity getSelectPm(int co_no,String pm_id) {

		PmEntity entity = jdbcTemplate.queryForObject(select_pm_co, new Object[] { co_no,pm_id }, new RowMapper<PmEntity>() {

			@Override
			public PmEntity mapRow(ResultSet rs, int rowNum) throws SQLException {

				PmEntity e = new PmEntity(rs.getInt("pm_no"), rs.getInt("pm_cono"), rs.getString("pm_team"),
						rs.getString("pm_leader_id"), rs.getString("pm_day").split(" ")[0], rs.getString("pm_file"),
						rs.getInt("pm_curm"), rs.getInt("pm_limitm"), rs.getString("pm_primary"),
						rs.getString("pm_func"), rs.getString("pm_effect"), rs.getString("pm_reqsk"),
						rs.getString("pm_accsk"), rs.getInt("pm_lo"));
				return e;
			}
		});

		return entity;
	}

	public int getDeletePm(int pm_no) {
		return jdbcTemplate.update(delete_pm, new Object[] { pm_no });
	}

	public int getUpdatePm(PmEntity entity) {
		int r = 0;
		try {

			r = jdbcTemplate.update(update_pm,
					new Object[] { entity.getPm_team(), entity.getPm_limitm(), entity.getPm_cono(),
							entity.getPm_primary(), entity.getPm_function(), entity.getPm_effect(),
							entity.getPm_reqSkill(), entity.getPm_accSkill(), entity.getPm_no() });
		} catch (Exception e) {

		}
		return r;
	}

	public int getUpdatePmlo(int pm_no) {
		return jdbcTemplate.update(update_pm_lo, new Object[] { pm_no });
	}
	
	public int getCurrentMemberPm(int pm_no) {
		int count = jdbcTemplate.queryForObject(count_pm_member, new Object[] { pm_no }, new RowMapper<Integer>() {

			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {

				int r = rs.getInt(1);
				
				return r;
			}
		});
		
		return count;
	}

	///////////////////////////////////////////////////////

	public int getInsertCP_PM(String c_id, int pm_no) {

		int r = 0;
		try {
			r = jdbcTemplate.update(insert_cp_pm, new Object[] { c_id, pm_no });
		} catch (Exception e) {

		}
		return r;
	}
	
	

}

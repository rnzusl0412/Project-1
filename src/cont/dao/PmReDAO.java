package cont.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cont.entity.PmReEntity;

@Repository
public class PmReDAO implements IPmRe {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public int getInsertPmRe(PmReEntity entity) {
		return jdbcTemplate.update(insert_pmre,
				new Object[] { entity.getPmre_pmno(), entity.getPmre_exp(), entity.getPmre_id() });
	}

	public List<PmReEntity> getAll(int pmno) {
		List<PmReEntity> all = jdbcTemplate.query(all_pmre,new Object[] {pmno}, new RowMapper<PmReEntity>() {

			@Override
			public PmReEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				return new PmReEntity(rs.getInt("PMRE_NO"), rs.getInt("PMRE_PMNO"), rs.getString("PMRE_ID"),  rs.getString("PMRE_EXP"),rs.getString("PMRE_DAY"));
			}
		});

		return all;

	}
	
	public int getdeletePmRe(int pmreno) {
		System.out.println(pmreno);
		return jdbcTemplate.update(delete_pmre,new Object[] { pmreno});
	}
}

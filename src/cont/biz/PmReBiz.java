package cont.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cont.dao.PmReDAO;
import cont.entity.PmReEntity;
import cont.vo.PmReVo;

@Service
public class PmReBiz {

	@Autowired
	PmReDAO pmReDao;
	

	public int getInsertPmRe(int pmno, PmReVo vo, String userID) {
		
		PmReEntity entity = new PmReEntity();
		entity.setPmre_pmno(pmno);
		entity.setPmre_exp(vo.getPmre_exp());
		entity.setPmre_id(userID);
		return pmReDao.getInsertPmRe(entity);
	}
	
	public List<PmReEntity> getAll(int pmno){
		return pmReDao.getAll(pmno); 
	}
	
	public int getdeletePmRe(int pmreno) {
		return pmReDao.getdeletePmRe(pmreno);
	}
}

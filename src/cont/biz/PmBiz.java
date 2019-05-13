package cont.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cont.dao.PmDAO;
import cont.entity.PmEntity;
import cont.vo.PmVo;

@Service
public class PmBiz {

	@Autowired
	PmDAO PmDao;
	
	public List<PmEntity> getAllPm(){
		return PmDao.getAllPm();
	}
	
	public int getInsertPm(PmVo Vo,String userID) {
		
		return PmDao.getInsertPm(Vo,userID);
	}
	
	public PmEntity getSelectPm(int no) {
		return PmDao.getSelectPm(no);
	}
	
	public PmEntity getSelectPm(int co_no, String pm_id) {
		return PmDao.getSelectPm(co_no, pm_id);
	}
	
	public int getDeletePm(int pm_no) {
		return PmDao.getDeletePm(pm_no);
	}
	
	public int getUpdatePm(PmVo Vo,int pm_no) {
		PmEntity entity = new PmEntity();
		entity.setPm_team(Vo.getPm_team());
		entity.setPm_limitm(Vo.getPm_limitm());
		entity.setPm_cono(Vo.getPm_cono());
		entity.setPm_primary(Vo.getPm_primary());
		entity.setPm_function(Vo.getPm_function());
		entity.setPm_reqSkill(Vo.getPm_reqSkill());
		entity.setPm_accSkill(Vo.getPm_accSkill());
		entity.setPm_no(pm_no);
	
		return PmDao.getUpdatePm(entity);
	}
	
	public int getUpdatePmlo(int pm_no) {
		return PmDao.getUpdatePmlo(pm_no);
	}
	
	public int getInsertCP_PM(String c_id, int pm_no) {
		return PmDao.getInsertCP_PM(c_id, pm_no);
		
	}
	
	public int getCurrentMemberPm(int pm_no) {
		
		return PmDao.getCurrentMemberPm(pm_no);
	}
}

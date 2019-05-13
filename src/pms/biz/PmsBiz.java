package pms.biz;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.PmsDao;
import pms.entity.PmsEntity;
import pms.vo.PmsVo;

@Service
public class PmsBiz {
	
	@Autowired
	PmsDao pmsDao;
	
	public List<PmsEntity> getAll(int pms_pmno){
		List<PmsEntity> list = pmsDao.getAll(pms_pmno);
		Collections.sort(list, new Comparator<PmsEntity>() {

			@Override
			public int compare(PmsEntity o1, PmsEntity o2) {
				return o2.getPms_no() - o1.getPms_no();
			}
		});
		return list;
	}
	
	public int getInsertPms(int pm_no, PmsVo vo) {
		PmsEntity entity = new PmsEntity();
		entity.setPms_pmno(pm_no);
		entity.setPms_id(vo.getPms_id());
		entity.setPms_mission(vo.getPms_mission());
		entity.setPms_st(vo.getPms_st());
		entity.setPms_end(vo.getPms_end());
		
		return pmsDao.getInsertPms(entity);
	}
	
	public int getDeletePms(int pms_no) {
		return pmsDao.getDeletePms(pms_no);
	}
	
	public int getUpdatePms(int pms_no, PmsVo vo) {
		PmsEntity entity = new PmsEntity();
		entity.setPms_no(pms_no);
		entity.setPms_id(vo.getPms_id());
		entity.setPms_st(vo.getPms_st());
		entity.setPms_end(vo.getPms_end());
		
		return pmsDao.getUpdatePms(entity);
	}
}

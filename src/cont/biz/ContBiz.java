package cont.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bbs.entity.BbsEntity;
import cont.dao.ContDAO;
import cont.entity.ContEntity;
import cont.entity.PmEntity;
import cont.vo.PmVo;
import cont.vo.ContVo;

@Service
public class ContBiz {

	@Autowired
	ContDAO contDao;
	
	public int getInsertCont(ContVo Vo) {
		return contDao.getInsertCont(Vo);
	}
	
	public List<ContEntity> getAllCont(){
		return contDao.getAllCont();
	}
	
	public int getDeleteCont(int co_no) {
		return contDao.getDeleteCont(co_no);
	}
	
	public int getUpdateCont(ContVo Vo,int co_no) {
		ContEntity entity = new ContEntity();
		entity.setCo_no(co_no);
		entity.setCo_name(Vo.getCo_name());
		entity.setCo_exp(Vo.getCo_exp());
		entity.setCo_st(Vo.getCo_st().split(" ")[0]);
		entity.setCo_end(Vo.getCo_end().split(" ")[0]);
		entity.setCo_url(Vo.getCo_url());
		
		return contDao.getUpdateCont(entity);
	}
	
	public ContEntity getSelectCont(int co_no) {
		return contDao.getSelectCont(co_no);
	}
	
	///////////////////////////////////////////////////////
	
	
	
}

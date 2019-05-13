package com.biz;

import java.util.List;

import com.dao.ComDao;
import com.entity.ComEntity;
import com.vo.ComVo;

public class ComBiz {
	ComDao comDao;

	public List<ComEntity> getAll(String userID) {
		List<ComEntity> c = comDao.getAll(userID);
		return c;
	}

	public int getInsertCom(ComVo vo, String userID) {
		ComEntity entity = new ComEntity();
		entity.setCom_name(vo.getCom_name());
		entity.setCom_st(vo.getCom_st());
		entity.setCom_end(vo.getCom_end());
		return comDao.getInsertCom(entity);
	}

	public int getDeleteCom(int com_no) {
		return comDao.getDeleteCom(com_no);
	}

	public int getUpdateCom(int com_no, ComVo comVo, String userID) {
		ComEntity entity = new ComEntity();
		entity.setCom_no(com_no);
		entity.setCom_name(comVo.getCom_name());
		entity.setCom_st(comVo.getCom_st());
		entity.setCom_end(comVo.getCom_end());
		return comDao.getUpdateCom(entity);
	}

}

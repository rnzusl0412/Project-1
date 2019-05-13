package bbs.biz;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bbs.dao.BbsDAO;
import bbs.entity.BbsEntity;
import bbs.vo.BbsVo;
import re.dao.ReDao;
import re.entity.ReEntity;
import re.vo.ReVo;

@Service
public class BbsBiz {

	@Autowired
	BbsDAO bbsDao;
	
	@Autowired
	ReDao reDao;

	public int getInsertBbs(BbsVo vo, String userID, int bbs_type) {

		BbsEntity entity = new BbsEntity();
		entity.setBbs_con(vo.getBbs_con());
		entity.setBbs_tit(vo.getBbs_tit());
		entity.setBbs_file(vo.getBbs_file());
		entity.setBbs_co(bbs_type);
		entity.setBbs_user(userID);

		return bbsDao.getInsertBbs(entity, bbs_type);
	}

	public int getUpdateBbs(BbsVo vo, int bbs_no, String userID, int bbs_type) {

		BbsEntity entity = new BbsEntity();
		entity.setBbs_no(bbs_no);
		entity.setBbs_con(vo.getBbs_con());
		entity.setBbs_tit(vo.getBbs_tit());
		entity.setBbs_file(vo.getBbs_file());
		entity.setBbs_co(bbs_type);
		entity.setBbs_user(userID);

		return bbsDao.getUpdateBbs(entity);
	}

	public int getDeleteBbs(int bbs_no) {
		return bbsDao.getDeleteBbs(bbs_no);
	}
	
	public int getUpdateBbsLo(int bbs_no) {
		return bbsDao.getUpdateBbsLo(bbs_no);
	}

	public List<BbsEntity> getAll() {
		List<BbsEntity> list = bbsDao.getAll();
		Collections.sort(list, new Comparator<BbsEntity>() {

			@Override
			public int compare(BbsEntity o1, BbsEntity o2) {
				return o2.getBbs_no() - o1.getBbs_no();
			}
		});

		return list;
	}

	public BbsEntity getEntity(int no) {
		return bbsDao.getEntity(no);
	}
	
	//==========================================================
	
	
	public List<ReEntity> getEntityRe(int no) {
		return reDao.getEntity(no);
	}

	public int getInsertRe(int bno, ReVo vo, String userID) {
		ReEntity entity = new ReEntity();
		entity.setRe_bno(bno);
		entity.setRe_exp(vo.getRe_exp());
		entity.setRe_id(userID);
		System.out.println("BIZ : " + entity);
		return reDao.getInsertRe(entity);
	}

	public List<ReEntity> getAllRe() {
		List<ReEntity> list = reDao.getAll();
		Collections.sort(list, new Comparator<ReEntity>() {

			@Override
			public int compare(ReEntity o1, ReEntity o2) {
				return o2.getRe_no() - o2.getRe_no();
			}
		});
		return list;
	}

	public int getDeleteRe(int re_no, int bno) {
		System.out.println(re_no + " = Biz");
		System.out.println(bno + " = Biz");
		ReEntity entity = new ReEntity();
		entity.setRe_no(re_no);
		entity.setRe_bno(bno);
		return reDao.getDeleteRe(entity);
	}

	public int getUpdateRe(String exp) {
		ReEntity entity = new ReEntity();
		entity.setRe_exp(exp);
		return reDao.getUpdateRe(entity);
	}

}

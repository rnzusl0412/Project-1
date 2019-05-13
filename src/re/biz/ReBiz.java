package re.biz;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import re.dao.ReDao;
import re.entity.ReEntity;
import re.vo.ReVo;

@Service
public class ReBiz {
	@Autowired
	ReDao reDao;

	public List<ReEntity> getEntity(int no) {
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

	public List<ReEntity> getAll() {
		List<ReEntity> list = reDao.getAll();
		Collections.sort(list, new Comparator<ReEntity>() {

			@Override
			public int compare(ReEntity o1, ReEntity o2) {
				return o2.getRe_no() - o2.getRe_no();
			}
		});
		return list;
	}

	public int getDeleteRe(int re_no) {
		System.out.println(re_no + " = Biz");
		ReEntity entity = new ReEntity();
		entity.setRe_no(re_no);
		return reDao.getDeleteRe(entity);
	}

	public int getUpdateRe(String exp, int re_no) {
		ReEntity entity = new ReEntity();
		entity.setRe_no(re_no);
		entity.setRe_exp(exp);
		return reDao.getUpdateRe(entity);
	}

}

package careerpath.biz;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import careerpath.dao.CPDAO;
import careerpath.entity.CPEntity;
import careerpath.entity.PmJoinEntity;
import customer.vo.CustomerVO;

@Service
public class CPBiz {

	@Autowired
	CPDAO cpDao;
	
	public int getInsertCP_PM(String c_id, int pm_no) {
		return cpDao.getInsertCP_PM(c_id, pm_no);
	}
	
	public List<CustomerVO> getListMyteam(int pm_no){
		
		List<CustomerVO> all = new ArrayList<>();
		List<CPEntity> list =  cpDao.getAllmyTeamNO(pm_no);
		
		for(CPEntity CP:list) {
			all.add(cpDao.getAllmyTeamCustomer(CP.getCp_id()));
		}
		
		return all;
	}
	
	public CPEntity getMyProject(String userID) {
		return cpDao.getMyProject(userID);
	}
	
	public int getMyTeamLimit(int pm_no) {
		return cpDao.getMyTeamLimit( pm_no);
	}
	
	public List<PmJoinEntity> getAllmyTeam(String userID){
		return cpDao.getAllmyTeam(userID);
	}
}

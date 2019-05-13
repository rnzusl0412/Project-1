package careerpath.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import careerpath.biz.CPBiz;
import careerpath.entity.PmJoinEntity;
import customer.vo.CustomerVO;

@Controller
public class CPServlet {

	@Autowired
	CPBiz cpBiz;
	
	@RequestMapping(value = "/carrerPath/acceptRe.do", method = RequestMethod.GET)
	public ModelAndView insertPmRe(@RequestParam("c_id") String c_id,@RequestParam("pm_no") int pm_no) {
		
		
		
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
		
		int r = cpBiz.getMyTeamLimit(pm_no);
		
		List<CustomerVO> myteam = cpBiz.getListMyteam(pm_no);
		if(myteam.size() >= r) {
			mav.addObject("msg", "제한 인원이 초과되었습니다.");
			mav.addObject("url", "/ITformation/ConTbbsView.do?no="+pm_no);	
			return mav;
		}
		for (CustomerVO c:myteam) {
			if(c.getC_id().equals(c_id)) {
				mav.addObject("msg", "이미 추가된 팀원입니다.");
				mav.addObject("url", "/ITformation/ConTbbsView.do?no="+pm_no);	
				return mav;
			}
		}
		
		
		
		r = cpBiz.getInsertCP_PM(c_id, pm_no);
		
		if(r > 0) {
			mav.addObject("msg", "승인 되었습니다.");
			mav.addObject("url", "/ITformation/ConTbbsView.do?no="+pm_no);	
		}else {
			mav.addObject("msg", "변경 오류!!");
			mav.addObject("url", "/ITformation/ConTbbsView.do");	
		}
		return mav;
	}
	
	@RequestMapping(value = "/carrerPath/myProject.do", method = RequestMethod.GET)
	public ModelAndView myProject(HttpSession session) {
		
		String userID = (String)session.getAttribute("userID");
		ModelAndView mav = new ModelAndView("/WEB-INF/view/customer/myProject.jsp");
		
		List<PmJoinEntity> list = cpBiz.getAllmyTeam(userID);
		mav.addObject("myteamList", list);
		
		return mav;
	}
	
	/*@RequestMapping(value = "/carrerPath/myProject.do", method = RequestMethod.GET)
	public ModelAndView myProject(HttpSession session) {
		
		String userID = (String)session.getAttribute("userID");
		ModelAndView mav = new ModelAndView("/WEB-INF/view/customer/myProject.jsp");
		CPEntity entity = cpBiz.getMyProject(userID);
		
		List<CustomerVO> list = cpBiz.getListMyteam(entity.getCp_pmno());	
		mav.addObject("myteamList", list);
		
		return mav;
	}*/
	
	
	
}

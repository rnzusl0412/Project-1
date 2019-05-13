package pms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pms.biz.PmsBiz;
import pms.entity.PmsEntity;
import pms.vo.PmsVo;

@Controller("PmsController")
public class PmsServlet {
	
	@Autowired
	PmsBiz pms_biz;
	
	@RequestMapping("/selectAllPms.do")
	public ModelAndView selectAllPms(@RequestParam(value="pms_pmno") int pms_pmno) {
		List<PmsEntity> all = pms_biz.getAll(pms_pmno);
		ModelAndView mav = new ModelAndView("", "AllPms", all);
		return mav;
	}
	
	@RequestMapping("/insertPms.do")
	public String insertPms( HttpSession session, @RequestParam(value="vo") PmsVo pmsVo) {
		int pm_no = (int) session.getAttribute("pm_no");
		if(pm_no == 0) {
			return "";
		} else { 
			int r = pms_biz.getInsertPms(pm_no, pmsVo);
			System.out.println(r);
		}
		return null;
	}
	
	@RequestMapping("/deletePms.do")
	public int deletePms(@RequestParam(value="pms_no") int pms_no) {
		int r = pms_biz.getDeletePms(pms_no);
		return 0;
	}
	
	@RequestMapping("/updatePms.do")
	public String updatePms(@RequestParam(value="vo") PmsVo pmsvo, @RequestParam(value="pms_no") int pms_no) {
		int r = pms_biz.getUpdatePms(pms_no, pmsvo);
		return null;
	}
}

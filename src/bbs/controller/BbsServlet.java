package bbs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bbs.biz.BbsBiz;
import bbs.entity.BbsEntity;
import bbs.vo.BbsVo;

import re.biz.ReBiz;
import re.entity.ReEntity;
import re.vo.ReVo;

@Controller("BbsController")
public class BbsServlet {

	@Autowired
	BbsBiz bbs_biz;
	
	@Autowired
	ReBiz re_biz;
	
	@RequestMapping("/selectAllBbs.do")
	public ModelAndView selectAllBbs() {
		List<BbsEntity> all = bbs_biz.getAll();
		ModelAndView mav = new ModelAndView("WEB-INF/view/bbs/bbs.jsp", "AllBbs", all);
		return mav;
	}
	
	@RequestMapping(value = "/insertBbs.do", method = RequestMethod.POST)
	public String write(@ModelAttribute BbsVo bbsVo,HttpSession session) {
		
		String userID = (String)session.getAttribute("userID");
		
		int r = 0;
		if(userID == null) {
			
			return  "redirect:selectAllBbs.do";
		}
	
			r = bbs_biz.getInsertBbs(bbsVo,userID,0);
			
		return "redirect:selectAllBbs.do";

	}
	
	@RequestMapping("/board/view.do")
	public ModelAndView view(@RequestParam int bbs_no) {
		BbsEntity entity = bbs_biz.getEntity(bbs_no);
		//List<ReEntity> rentity = bbs_biz.getEntityRe(bbs_no);
		int r = bbs_biz.getUpdateBbsLo(bbs_no);
		ModelAndView mav = new ModelAndView("/WEB-INF/view/bbs/bbsView.jsp", "entity", entity);
		//mav.addObject("rentity", rentity);
		
		return mav;
	}
	
	@RequestMapping("/board/Write.do")
	public String writeRedirect() {
		return "/WEB-INF/view/bbs/bbsWrite.jsp";
	}
	
	@RequestMapping("/board/UnWrite.do")
	public ModelAndView UnwriteRedirect() {
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
		mav.addObject("msg", "로그인 후 이용해 주십시오.");
		mav.addObject("url", "/ITformation/selectAllBbs.do");	
		return mav;
	}
	
	@RequestMapping(value = "/board/update.do", method=RequestMethod.GET)
	public String updateRedirect(@RequestParam int bbs_no) {
		return "/WEB-INF/view/bbs/bbsUpdate.jsp";
	}
	
	@RequestMapping(value = "/board/update.do", method=RequestMethod.POST)
	public ModelAndView updateBoard(@RequestParam int bbs_no,@ModelAttribute BbsVo bbsVo,HttpSession session) {
		//BbsEntity entity = bbs_biz.getEntity(bbs_no);
		String userID = (String) session.getAttribute("userID");
		int r = bbs_biz.getUpdateBbs(bbsVo, bbs_no, userID, 0);
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
		if(r == 1) {
			mav.addObject("msg", "해당 게시글이 수정되었습니다.");
			mav.addObject("url", "/ITformation/selectAllBbs.do");			
		}else {
			mav.addObject("msg", "수정 오류!!!");
			mav.addObject("url", "/ITformation/board/view.do?bbs_no="+bbs_no);
		}
		return mav;
	}
	
	@RequestMapping(value = "/board/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteRedirect(@RequestParam int bbs_no) {
		
		
		int r = bbs_biz.getDeleteBbs(bbs_no);
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
		
		if(r == 1) {
			mav.addObject("msg", "해당 게시글이 삭제되었습니다.");
			mav.addObject("url", "/ITformation/selectAllBbs.do");			
		}else {
			mav.addObject("msg", "삭제 오류!!!");
			mav.addObject("url", "/ITformation/board/view.do?bbs_no="+bbs_no);
		}
		
		return mav;
	}
	
	
	@RequestMapping("/reply/view.do")
	   public ModelAndView reView(@RequestParam("bbs_no") int bbs_no) {
	      System.out.println("댓글 리스트 컨트롤러 등장");

	      BbsEntity entity = bbs_biz.getEntity(bbs_no);
	      List<ReEntity> rentity = re_biz.getEntity(bbs_no);

	      ModelAndView mav = new ModelAndView();
	      mav.addObject("entity", entity);
	      mav.addObject("rentity", rentity);
	      mav.setViewName("/WEB-INF/view/re/reView.jsp");
	      return mav;
	   }

	   @RequestMapping("/reply/write.do")
	   @ResponseBody
	   public String reWrite(@RequestParam(value = "re_exp") ReVo reVo, HttpSession session,
	         @RequestParam(value = "bbs_no") int bbs_no) {
	      String userID = (String) session.getAttribute("userID");
	      if (userID == null) {
	         return "/board/view.do?re_no=" + bbs_no;
	      } else {
	         int r = re_biz.getInsertRe(bbs_no, reVo, userID);
	         System.out.println(r);
	      }
	      return null;
	   }

	   @RequestMapping("/reply/delete.do")
	   @ResponseBody
	   public String deleteRe(@RequestParam(value = "re_no") int re_no) {
	      System.out.println(re_no + " = controller");
	      int r = re_biz.getDeleteRe(re_no);
	      return null;
	   }

	   @RequestMapping("/reply/update.do")
	   @ResponseBody
	   public String reUpdate(@RequestParam(value = "re_exp") ReVo reVo, @RequestParam(value = "re_no") int re_no) {
	      String re_exp = reVo.getRe_exp();
	      int r = re_biz.getUpdateRe(re_exp, re_no);
	      System.out.println(r);
	      return null;
	   }

	   
}

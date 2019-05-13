package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.biz.ComBiz;
import com.entity.ComEntity;
import com.vo.ComVo;

@Controller("ConController")
public class ComServlet {
	@Autowired
	ComBiz com_biz;

	public ModelAndView select(HttpSession session) {
		String userID = (String) session.getAttribute("userID");
		List<ComEntity> all = com_biz.getAll(userID);
		ModelAndView mav = new ModelAndView("WEB-INF/view/com/com.jsp", "AllCom", all);
		return mav;
	}

	public String insert(@ModelAttribute ComVo comVo, HttpSession session) {
		String userID = (String) session.getAttribute("userID");
		if (userID == null) {
			return "";
		}
		int r = com_biz.getInsertCom(comVo, userID);
		return "";
	}

	public ModelAndView delete(@RequestParam int com_no) {
		int r = com_biz.getDeleteCom(com_no);
		ModelAndView mav = new ModelAndView("");
		if (r == 1) {
			mav.addObject("msg", "해당 게시글이 삭제되었습니다.");
			mav.addObject("url", "/ITformation/selectAllCom.do");
		} else {
			mav.addObject("msg", "삭제 오류!!!");
			mav.addObject("url", "/ITformation/com/view.do?com_no=" + com_no);
		}
		return mav;
	}

	public ModelAndView update(@RequestParam int com_no, @ModelAttribute ComVo comVo, HttpSession session) {
		String userID = (String) session.getAttribute("userID");
		int r = com_biz.getUpdateCom(com_no, comVo, userID);
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
		if (r == 1) {
			mav.addObject("", "해당 글이 수정되었습니다.");
			mav.addObject("url", "/ITformation/selectAllCom.do");
		} else {
			mav.addObject("msg", "수정 오류");
			mav.addObject("url", "/ITformation/com/view.do?com_no=" + com_no);
		}
		return mav;
	}
}

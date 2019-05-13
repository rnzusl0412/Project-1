package cont.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cont.biz.ContBiz;
import cont.biz.PmBiz;
import cont.biz.PmReBiz;
import cont.entity.ContEntity;
import cont.entity.PmEntity;
import cont.vo.ContSchedule;
import cont.vo.ContVo;
import cont.vo.PmReVo;
import cont.vo.PmVo;
import pms.vo.PmsVo;

@Controller
public class ContServlet {

	@Autowired
	ContBiz contBiz;

	@Autowired
	PmBiz pmBiz;

	@Autowired
	PmReBiz pmReBiz;

	@RequestMapping(value = "/Cont.do", method = RequestMethod.GET)
	public ModelAndView adminCont() {

		return new ModelAndView("/WEB-INF/view/contest/Cont.jsp");

	}

	@RequestMapping(value = "/ContAccess.do", method = RequestMethod.GET)
	@ResponseBody
	public String ContAccess() {
		JSONArray jsonArray = new JSONArray();
		List<ContEntity> list = contBiz.getAllCont();
		JSONObject data2 = new JSONObject();
		for (ContEntity e : list) {
			JSONObject data = new JSONObject();
			data.put("title", e.getCo_name());
			data.put("end", e.getCo_end().split(" ")[0]);
			data.put("start", e.getCo_st().split(" ")[0]);
			jsonArray.add(data);
		}
		data2.put("Calendar", jsonArray);
		String json = data2.toJSONString();
		System.out.println(json);

		return json;

	}

	@RequestMapping(value = "/admin/insertCont.do", method = RequestMethod.GET)
	public ModelAndView adminInsertCont() {
		return new ModelAndView("/WEB-INF/view/contest/insertCont.jsp");

	}

	@RequestMapping(value = "/admin/insertCont.do", method = RequestMethod.POST)
	public ModelAndView adminInsertCont(@ModelAttribute ContVo Vo) {
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
		System.out.println(Vo);
		int r = contBiz.getInsertCont(Vo);
		System.out.println(r);
		if (r > 0) {
			mav.addObject("msg", "해당 공모전이 추가되었습니다.");
			mav.addObject("url", "../Cont.do");
		} else {
			mav.addObject("msg", "올바른 값을 입력하십시오");
			mav.addObject("url", "insertCont.do");
		}
		return mav;
	}

	@RequestMapping(value = "/admin/listCont.do", method = RequestMethod.GET)
	public ModelAndView adminListCont() {
		List<ContEntity> list = contBiz.getAllCont();

		System.out.println(list.size());
		return new ModelAndView("/WEB-INF/view/contest/listCont.jsp", "listCont", list);

	}

	@RequestMapping(value = "/admin/deleteCont.do", method = RequestMethod.GET)
	public ModelAndView adminDeleteCont(@RequestParam int co_no) {
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
		int r = contBiz.getDeleteCont(co_no);
		if (r > 0) {
			mav.addObject("msg", "해당 공모전이 삭제되었습니다.");
			mav.addObject("url", "listCont.do");
		} else {
			mav.addObject("msg", "삭제 오류!!");
			mav.addObject("url", "listCont.do");
		}
		return mav;

	}

	@RequestMapping(value = "/admin/updateCont.do", method = RequestMethod.GET)
	public ModelAndView adminUpdateCont(@RequestParam int co_no) {
		ContEntity entity = contBiz.getSelectCont(co_no);
		return new ModelAndView("/WEB-INF/view/contest/updateCont.jsp", "ContEntity", entity);

	}

	@RequestMapping(value = "/admin/updateCont.do", method = RequestMethod.POST)
	public ModelAndView adminUpdateCont(@ModelAttribute ContVo Vo, @RequestParam int co_no) {
		int r = contBiz.getUpdateCont(Vo, co_no);
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");

		if (r > 0) {
			mav.addObject("msg", "해당 공모전이 변경되었습니다.");
			mav.addObject("url", "listCont.do");
		} else {
			mav.addObject("msg", "변경 오류!!");
			mav.addObject("url", "listCont.do");
		}
		return mav;
	}
	///////// ==================================================================================================///////////////

	@RequestMapping(value = "/getTeamBbs.do", method = RequestMethod.GET)
	public ModelAndView getTeamBbs() {
		List<PmEntity> list = pmBiz.getAllPm();

		return new ModelAndView("/WEB-INF/view/contest/getTeamBbs.jsp", "list", list);

	}

	@RequestMapping(value = "/ConTbbsWrite.do", method = RequestMethod.GET)
	public ModelAndView ConTbbsWrite() {
		ModelAndView mav = new ModelAndView("/WEB-INF/view/contest/ConTbbsWrite.jsp");
		mav.addObject("contestList", contBiz.getAllCont());
		return mav;

	}

	@RequestMapping(value = "/ConTbbsWrite.do", method = RequestMethod.POST)
	public ModelAndView ConTbbsWrite(@ModelAttribute PmVo PmVo, HttpSession session) {
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
		System.out.println(PmVo);
		if (PmVo.getPm_team() == null || PmVo.getPm_cono() == 0 || PmVo.getPm_limitm() == 0
				|| PmVo.getPm_primary() == null) {
			mav.addObject("msg", "올바른 값을 입력하십시오.");
			mav.addObject("url", "ConTbbsWrite.do");
			return mav;
		}

		String userID = (String) session.getAttribute("userID");
		int r = pmBiz.getInsertPm(PmVo, userID);
		
		if (r == 0) {
			mav.addObject("msg", "삽입 오류!!!");
			mav.addObject("url", "ConTbbsWrite.do");
		}

		PmEntity entity = pmBiz.getSelectPm(PmVo.getPm_cono(), userID);
		r = pmBiz.getInsertCP_PM(userID, entity.getPm_no());

		if (r > 0) {
			mav.addObject("msg", "팀원 모집이 추가되었습니다.");
			mav.addObject("url", "getTeamBbs.do");
		} else {
			mav.addObject("msg", "삽입 오류!!!");
			mav.addObject("url", "ConTbbsWrite.do");
		}
		return mav;
	}

	@RequestMapping(value = "/ConTbbsView.do")
	public ModelAndView ConTView(@RequestParam("no") int no) {
		pmBiz.getUpdatePmlo(no);

		ModelAndView mav = new ModelAndView("/WEB-INF/view/contest/ConTbbsView.jsp");
		PmEntity entity = pmBiz.getSelectPm(no);
		entity.setPm_curm(pmBiz.getCurrentMemberPm(no));
		mav.addObject("PM", entity);
		mav.addObject("pmrentity", pmReBiz.getAll(no));
		return mav;

	}

	@RequestMapping(value = "/ConTbbsView2.do")
	public ModelAndView ConTView2() {

		return new ModelAndView("/WEB-INF/view/contest/ConTbbsView2.jsp");

	}
	/*
	 * @RequestMapping("/ConTbbsView.do") public ModelAndView view(@RequestParam int
	 * bbs_no) { BbsEntity entity = bbs_biz.getEntity(bbs_no); int r =
	 * bbs_biz.getUpdateBbsLo(bbs_no); return new
	 * ModelAndView("/WEB-INF/view/bbs/bbsView.jsp", "entity", entity); return new
	 * ModelAndView("/WEB-INF/view/contest/ConTbbsView.jsp"); }
	 */

	@RequestMapping(value = "/ConTbbsWrite2.do", method = RequestMethod.GET)
	public ModelAndView ConTbbsWrite2() {

		return new ModelAndView("/WEB-INF/view/contest/ConTbbsWrite2.jsp");

	}

	@RequestMapping(value = "/projectManager/deleteProject.do", method = RequestMethod.GET)
	public ModelAndView DeletePM(@RequestParam int pm_no) {
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
		int r = pmBiz.getDeletePm(pm_no);
		if (r > 0) {
			mav.addObject("msg", "해당 모집글이 삭제되었습니다.");
			mav.addObject("url", "../getTeamBbs.do");
		} else {
			mav.addObject("msg", "삭제 오류!!");
			mav.addObject("url", "../getTeamBbs.do");
		}
		return mav;

	}

	@RequestMapping(value = "/projectManager/updateProject.do", method = RequestMethod.GET)
	public ModelAndView UpdatePm(@RequestParam int pm_no) {

		PmEntity entity = pmBiz.getSelectPm(pm_no);
		ModelAndView mav = new ModelAndView("/WEB-INF/view/contest/ConTbbsUpdate.jsp", "PmEntity", entity);
		mav.addObject("contestList", contBiz.getAllCont());
		return mav;

	}

	@RequestMapping(value = "/projectManager/updateProject.do", method = RequestMethod.POST)
	public ModelAndView UpdatePm(@ModelAttribute PmVo Vo, @RequestParam int pm_no) {
		int r = pmBiz.getUpdatePm(Vo, pm_no);
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");

		if (r > 0) {
			mav.addObject("msg", "해당 모집글이 변경되었습니다.");
			mav.addObject("url", "../getTeamBbs.do");
		} else {
			mav.addObject("msg", "변경 오류!!");
			mav.addObject("url", "../getTeamBbs.do");
		}
		return mav;
	}

	//////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value = "/projectManager/insertRe.do", method = RequestMethod.POST)
	public String writePmRe(@ModelAttribute PmReVo PmreVo, HttpSession session, @RequestParam("no") int no) {
		String userID = (String) session.getAttribute("userID");

		if (userID == null) {
			return "/ConTbbsView.do?re_no=" + no;
		} else {
			int r = pmReBiz.getInsertPmRe(no, PmreVo, userID);
			System.out.println(r);
		}
		return "/ConTbbsView.do?re_no=" + no;
	}

	@RequestMapping(value = "/projectManager/deleteRe.do", method = RequestMethod.GET)
	public String deletePmRe(@RequestParam("no") int no, @RequestParam("re_no") int reno, HttpSession session) {
		String userID = (String) session.getAttribute("userID");

		System.out.println(reno);
		if (userID == null) {
			return "/ConTbbsView.do";
		} else {
			int r = pmReBiz.getdeletePmRe(reno);
			System.out.println(r);
		}
		return "/ConTbbsView.do";
	}

	@RequestMapping(value = "/projectManager/acceptRe.do", method = RequestMethod.GET)
	public ModelAndView insertPmRe(@RequestParam("c_id") String c_id, @RequestParam("pm_no") int pm_no) {

		int r = pmBiz.getInsertCP_PM(c_id, pm_no);
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");

		if (r > 0) {
			mav.addObject("msg", "승인 되었습니다.");
			mav.addObject("url", "/ITformation/ConTbbsView.do?no=" + pm_no);
		} else {
			mav.addObject("msg", "변경 오류!!");
			mav.addObject("url", "/ITformation/ConTbbsView.do");
		}
		return mav;

	}

///////////////////////////////////////////CalendarSchedule//////////////////////////////////////////////////////////

	@RequestMapping(value = "/ContSchedule.do", method = RequestMethod.GET)
	public ModelAndView ContSchedule() {

		return new ModelAndView("/WEB-INF/view/customer/ContSchedule.jsp");

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ContSchedule2.do", method = RequestMethod.GET)
	@ResponseBody
	public String ContSchedule2() {
		JSONArray jsonArray = new JSONArray();
		JSONArray jsonArray2 = new JSONArray();
		JSONObject resultData = new JSONObject();
		List<ContEntity> list = contBiz.getAllCont();

//////////////////////////// 리소스 추가
		JSONObject resourceData = new JSONObject();
		resourceData.put("id", "ChoiYeongJun"); // resourceId 랑 같아야 한다.
		resourceData.put("title", "ChoiYeongJun");
		resourceData.put("eventColor", "green");
		jsonArray.add(resourceData);
		JSONObject resourceData2 = new JSONObject();
		resourceData2.put("id", "abc"); // resourceId 랑 같아야 한다.
		resourceData2.put("title", "abc");
		resourceData2.put("eventColor", "yellow");
		jsonArray.add(resourceData2);
		JSONObject resourceData3 = new JSONObject();
		resourceData3.put("id", "qwe"); // resourceId 랑 같아야 한다.
		resourceData3.put("title", "qwe");
		resourceData3.put("eventColor", "red");
		jsonArray.add(resourceData3);

//////////////////////////// 리소스 추가

//////////////////////이벤트추가/////////////
		JSONObject eventData = new JSONObject();
		eventData.put("id", "numbernumber."); // Event입력
		eventData.put("title", "Project plan"); // Event입력
		eventData.put("resourceId", "ChoiYeongJun"); // resourceData 를 참조하는것 id 랑 같아야 한다.
		eventData.put("start", "2019-04-08T12:30:00");
		eventData.put("end", "2019-04-15T12:30:00");
		jsonArray2.add(eventData);
//////////////////////이벤트추가/////////////

////////////////////행렬에담기////////////////
		resultData.put("resourceData", jsonArray);
		resultData.put("eventData", jsonArray2);
////////////////////행렬에담기////////////////

		String json1 = resultData.toJSONString();
		System.out.println(json1);

		return json1;

	}

///////////////////////////////////////////CalendarSchedule//////////////////////////////////////////////////////////
	@RequestMapping(value = "/ContSchedule3.do", method = RequestMethod.GET)
	public ModelAndView ContScheduleWrite(@ModelAttribute ContSchedule conts) {

		ModelAndView mav = new ModelAndView("/ContSchedule.do");
		System.out.println("입력한 이름은 : " + conts.getName());
		System.out.println("입력한 프로젝트 이름은 : " + conts.getProjectName());
		System.out.println("입력한 날짜는  : " + conts.getStartDate());
		System.out.println("입력한 날짜는  : " + conts.getEndDate());

		return mav;
	}
}

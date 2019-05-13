package customer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import customer.biz.CustomerBIZ;
import customer.vo.CustomerVO;

@Controller("CustomerController")
public class CustomerServlet {

	@Autowired
	CustomerBIZ customer_biz;

	@RequestMapping("/selectAll.do")
	public String selectAllAdmin(Model m) {
		List<CustomerVO> all = customer_biz.getAll();
		m.addAttribute("all", all);	
		return "WEB-INF/view/admin/cus_control.jsp";
	}

	@RequestMapping("/delete.do")
	public String deleteAdmin(@RequestParam("del_name") String name) {
		int res = customer_biz.getDelete(name);
		if (res > 0)
			return "/selectAll.do";
		return "";
	}
	

	@RequestMapping(value = "/customer/join.do", method = RequestMethod.GET)
	public ModelAndView customerJoin() {
		CustomerVO VO = new CustomerVO();
		ModelAndView mav = new ModelAndView("/WEB-INF/view/customer/join.jsp","customer",VO);
		return mav;
		
	}	

	@RequestMapping(value = "/customer/join.do", method = RequestMethod.POST)
	public ModelAndView MyInsert(@ModelAttribute("customer") CustomerVO customer,Errors result) {
		int r = 0;
		/*customer_biz.validate(customer, result);
		if(result.hasErrors()) {  	
			return new ModelAndView("/WEB-INF/view/customer/join.jsp");
		}*/
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
		System.out.println(customer);
		r = customer_biz.getInsert(customer);
		
		if(r ==  0) {
			mav.addObject("msg", "올바른 값을 입력하십시오.");
			mav.addObject("url", "join.do");
			return mav;
		}
		mav.addObject("msg", "가입이 완료되었습니다.");
		mav.addObject("url", "/ITformation/index.jsp");
		return mav;

	}
	
	
	
	@RequestMapping(value = "/customer/find.do", method = RequestMethod.GET)
	public ModelAndView customerFind() {
		CustomerVO VO = new CustomerVO();
		ModelAndView mav = new ModelAndView("/WEB-INF/view/customer/FindID.jsp","customer",VO);
		return mav;
		
	}
	
	@RequestMapping(value = "/customer/find.do", method = RequestMethod.POST)
	public ModelAndView customerFindID(@ModelAttribute("customer") CustomerVO customer) {
		String ID = null;
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
		System.out.println(customer);
		ID = customer_biz.getCustomerID(customer);
		if(ID == null) {
			mav.addObject("msg", "해당하는 ID가 존재하지 않습니다.");
			mav.addObject("url", "/ITformation/customer/find.do");			
		}else {
			mav.addObject("msg", "당신의 ID는 " + ID + " 입니다.");
			mav.addObject("url", "/ITformation/index.jsp");
		}
		
		return mav;

	}
	
	@RequestMapping(value = "/customer/findPW.do", method = RequestMethod.GET)
	public ModelAndView customerFindPw() {
		CustomerVO VO = new CustomerVO();
		ModelAndView mav = new ModelAndView("/WEB-INF/view/customer/FindPW.jsp","customer",VO);
		return mav;
		
	}
	
	@RequestMapping(value = "/customer/findPW.do", method = RequestMethod.POST)
	public ModelAndView customerFindPW(@ModelAttribute("customer") CustomerVO customer,HttpSession session) {
		CustomerVO vo = null;
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
		System.out.println(customer);
		vo = customer_biz.getCustomerPW(customer);
		if(vo == null) {
			mav.addObject("msg", "답변이 일치하지 않습니다.");
			mav.addObject("url", "/ITformation/customer/findPW.do");			
		}else {
			session.setAttribute("find_ID", vo.getC_id());
			mav = new ModelAndView("redirect:/customer/resetPW.do");
			///WEB-INF/view/customer/resetPW.jsp
		}
		
		return mav;

	}
	
	@RequestMapping(value = "/customer/resetPW.do", method = RequestMethod.GET)
	public ModelAndView customerresetPW() {
		ModelAndView mav = new ModelAndView("/WEB-INF/view/customer/resetPW.jsp");
		return mav;
		
	}
	
	@RequestMapping(value = "/customer/resetPW.do", method = RequestMethod.POST)
	public ModelAndView customerresetPW(@ModelAttribute("customer") CustomerVO customer,HttpSession session) {
		
		ModelAndView mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
		System.out.println(customer);
		customer.setC_id((String)session.getAttribute("find_ID"));
		
		int r = customer_biz.getCustomerResetPW(customer);
		
		if(r == 1) {
			mav.addObject("msg", "비밀 번호가 변경되었습니다.");
			mav.addObject("url", "/ITformation/index.jsp");			
		}else {
			mav.addObject("msg", "비밀번호가 일치하지 않습니다.");
			mav.addObject("url", "/ITformation/customer/resetPW.do");
		}
		
		return mav;

	}

	/*
	 * 회원가입시 중복아이디 - 체크 프론트 버튼 활성화 비밀번호 , 비밀번호 확인 동일한지 확인
	 * 
	 * 로그인시 유효성검사 - id가 있는지 검사 - id가 없을 경우 alert 없는아이디입니다 . - 있을 경우 - pw가 안맞는 경우 -
	 * alert 로그인 실패 하였습니다. - pw가 있는 경우 - 로그인 성공,객체값 넘겨 주기
	 * 
	 * 
	 */

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("userID") String userID,
			@RequestParam("userPassword") String userPassword) {
		CustomerVO vo = new CustomerVO();
		vo.setC_id(userID);
		vo.setC_pw(userPassword); // http session
		ModelAndView mav = null;
		int r = customer_biz.getLogin(vo);
		if(r == 1) {
			mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
			mav.addObject("msg", "일치하는 ID가 존재하지 않습니다.");
			mav.addObject("url", "/ITformation/index.jsp");
			return mav;
		}else if(r == 2) {
			mav = new ModelAndView("/WEB-INF/view/redirect.jsp");
			mav.addObject("msg", "패스워드가 일치하지 않습니다.");
			mav.addObject("url", "/ITformation/index.jsp");
			return mav;
		}
		System.out.println(r);
		return new ModelAndView("/index.jsp", "customer", userID);

	}

	@RequestMapping("/myPage.do")
	public ModelAndView mypage(HttpSession session) {
		String id = (String) session.getAttribute("userID");
		CustomerVO vo = customer_biz.getCustomer(id);
		return new ModelAndView("WEB-INF/view/customer/myPage.jsp", "CustomInfo", vo);
	}

	@RequestMapping(value = "/updateCustomer.do", method = RequestMethod.POST)
	public String updateCustomer(@ModelAttribute CustomerVO user) {
		int r = customer_biz.getUpdate(user);
		System.out.println(r);
		//CustomerVO vo = customer_biz.getCustomer(user.getC_id());
		
		return "/myPage.do";

	}

	@RequestMapping(value = "/deleteCustomer.do", method = RequestMethod.GET)
	public ModelAndView deleteCustomer(@RequestParam("userID") String userID) {
		int res = customer_biz.getDelete(userID);

		return new ModelAndView("/index.jsp");

	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "/index.jsp";
	}

}

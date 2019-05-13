package contest.controller;

import java.io.FileWriter;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import contest.vo.Jamong;

@Controller
public class ContestServlet {

	@RequestMapping(value = "/go.do", method = RequestMethod.GET)
	@ResponseBody
	public String ConCalendar(Jamong jamong) {
		// 필요한 로직 처리
		jamong.setAge(13);
		jamong.setName("abcde");
		return jamong.getName() + jamong.getAge();
	}

	// 입력 받아서 JSON 파일에 추가해준다.
	@RequestMapping(value = "/go1.do", method = RequestMethod.GET)
	public ModelAndView CreateJsonVO(@ModelAttribute ConTVO conTVO) {
		// date라는 이름의 JSON 객체를 만들어줍니다.
		
		
		JSONObject data = new JSONObject();
		data.put("title", conTVO.getTitle());
		data.put("end", conTVO.getEnd());// 
		data.put("start", conTVO.getStart()); 
		data.put("url", conTVO.getUrl());
		
		JSONArray jsonArray = new JSONArray();

			jsonArray.add(data); // response라는 이름의 Key값으로 전에 만든 data객체를 Value로 넣어줍니다.

		String json = jsonArray.toJSONString();// toJSONString()이라는 메소드를 이용해서 response 객체의 데이터를 문저열로 바꾸어 줍니다.
		System.out.println("만들어진 json 데이타 : " + json); // 만들어진 데이터를 출력해 봅시다.

		try {
			FileWriter file = new FileWriter("C:\\WebWork\\ITformation\\WebContent\\A.json", true);
			file.write(jsonArray.toJSONString());
			file.flush();
			file.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.print(jsonArray);


		return null;

	}

}

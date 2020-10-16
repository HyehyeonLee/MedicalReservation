package com.dy.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dy.dto.MemberDto;
import com.dy.service.MemberService;
import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.protobuf.TextFormat.ParseException;

@Controller
public class HomeController {
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
}
	@Autowired
	private KakaoController KakaoController;
	
	@Autowired
	MemberService ser;
	
//	@RequestMapping("/loginform")
//	public String loginform() {
//		return "loginform";
//	}
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	@RequestMapping(value = "/joinform", method = RequestMethod.GET)
	public String joinform(MemberDto dto) {
		return "joinform";
	}
	@RequestMapping("/insertAction")
	public String joinSuccess(@ModelAttribute("dto") MemberDto dto) {
		
		//ser.insertMemberAction(dto);
		ser.insertMemberAction(dto);
		int result=ser.idCheckAction(dto);
		if(result==1) {
			return "/joinform";
		}else if(result==0) {
			ser.insertMemberAction(dto);
		}
		return "joinSuccess";
	}
	@RequestMapping("/loginAction")
	public String loginAction(@ModelAttribute("dto") MemberDto dto, HttpSession session) {
		boolean result = ser.loginMemberAction(dto);
		if(result==true) {
			session.setAttribute("loginId", dto.getId());
			return "loginsuccess";
		}else {
			return "redirect:/loginform";
		}
	}
	@ResponseBody
	@RequestMapping("/idCheckAction")
	public int idCheckAction(MemberDto dto) {
		int result = ser.idCheckAction(dto);
		return result;
	}
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/loginform", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		
		//네이버
		System.out.println("네이버:" + naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		//카카오
		System.out.println("카카오:"+kakaoUrl);
		model.addAttribute("kakao_url",kakaoUrl);
		return "loginform";
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj;
		try {
			obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			System.out.println(jsonObj.toString());
			//3. 데이터 파싱
			//Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			//response의 nickname값 파싱
			String name = (String)response_obj.get("name");
			System.out.println(name);
			//4.파싱 닉네임 세션으로 저장
			session.setAttribute("sessionId",name); //세션 생성
		} catch (org.json.simple.parser.ParseException e) {
			e.printStackTrace();
		}
		model.addAttribute("result", apiResult);
		return "loginform";
	}
	@RequestMapping(value = "/login.do", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST }) 
	public ModelAndView kakaoLogin(@RequestParam("code") String code,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception { 
		System.out.println(code);
			ModelAndView mav = new ModelAndView(); 
			// 결과값을 node에 담아줌 
			JsonNode node = KakaoController.getAccessToken(code); 
			System.out.println(node.toString());
			// accessToken에 사용자의 로그인한 모든 정보가 들어있음 
			JsonNode accessToken = node.get("access_token"); 
			// 사용자의 정보 
			JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);
			String kemail = null; 
			String kname = null; 
			String kgender = null; 
			String kbirthday = null; 
			String kage = null; 
			String kimage = null; 
			// 유저정보 카카오에서 가져오기 Get properties 
			JsonNode properties = userInfo.path("properties"); 
			JsonNode kakao_account = userInfo.path("kakao_account"); 
			kemail = kakao_account.path("email").asText(); 
			kname = properties.path("nickname").asText(); 
			kimage = properties.path("profile_image").asText(); 
			kgender = kakao_account.path("gender").asText(); 
			kbirthday = kakao_account.path("birthday").asText(); 
			kage = kakao_account.path("age_range").asText(); 
			mav.addObject("kemail", kemail);
			mav.addObject("kname", kname); 
			mav.addObject("kimage", kimage); 
			mav.addObject("kgender", kgender); 
			mav.addObject("kbirthday", kbirthday); 
			mav.addObject("kage", kage); 
			System.out.println(kname);
			
			mav.setViewName("kakaosuccess"); 
		return mav; 
		
	}// end kakaoLogin()
	
//	@RequestMapping(value = "/login.do")
//	public String getKakaoSignIn(ModelMap model,@RequestParam("code") String code, HttpSession session) throws Exception {
//		//System.out.println("1");
//	  JsonNode accessToken = KakaoController.getAccessToken(code);
//	  //HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
//	  JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);
//	  System.out.println(accessToken);
//	  System.out.println(userInfo);
//	 // System.out.println("3");
//	  String id = userInfo.get("id").toString();
//	 // String id = "id";
//	  String email = userInfo.get("kaccount_email").toString();
//	  String image = userInfo.get("properties").get("profile_image").toString();
//	  String nickname = userInfo.get("properties").get("nickname").toString();
//
//	  System.out.println(id + email);
//
//
//	  model.addAttribute("k_userInfo", userInfo);
//	  model.addAttribute("id", id);
//	  model.addAttribute("email", email);
//	  model.addAttribute("nickname", nickname);
//	  model.addAttribute("image", image);
//
//	  return "kakaosuccess";
//	}
	//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
			session.invalidate();
			System.out.println("로그아웃 되었습니다.");
			return "redirect:/index";
		}
}

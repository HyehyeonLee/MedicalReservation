package com.medical.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.protobuf.TextFormat.ParseException;
import com.medical.dto.GrahpDto;
import com.medical.dto.MemberDto;
import com.medical.email.Email;
import com.medical.email.EmailSender;
import com.medical.service.MemberService;
import com.medical.service.Sha256;
import com.medical.xml.GrahpXml;
import com.medical.xml.GrahpXml2;


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
	
	@Autowired
	GrahpXml grahpXml1;
	GrahpXml2 grahpXml2;
	
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;
	
//	@RequestMapping("/l  oginform")
//	public String loginform() {
//		return "loginform";
//	}
	
	@RequestMapping("/L_index")
	public String index(Model model) {
		GrahpXml grahpXml1 = new GrahpXml();
		GrahpXml2 grahpXml2 = new GrahpXml2();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, -1);
		String end = df.format(cal.getTime());
		cal.add(Calendar.DATE, -5);
		String start = df.format(cal.getTime());
		ArrayList<GrahpDto> list = grahpXml1.arrList(start,end);
		model.addAttribute("list",list);
		ArrayList<GrahpDto> list2 = grahpXml2.arrList(end,end);
		model.addAttribute("list2",list2);
		return "L_index";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	@RequestMapping(value = "/J_joinform", method = RequestMethod.GET)
	public String joinform(MemberDto dto) {
		return "J_joinform";
	}
	@RequestMapping("/insertAction")
	public String joinSuccess(@ModelAttribute("dto") MemberDto dto) {
		  // 암호 확인
	      System.out.println("첫번째:" + dto.getPw());
	      System.out.println("두번째:"+dto.getName());
	      // 비밀번호 암호화 (sha256
	      String encryPassword = Sha256.encrypt(dto.getPw());
	      dto.setPw(encryPassword);
	      System.out.println("두번째:" + dto.getPw());
	      System.out.println("세번째 :"+dto.getDetailAddress());
	      
		//ser.insertMemberAction(dto);
	//	ser.insertMemberAction(dto);
		int result=ser.idCheckAction(dto);
		if(result==1) {
			return "/J_joinform";
		}else if(result==0) {
			ser.insertMemberAction(dto);
		}
		return "J_joinSuccess";
	}
	@RequestMapping("/L_idsearch")
	public String idsearch() {
		return "L_idsearch";
	}
	@RequestMapping("/idSearchAction")
	public String idSearchAction(Model model, String name, String email, HttpSession session) {
		String id = ser.idSearchAction(name, email);
		model.addAttribute("find_id", id);
		return "L_idsearch";
	}
	
//	@RequestMapping("/idSearchAction")
//	public String idSearchAction(Model model, HttpServletResponse res, String name, String email) {
//		String id = ser.idSearchAction(name, email);
//		res.setContentType("text/html; charset=UTF-8");
//		try {
//			PrintWriter out = res.getWriter();
//			out.println("<script>alert('아이디는"+id+"입니다!');</script>");
//			out.flush();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return "redirect:/L_idsearch";
//	}
	
	@RequestMapping("/loginAction")
	public String loginAction(@ModelAttribute("dto") MemberDto dto, HttpSession session) {
		boolean result = ser.loginMemberAction(dto);
		if(result==true) {
			session.setAttribute("loginId", dto.getId());
			return "L_loginsuccess";
		}else {
			return "redirect:/L_loginform";
		}
	}
	@ResponseBody
	@RequestMapping("/idCheckAction")
	public int idCheckAction(MemberDto dto) {
		int result = ser.idCheckAction(dto);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/emailCheckAction")
	public int emailCheckAction(MemberDto dto) {
		int email_result = ser.emailCheckAction(dto);
		return email_result;
	}
	
	
	//비밀번호 암호화
		@RequestMapping(value = "/reg", method = RequestMethod.POST)
		   public String userRegPass(MemberDto dto, Model model, HttpServletRequest request) {
			//String encryptPw = URLDecoder.decode(dto.getPw());
			
		      // 암호 확인
		      System.out.println("첫번째:" + dto.getPw());
		      // 비밀번호 암호화 (sha256
		      String encryPassword = Sha256.encrypt(dto.getPw());
		      dto.setPw(encryPassword);
		      System.out.println("두번째:" + dto.getPw());
		     //  회원가입 메서드
		      //ser.insertMemberAction(dto);
		      // 인증 메일 보내기 메서드
//		      mailsender.mailSendWithUserKey(userVO.getUser_email(), userVO.getUser_id(), request);

		      return "redirect:/";
		   }
		@RequestMapping("/L_pwsearch")
		public String pwSearch() {
			return "L_pwsearch";
		}
		//email
		@RequestMapping("/sendpw.do")
	    public ModelAndView sendEmailAction (@RequestParam Map<String, String> paramMap, ModelMap model,MemberDto dto,Model model1) throws Exception {
	        ModelAndView mav;
	        String id=(String) paramMap.get("id");
	        System.out.println(id);
	        String e_mail=(String) paramMap.get("email");
	        System.out.println(e_mail);
	        
	        StringBuffer temp =new StringBuffer();
	        Random rnd = new Random();
	        for(int i=0;i<10;i++)
	        {
	            int rIndex = rnd.nextInt(3);
	            switch (rIndex) {
	            case 0:
	                // a-z
	                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
	                break;
	            case 1:
	                // A-Z
	                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
	                break;
	            case 2:
	                // 0-9
	                temp.append((rnd.nextInt(10)));
	                break;
	            }
	        }
	        String encryPassword = Sha256.encrypt(temp.toString());
	        
	        System.out.println("temp:"+temp);   // UKIiu12jr3
	        paramMap.put ("pw", encryPassword);
	        int pw=(int)ser.setPw(paramMap);
	        if(pw!=0) {
	            email.setContent("비밀번호는 "+temp+" 입니다.");
	            email.setReceiver(e_mail);
	            email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	            mav= new ModelAndView("redirect:/L_loginform");
	            return mav;
	        }else {
	            mav=new ModelAndView("redirect:/L_index");
	            return mav;
	        }
	        
	    }

		
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/L_loginform", method = { RequestMethod.GET, RequestMethod.POST })
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
		return "L_loginform";
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
		return "L_loginform";
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
			
			mav.setViewName("L_kakaosuccess"); 
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
//	  model.addAttribute( "image", image);
//
//	  return "kakaosuccess";
//	}
	//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
			session.invalidate();
			System.out.println("로그아웃 되었습니다.");
			return "redirect:/L_index";
		}

}

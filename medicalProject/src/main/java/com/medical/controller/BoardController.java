package com.medical.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.medical.dto.BoardDto;
import com.medical.dto.PageMaker;
import com.medical.dto.ReplyDto;
import com.medical.dto.SearchCriteria;
import com.medical.service.BoardService;
import com.medical.service.ReplyService;

@Controller
public class BoardController {

	@Autowired
	ReplyService replyService;

	@Autowired
	BoardService service;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	// 게시판 글 작성 화면
	@RequestMapping(value = "/writeView", method = { RequestMethod.GET, RequestMethod.POST })
	public void writeView() throws Exception {
		logger.info("writeView");
		System.out.println("/writeView in Controller");
	}

	// 게시판 글 작성 
	@RequestMapping(value = "/write", method = { RequestMethod.GET, RequestMethod.POST })
	public String write(BoardDto dto , MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("write");
		
		service.insert(dto , mpRequest );

		return "redirect:/list";
	}

	// 게시글 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model ,@ModelAttribute("scri")   SearchCriteria scri) throws Exception {

		logger.info("list");
		
		model.addAttribute("list", service.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker" , pageMaker);
		
		return "list";

	}
	
	// 게시판 글 조회 
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardDto dto, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", service.read(dto.getBno()));
		model.addAttribute("scri" , scri);
		
		List<ReplyDto> replyList = replyService.readReply(dto.getBno());
		model.addAttribute("replyList" , replyList);
		
		List<Map<String , Object>> fileList = service.selectFileList(dto.getBno());
		model.addAttribute("file" , fileList);		
		
		return "readView";
	}
	
	// 게시글 수정뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(BoardDto dto,@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");

		model.addAttribute("update", service.read(dto.getBno()));
		model.addAttribute("scri" ,scri );
		
		List<Map<String , Object>> fileList = service.selectFileList(dto.getBno());
		model.addAttribute("file" , fileList);
		
		return "updateView";
	}
	
	// 게시글 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardDto dto ,RedirectAttributes rttr ,@ModelAttribute("scri") SearchCriteria scri , 
			@RequestParam(value="fileNameDel[]") String[] fileNames , 
			@RequestParam(value="fileNoDel[]") String files, 
			MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("update");
System.out.println(111);
		service.update(dto , fileNames , files , mpRequest);
System.out.println(222);
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:list";
	}

	// 게시글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardDto dto,RedirectAttributes rttr ,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("delete");

		service.delete(dto.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/list";
	}

	// 댓글작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String writeReply(ReplyDto dto,RedirectAttributes rttr ,SearchCriteria scri) throws Exception{
		logger.info("writeReply");

		replyService.writeReply(dto);
		
		rttr.addAttribute("bno" , dto.getBno());
		rttr.addAttribute("rno" , dto.getRno());
		rttr.addAttribute("content" , dto.getContent());
		rttr.addAttribute("writer" , dto.getWriter());
		
		return "redirect:/readView";
	}

	@RequestMapping(value = "/replyUpdateView", method = RequestMethod.GET)
	public String replyUpadateView(ReplyDto dto , Model model,SearchCriteria scri) throws Exception{
		logger.info("replyUpdateView");
		
		model.addAttribute("replyUpadate" , replyService.selectReply(dto.getRno()));
		model.addAttribute("scri" , scri);
		
		return "replyUpdateView";
	}
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyDto dto,RedirectAttributes rttr ,SearchCriteria scri) throws Exception{
		logger.info("replyUpdate");
		
		replyService.updateReply(dto);
		
		rttr.addAttribute("bno" ,dto.getBno() );
		rttr.addAttribute("rno" ,dto.getRno());
		rttr.addAttribute("page" , scri.getPage());
		rttr.addAttribute("perPageNum" , scri.getPerPageNum());
		rttr.addAttribute("searchType" , scri.getSearchType());
		rttr.addAttribute("keyword" , scri.getKeyword());
		
		return "redirect:/readView"; 
	}

	@RequestMapping(value = "/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(ReplyDto dto , Model model , SearchCriteria scri) throws Exception {
		logger.info("replyDeleteView");
		
		model.addAttribute("replyDelete" , replyService.selectReply(dto.getRno()));
		model.addAttribute("scri" , scri);
		
		return "replyDeleteView"; 
	}

	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyDto dto ,RedirectAttributes rttr , SearchCriteria scri) throws Exception {
		logger.info("replyDelete");
		
		replyService.deleteReply(dto);

		rttr.addAttribute("bno" ,dto.getBno() );
		rttr.addAttribute("page" , scri.getPage());
		rttr.addAttribute("perPageNum" , scri.getPerPageNum());
		rttr.addAttribute("searchType" , scri.getSearchType());
		rttr.addAttribute("keyword" , scri.getKeyword());

		
		return "redirect:/readView"; 
	}

	@RequestMapping(value="/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("stored_file_name");
		String originalFileName = (String) resultMap.get("org_file_name");
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\mp\\file\\"+storedFileName));
		
		response.setContentType("text/html;charset=UTF-8");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
}

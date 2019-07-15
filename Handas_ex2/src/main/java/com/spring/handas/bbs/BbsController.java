package com.spring.handas.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.handas.PageMaker;

@Controller
public class BbsController {
	
	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/bbs")
	public String bbs(HttpSession session) {
		logger.info("bbs()");
		
		session.setAttribute("menu", "bbs");
		
		return "redirect:/bbs/list";
	}
	
	@RequestMapping(value="/bbs/list")
	public String bbsList(Model model, @RequestParam(value="curPage", defaultValue="1") int curPage) {
		logger.info("bbsList()");
		
		BbsDao dao = sqlSession.getMapper(BbsDao.class);
		
		int pageView = 10;
		int total = dao.bbsCnt();
		
		PageMaker paging = new PageMaker(curPage, total, pageView);

		model.addAttribute("bbsList", dao.bbsList(paging));
		model.addAttribute("paging", paging);
		return "bbs/list";
	}
	
	// 글작성
	@RequestMapping(value="/bbs/writeForm")
	public String bbsWirteForm(HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("userID") == null) {
			redirect.addFlashAttribute("msgType", "경고창");
			redirect.addFlashAttribute("msgContent", "글쓰기 권한이 없습니다.");
			
			return "redirect:/bbs/list";
		}
		
		return "bbs/write";
	}
	
	@RequestMapping(value="/bbs/write")
	public String bbsWrite(BbsDto dto, HttpSession session) {
		
		dto.setWriter((String) session.getAttribute("userID"));
		
		BbsDao dao = sqlSession.getMapper(BbsDao.class);
		dao.bbsWrite(dto);
		
		return "redirect:/bbs/list"; 
	}
	
	// 글읽기
	@RequestMapping(value="/bbs/read")
	public String bbsRead(HttpServletRequest request, Model model) {
		String bnum = request.getParameter("bnum");
		
		BbsDao dao = sqlSession.getMapper(BbsDao.class);
		
		// 조회수 올리기
		dao.bbsCntUp(Integer.parseInt(bnum));
		model.addAttribute("dto", dao.bbsRead(Integer.parseInt(bnum)));
		return "bbs/read";
	}
	
	// 글삭제
	@RequestMapping(value="/bbs/delete")
	public String bbsDelete(HttpServletRequest request, HttpSession session, RedirectAttributes redirect) {
		String bnum = request.getParameter("bnum");
		String writer = request.getParameter("writer");
		
		String userID = (String) session.getAttribute("userID");
		String role = (String) session.getAttribute("role");
		
		BbsDao dao = sqlSession.getMapper(BbsDao.class);
		
		// 삭제는 로그인한 회원 중 작성자 본인이거나, 관리자 계정일 경우 가능
		if(userID != null && (writer.equals(userID)) || role.equals("admin")) {
			dao.bbsDelete(Integer.parseInt(bnum));
		} else {
			redirect.addFlashAttribute("msgType", "경고창");
			redirect.addFlashAttribute("msgContent", "삭제 권한이 없습니다.");
		}
		
		return "redirect:/bbs/read?bnum=" + bnum;
	}
	
	// 글수정
	@RequestMapping(value="/bbs/updateForm")
	public String bbsUpdateForm(HttpServletRequest request, RedirectAttributes redirect, HttpSession session, Model model) {
		String bnum = request.getParameter("bnum");
		
		// 글작성자
		String writer = request.getParameter("writer");
		
		// 로그인 아이디
		String userID = (String) session.getAttribute("userID");
		
		BbsDao dao = sqlSession.getMapper(BbsDao.class);
		
		// 수정은 로그인한 회원 중 작성자 본인만 가능
		if(userID != null && writer.equals(userID)) {	
			model.addAttribute("dto", dao.bbsRead(Integer.parseInt(bnum)));
		} else {
			redirect.addFlashAttribute("msgType", "경고창");
			redirect.addFlashAttribute("msgContent", "수정 권한이 없습니다.");
			return "redirect:/bbs/read?bnum=" + bnum;
		}
		
		return "bbs/update";
	}
	
	@RequestMapping(value="/bbs/update")
	public String bbsUpdate(BbsDto dto, RedirectAttributes redirect, HttpSession session) {
		
		// 로그인 아이디
		String userID = (String) session.getAttribute("userID");
		
		BbsDao dao = sqlSession.getMapper(BbsDao.class);
		
		// 수정은 로그인한 회원 중 작성자 본인만 가능
		if(userID != null && dto.getWriter().equals(userID)) {	
			dao.bbsUpdate(dto);
		} else {
			redirect.addFlashAttribute("msgType", "경고창");
			redirect.addFlashAttribute("msgContent", "수정 권한이 없습니다.");
			return "redirect:/bbs/read?bnum=" + dto.getBnum();
		}
		
		return "redirect:/bbs/read?bnum=" + dto.getBnum();
	}
	// 검색
	
	// 답글
}

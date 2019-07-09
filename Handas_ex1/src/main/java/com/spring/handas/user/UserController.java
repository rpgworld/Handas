package com.spring.handas.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {
	
	@Autowired
	SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="/user/loginForm")
	public String loginForm() {
		logger.info("loginForm()");
		
		return "user/login";
	}
	
	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request, RedirectAttributes redirect) {
		logger.info("login()");
		
		String userID= request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		
		String pwChk = null; // 실제(DB) 회원 비밀번호
		
		String msgType="";
		String msgContent="";
		
		String viewPage = "";
		
		UserDao dao = sqlSession.getMapper(UserDao.class);
		pwChk = dao.login(userID);
		
		HttpSession session = request.getSession();
		
		if(pwChk != null) {
			if(pwChk.equals(userPW)) { // 로그인 성공
				msgType = "성공";
				msgContent = userID + "님 환영합니다.";
				session.setAttribute("userID", userID);
				viewPage = "redirect:/index";
				
			} else { // 비밀번호 불일치
				
				msgType = "경고창";
				msgContent = "비밀번호가 일치하지 않습니다.";
				viewPage = "redirect:loginForm";
			}
		} else { // 아이디가 존재하지 않음
			
			msgType = "경고창";
			msgContent = "아이디가 존재하지 않습니다.";
			viewPage = "redirect:loginForm";
		}
		
		redirect.addFlashAttribute("msgType", msgType);
		redirect.addFlashAttribute("msgContent", msgContent);
		return viewPage;
	}
	
	@RequestMapping(value="/user/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("userID");
		return "redirect:/index";
	}
	
	@RequestMapping(value="/user/idCheck", method=RequestMethod.GET)
	@ResponseBody
	public int idCheck(HttpServletRequest request) {
		logger.info("idCheck()");
		
		String userID = request.getParameter("userID");
		System.out.println(userID);
		UserDao dao = sqlSession.getMapper(UserDao.class);
		int result = dao.idCheck(userID);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="/user/joinForm")
	public String joinForm() {
		logger.info("joinForm()");
		
		return "user/join";
	}
	
	@RequestMapping(value="/user/join")
	public String join(UserDto dto, RedirectAttributes redirect) {
		
		UserDao dao = sqlSession.getMapper(UserDao.class);
		dao.join(dto.getUserID(), dto.getUserPW(), dto.getUserName(), dto.getAddress1(), dto.getAddress2(), dto.getAddress3(), dto.getUserEmail());
		
		redirect.addFlashAttribute("msgType", "성공");
		redirect.addFlashAttribute("msgContent", "회원가입에 성공하셨습니다.");
		return "redirect:loginForm";
	}
	
	@RequestMapping(value="/user/read")
	public String readForm(HttpSession session, Model model) {
		logger.info("user/readForm()");
		
		if(session.getAttribute("userID") == null) {
			return "redirect:/index";
		}
		String userID = (String) session.getAttribute("userID");
		UserDao dao = sqlSession.getMapper(UserDao.class);
		model.addAttribute("dto", dao.read(userID));
		
		return "user/read";
	}
	
	@RequestMapping(value="/user/updateForm")
	public String updateForm(HttpSession session, Model model) {
		logger.info("user/updateForm()");
		
		if(session.getAttribute("userID") == null) {
			return "redirect:/index";
		}
		String userID = (String) session.getAttribute("userID");
		UserDao dao = sqlSession.getMapper(UserDao.class);
		model.addAttribute("dto", dao.read(userID));
		
		return "user/update";
	}
	
	@RequestMapping(value="/user/update")
	public String update(HttpSession session, UserDto dto, RedirectAttributes redirect) {
		logger.info("user/update()");
		
		String userID = (String) session.getAttribute("userID");
		UserDao dao = sqlSession.getMapper(UserDao.class);
		dao.update(dto.getUserPW(), dto.getUserName(), dto.getAddress1(), dto.getAddress2(), dto.getAddress3(), dto.getUserEmail(), userID);
		
		redirect.addFlashAttribute("msgType", "성공");
		redirect.addFlashAttribute("msgContent", "회원 정보 수정이 완료되었습니다.");
		return "redirect:updateForm";
	}
}

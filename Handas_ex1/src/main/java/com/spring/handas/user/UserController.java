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
	
	@RequestMapping(value="/user")
	public String bbs(HttpSession session) {
		logger.info("user()");
		
		session.setAttribute("menu", "user");
		
		return "redirect:login";
	}
	
	@RequestMapping(value="/user/loginForm")
	public String loginForm(HttpSession session) {
		logger.info("loginForm()");
		
		session.setAttribute("menu", "user");
		
		return "user/login";
	}
	
	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	@ResponseBody
	public int login(HttpServletRequest request) {
		logger.info("login()");
		
		String userID= request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		System.out.println(userID);
		String pwChk = null; // 실제(DB) 회원 비밀번호
		
		int result = 0;
		
		UserDao dao = sqlSession.getMapper(UserDao.class);
		pwChk = dao.login(userID);
		
		HttpSession session = request.getSession();
		
		logger.info("login() 끝");
		if(pwChk != null) {
			if(pwChk.equals(userPW)) { // 로그인 성공
				session.setAttribute("userID", userID);
				session.setAttribute("role", dao.roleCheck(userID));
				result = 100;
			
			} else { // 비밀번호 불일치
				result = -100;
			}
		} else { // 아이디가 존재하지 않음
			result = -200;
			
		}
		
		return result;
	}
	
	@RequestMapping(value="/user/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("userID");
		session.removeAttribute("role");
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
	public String joinForm(HttpSession session) {
		logger.info("joinForm()");
		
		session.setAttribute("menu", "user");
		
		return "user/join";
	}
	
	@RequestMapping(value="/user/join")
	public String join(UserDto dto, RedirectAttributes redirect) {
		
		UserDao dao = sqlSession.getMapper(UserDao.class);
		dao.join(dto);
		
		redirect.addFlashAttribute("msgType", "성공");
		redirect.addFlashAttribute("msgContent", "회원가입에 성공하셨습니다.");
		return "redirect:loginForm";
	}
	
	@RequestMapping(value="/user/read")
	public String readForm(HttpSession session, Model model) {
		logger.info("user/readForm()");
		
		session.setAttribute("menu", "user");
		
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
		
		session.setAttribute("menu", "user");
		
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
		
		if(session.getAttribute("userID") == null) {
			return "redirect:/index";
		}
		dto.setUserID((String) session.getAttribute("userID"));
		UserDao dao = sqlSession.getMapper(UserDao.class);
		dao.update(dto);
		
		redirect.addFlashAttribute("msgType", "성공");
		redirect.addFlashAttribute("msgContent", "회원 정보 수정이 완료되었습니다.");
		return "redirect:read";
	}
}

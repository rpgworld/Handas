package com.spring.handas.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.handas.dao.UserDao;

@Controller
public class UserController {
	
	@Autowired
	SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="/index")
	public String index() {
		logger.info("index()");
		return "index";
	}
	
	@RequestMapping(value="/loginForm")
	public String loginForm() {
		logger.info("loginForm()");
		
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request, RedirectAttributes redirect) {
		logger.info("login()");
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		String pwChk = null; // 실제(DB) 회원 비밀번호
		
		String msgType="";
		String msgContent="";
		
		String viewPage = "";
		
		UserDao dao = sqlSession.getMapper(UserDao.class);
		pwChk = dao.login(userId);
		
		HttpSession session = request.getSession();
		
		if(pwChk != null) {
			if(pwChk.equals(userPw)) { // 로그인 성공
				session.setAttribute("userId", userId);
				viewPage = "index";
				
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
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("userId");
		return "redirect:index";
	}
	
	@RequestMapping(value="/joinForm")
	public String joinForm() {
		logger.info("joinForm()");
		
		return "join";
	}
}

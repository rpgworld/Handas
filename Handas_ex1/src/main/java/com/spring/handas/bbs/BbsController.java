package com.spring.handas.bbs;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BbsController {
	
	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/bbs/list")
	public String bbsList(Model model) {
		logger.info("bbsList()");
		
		BbsDao dao = sqlSession.getMapper(BbsDao.class);

		model.addAttribute("bbsList", dao.bbsList());
		return "bbs/list";
	}
}

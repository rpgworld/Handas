package com.spring.handas.shop;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ShopController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/shop/list")
	public String shopList(Model model) {
		logger.info("shopList()");
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		System.out.println(dao.shopList().size());
		model.addAttribute("list", dao.shopList());
		return "shop/list";
	}
	
	@RequestMapping(value="/shop/writeForm")
	public String shopWriteForm() {
		logger.info("shopWriteForm()");
		
		return "shop/write";
	}
	
	@RequestMapping(value = "/shop/write", method = RequestMethod.POST)
	public String uploadForm(HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		
		String pname = request.getParameter("pname");
		String item = request.getParameter("item");
		String price = request.getParameter("price");
		String pdesc = request.getParameter("pdesc");
		
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());

		String img1 = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		dao.shopWrite(pname, item, Integer.parseInt(price), pdesc, img1, "nono");
		
		return "redirect:shopList";
	}
	
	// 업로드 메서드
	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
}

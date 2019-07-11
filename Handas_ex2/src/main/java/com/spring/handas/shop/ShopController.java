package com.spring.handas.shop;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.handas.PageMaker;
import com.spring.handas.Upload;
import com.spring.handas.user.UserDao;

@Controller
public class ShopController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value="/shop")
	public String bbs(HttpSession session) {
		logger.info("shop()");
		
		session.setAttribute("menu", "shop");
		
		return "redirect:/shop/list";
	}
	
	@RequestMapping(value="/shop/list")
	public String shopList(@RequestParam(value="curPage", defaultValue="1") int curPage, Model model) {
		logger.info("shopList()");
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int pageView = 5; // 한 페이지당 보여줄 게시물 수
		int total = dao.shopCnt(); // 전체 게시물 수
		PageMaker paging = new PageMaker(curPage, total, pageView);
		
		model.addAttribute("list", dao.shopList(paging));
		model.addAttribute("paging", paging);
		
		return "shop/list";
	}
	
	@RequestMapping(value="/shop/read")
	public String shopRead(HttpServletRequest request, Model model) {
		logger.info("shopRead()");
		
		String pnum = request.getParameter("pnum");
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		model.addAttribute("dto", dao.shopRead(Integer.parseInt(pnum)));
		
		return "shop/read";
	}
	
	@RequestMapping(value = "/shop/update", method = RequestMethod.POST)
	public String uploadForm(ShopDto dto, @RequestParam(value="file", defaultValue="img") MultipartFile file, RedirectAttributes redirect) throws Exception {

		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		Upload upload = new Upload();
		String savedName = upload.uploadFile(dto.getPname(), file.getOriginalFilename(), file.getBytes());
		dto.setImg(savedName);
		
		dao.shopUpdate(dto);
		
		redirect.addAttribute("msgType", "성공");
		redirect.addAttribute("msgContent", "수정이 완료되었습니다.");
		
		return "redirect:/shop/list";
	}
	
	@RequestMapping(value="/shop/delete")
	public String shopDelete(HttpServletRequest request, RedirectAttributes redirect) {
		logger.info("shopDelete()");
		
		String pnum = request.getParameter("pnum");
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		dao.shopDelete(Integer.parseInt(pnum));
		
		redirect.addAttribute("msgType", "성공");
		redirect.addAttribute("msgContent", "삭제가 완료되었습니다.");
		
		return "redirect:/shop/list";
	}
	
	@RequestMapping(value="/shop/writeForm")
	public String shopWriteForm() {
		logger.info("shopWriteForm()");
		
		return "shop/write";
	}
	
	@RequestMapping(value = "/shop/write", method = RequestMethod.POST)
	public String shopWrite(ShopDto dto,  @RequestParam(value="file", defaultValue="img") MultipartFile file, RedirectAttributes redirect) throws Exception {
		logger.info("shopWrite()");
		
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		Upload upload = new Upload();
		String savedName = upload.uploadFile(dto.getPname(), file.getOriginalFilename(), file.getBytes());
		dto.setImg(savedName);
		
		dao.shopWrite(dto);
		
		redirect.addAttribute("msgType", "성공");
		redirect.addAttribute("msgContent", "상품등록이 완료되었습니다.");
		return "redirect:shopList";
	}
	
	@RequestMapping(value="/shop/purchase")
	public String readForm(HttpSession session, Model model) {
		logger.info("shop/purchase()");
		
		if(session.getAttribute("userID") == null) {
			return "redirect:/index";
		}
		String userID = (String) session.getAttribute("userID");
		UserDao dao = sqlSession.getMapper(UserDao.class);
		model.addAttribute("dto", dao.read(userID));
		
		return "shop/purchase";
	}
}

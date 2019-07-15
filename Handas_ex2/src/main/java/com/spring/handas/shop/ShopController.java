package com.spring.handas.shop;

import java.util.ArrayList;

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
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		int pageView = 6; // 한 페이지당 보여줄 게시물 수
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
	
	@RequestMapping(value = "/shop/updateForm", method = RequestMethod.GET)
	public String updateForm(HttpServletRequest request, Model model) {
		
		String pnum = request.getParameter("pnum");
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		ShopDto dto = dao.shopRead(Integer.parseInt(pnum));
		System.out.println(dto.getImg());
		model.addAttribute("dto", dao.shopRead(Integer.parseInt(pnum)));
		
		
		return "shop/update";
	}
	
	@RequestMapping(value = "/shop/update", method = RequestMethod.POST)
	public String update(ShopDto dto, @RequestParam(value="file", defaultValue="img") MultipartFile file, RedirectAttributes redirect) throws Exception {

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
	public String shopWrite(ShopDto dto,  @RequestParam(value="file") MultipartFile file, RedirectAttributes redirect) throws Exception {
		logger.info("shopWrite()");
		
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		Upload upload = new Upload();
		
		// 기본 이미지 이름
		String savedName = "pen.png";
		
		// 파일이 비었을경우
		if(file.getOriginalFilename() != "") {
			 savedName = upload.uploadFile(dto.getPname(), file.getOriginalFilename(), file.getBytes());
		}
		// db에 전달할 파일 이름세팅
		dto.setImg(savedName);
		
		dao.shopWrite(dto);
		
		redirect.addAttribute("msgType", "성공");
		redirect.addAttribute("msgContent", "상품등록이 완료되었습니다.");
		return "redirect:/shop/list";
	}
	
	@RequestMapping(value="/shop/purchaseForm")
	public String readForm(HttpServletRequest request, HttpSession session, Model model, @RequestParam("list") ArrayList<CartDto> list) {
		logger.info("shop/purchaseForm()");	
		
		System.out.println(list.size());
		
		String pnum = request.getParameter("pnum");
		String volume = request.getParameter("volume");
		
		System.out.println(volume);
		
		if(session.getAttribute("userID") == null) {
			return "redirect:/index";
		}
		String userID = (String) session.getAttribute("userID");
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		model.addAttribute("user", userDao.read(userID));
		
		ShopDao shopDao = sqlSession.getMapper(ShopDao.class);
		ShopDto shopDto = shopDao.shopRead(Integer.parseInt(pnum));
		
		shopDto.setVolume(Integer.parseInt(volume));
		model.addAttribute("shop", shopDto);
		
		return "shop/purchase";
	}
	
	// 장바구니 넣기
	@RequestMapping(value="/shop/cart", method=RequestMethod.POST)
	@ResponseBody
	public String cart(CartDto dto, HttpSession session) {
		
		String userID = "";
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		dto.setUserID(userID);
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		dao.cartWrite(dto);
		
		return "true";
	}
	
	// 장바구니
	@RequestMapping(value="/shop/cartForm")
	public String cartForm(HttpSession session, Model model) {
		logger.info("shop/cartForm");
		
		String userID = "";
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		System.out.println(userID);
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		model.addAttribute("list", dao.cartList(userID));
		
		System.out.println(dao.cartList(userID).size());
		System.out.println(dao.cartList(userID).get(0).getImg());
		
		return "shop/cart";
	}
}

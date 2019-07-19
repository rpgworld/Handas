package com.spring.handas.shop;

import java.util.ArrayList;
import java.util.Date;

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
		System.out.println(pnum);
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		model.addAttribute("dto", dao.shopRead(Integer.parseInt(pnum)));
		
		return "shop/update";
	}
	
	// 상품 정보 수정
	@RequestMapping(value = "/shop/update", method = RequestMethod.POST)
	public String update(ShopDto dto, @RequestParam(value="file", defaultValue = "file") MultipartFile file, RedirectAttributes redirect, HttpSession session) throws Exception {
		logger.info("shopUpdate()");
		
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		Upload upload = new Upload();
		
		String uploadPath = session.getServletContext().getRealPath("/") + "resources\\/images\\/shop_images\\/";
		
		System.out.println(file.getOriginalFilename());
		// 파일이 비어있지 않을 경우
		if(file.getOriginalFilename() != "") {
			 String savedName = upload.uploadFile(dto.getPname(), file.getOriginalFilename(), file.getBytes(), uploadPath);
			 dto.setImg(savedName);
		}
		
		dao.shopUpdate(dto);
		
		redirect.addFlashAttribute("msgType", "성공");
		redirect.addFlashAttribute("msgContent", "수정이 완료되었습니다.");
		
		return "redirect:/shop/list";
	}
	
	@RequestMapping(value="/shop/delete")
	public String shopDelete(HttpServletRequest request, RedirectAttributes redirect, HttpSession session) {
		logger.info("shopDelete()");
		
		String pnum = request.getParameter("pnum");
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		// 로그인이 되어있지 않거나, 관리자 계정이 아닌경우
		String role = (String) session.getAttribute("role");
		if(role == null || !role.equals("admin")) {
			redirect.addFlashAttribute("msgType", "경고창");
			redirect.addFlashAttribute("msgContent", "삭제 권한이 없습니다.");
			
			return "redirect:/shop/list";
		} 
		
		dao.shopDelete(Integer.parseInt(pnum));
		dao.cartDeleteAll(Integer.parseInt(pnum));
		
		redirect.addFlashAttribute("msgType", "성공");
		redirect.addFlashAttribute("msgContent", "삭제가 완료되었습니다.");
		
		return "redirect:/shop/list";
	}
	
	@RequestMapping(value="/shop/writeForm")
	public String shopWriteForm() {
		logger.info("shopWriteForm()");
		
		return "shop/write";
	}
	
	@RequestMapping(value = "/shop/write", method = RequestMethod.POST)
	public String shopWrite(ShopDto dto,  @RequestParam(value="file") MultipartFile file, RedirectAttributes redirect, HttpSession session) throws Exception {
		logger.info("shopWrite()");
		
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		String uploadPath = session.getServletContext().getRealPath("/") + "resources\\/images\\/shop_images\\/";
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		Upload upload = new Upload();
		
		// 기본 이미지 이름
		String savedName = "pen.png";
		
		// 파일이 비었을경우
		if(file.getOriginalFilename() != "") {
			 savedName = upload.uploadFile(dto.getPname(), file.getOriginalFilename(), file.getBytes(), uploadPath);
		}
		// db에 전달할 파일 이름세팅
		dto.setImg(savedName);
		
		dao.shopWrite(dto);
		
		redirect.addFlashAttribute("msgType", "성공");
		redirect.addFlashAttribute("msgContent", "상품등록이 완료되었습니다.");
		return "redirect:/shop/list";
	}
	
	// 구매하기 페이지 이동
	@RequestMapping(value="/shop/purchaseForm", method=RequestMethod.GET)
	public String readForm(HttpSession session, Model model, 
			@RequestParam("pnum")int[] pnum_array, 
			@RequestParam("volume")int[] volume_array,
			@RequestParam(value="check", defaultValue="0")int[] check_array
			) {
		
		logger.info("purchaseForm()");
		
		// 총가격
		int total = 0;
		String userID = (String) session.getAttribute("userID");
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		ShopDao shopDao = sqlSession.getMapper(ShopDao.class);
		
		ArrayList<ShopDto> list = new ArrayList<ShopDto>();
		for(int i = 0; i < pnum_array.length; i++) {
			if(check_array[i] == 1) { // 체크박스에 체크된것만
				ShopDto dto = shopDao.shopRead(pnum_array[i]);
				dto.setVolume(volume_array[i]);
				list.add(dto);
			}
		}
		for(int i = 0; i < list.size(); i++) {
			total += list.get(i).getPrice() * list.get(i).getVolume();
		}
		
		model.addAttribute("userDto", userDao.read(userID));
		model.addAttribute("shopList", list);
		model.addAttribute("total", total);
		return "shop/purchase";
	}
	
	@RequestMapping(value="/shop/purchase", method=RequestMethod.POST)
	public String purchase(HttpSession session,
			@RequestParam("pnum")int[] pnum_array, 
			@RequestParam("volume")int[] volume_array, 
			HttpServletRequest request) {
			
		String userID = (String) session.getAttribute("userID");
		
		String name = request.getParameter("name");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String phone = request.getParameter("phone");
		String message = request.getParameter("message");
		
		int orderNo = (int) (new Date().getTime()/1000);
			
		// 총 가격
		int total = 0;
		ShopDao shopDao = sqlSession.getMapper(ShopDao.class);
		System.out.println(pnum_array.length);
		
		OrderDto orderDto = new OrderDto();
		
		for(int i = 0; i < pnum_array.length; i++) {
			
			ShopDto dto = shopDao.shopRead(pnum_array[i]);
			dto.setVolume(volume_array[i]);
			dto.setOrderNo(orderNo);
			
			if(i == 0) { 
				orderDto.setTotalCnt(pnum_array.length);
				orderDto.setSample_pnum(pnum_array[i]);
			}
			
			shopDao.orderD(dto);
			
			// 재고량 변경
			shopDao.shopCntUpdate(volume_array[i], pnum_array[i]);
			// 해당 카트 삭제
			shopDao.cartDelete(userID, pnum_array[i]);
			
			total += volume_array[i] * dto.getPrice();
		}
		
		
		orderDto.setOrderNo(orderNo);
		orderDto.setUserID(userID);
		orderDto.setName(name);
		orderDto.setAddress1(address1);
		orderDto.setAddress2(address2);
		orderDto.setAddress3(address3);
		orderDto.setPhone(phone);
		orderDto.setMessage(message);
		orderDto.setTotalPrice(total);
		
		shopDao.order(orderDto);
			
		return "shop/finish";
	}
	
	// 주문내역 불러오기
	@RequestMapping(value="/shop/orderList")
	public String orderList(HttpSession session, Model model) {
		
		String userID = (String) session.getAttribute("userID");
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		model.addAttribute("list", dao.getOrderAll(userID));
		return "shop/orderList";
	}
	
	@RequestMapping(value="/shop/orderRead")
	public String orderList(@RequestParam(value="orderNo", defaultValue="0") int orderNo, Model model) {
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		System.out.println(dao.getOrderD(orderNo).size());
		model.addAttribute("list", dao.getOrderD(orderNo));
		return "shop/orderRead";
	}
	
	@RequestMapping(value="/shop/orderDelete")
	public String orderDelete(@RequestParam(value="orderNo", defaultValue="0") int orderNo) {
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		// 주문내역삭제
		// 주문상세내역삭제
		
		return "redirect:/shop/orderList";
	}
	
	// 장바구니 넣기
	@RequestMapping(value="/shop/cart", method=RequestMethod.POST)
	@ResponseBody
	public String cart(CartDto dto, HttpSession session) {
		logger.info("cart()");
		
		String userID = "";
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		dto.setUserID(userID);
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		// 해당 아이디에 장바구니에 제품이 중복된다면
		if(dao.cartCheck(userID, dto.getPnum()) > 0) {
			return "false";
		}
		
		dao.cartWrite(dto);
		
		return "true";
	}
	
	// 장바구니 페이지 이동
	@RequestMapping(value="/shop/cartForm")
	public String cartForm(HttpSession session, Model model) {
		logger.info("shop/cartForm");
		
		session.setAttribute("menu", "user");
		
		String userID = "";
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		model.addAttribute("list", dao.cartList(userID));
		
		
		return "shop/cart";
	}
	
	// 장바구니 삭제
	@RequestMapping(value="/shop/cartDelete", method=RequestMethod.POST)
	@ResponseBody
	public String cartDelete(HttpServletRequest request, HttpSession session) {
		logger.info("shop/cartDelete");
		
		String pnum = request.getParameter("pnum");
		String userID = "";
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		dao.cartDelete(userID, Integer.parseInt(pnum));
		
		return "true";
	}
	
	// 상품평 쓰기
	@RequestMapping(value="/shop/comment", method=RequestMethod.GET)
	@ResponseBody
	public String comment(CommentDto dto, HttpSession session) {
		logger.info("shopComment");
		String userID = "";
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		dto.setUserID(userID);
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		dao.shopComment(dto);
		
		return "true";
	}
	
	// 상품평 불러오기
	@RequestMapping(value="/shop/commentList", method=RequestMethod.GET)
	@ResponseBody
	public ArrayList<CommentDto> commentList(@RequestParam("pnum") int pnum) {
		logger.info("commentList");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		ArrayList<CommentDto> dto = dao.shopCommentList(pnum);
		
		return dto;
	}
	
	// 상품평 삭제
	@RequestMapping(value="/shop/commentDelete", method=RequestMethod.GET)
	@ResponseBody
	public String commentDelete(HttpServletRequest request, HttpSession session) {
		String num = request.getParameter("num");
		String writer = request.getParameter("id");
		
		// 작성자와 로그인한 아이디가 일치하지 않는다면
		String userID = (String) session.getAttribute("userID");
		if(!writer.equals(userID)) {
			return "false";
		}
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		dao.shopCommentDelete(Integer.parseInt(num));
		
		return "true";
	}
}

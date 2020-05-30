package spring.mvc.pmkim;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.MapDAO;
import service.MapService;
import vo.GoodsEventShopMemberVO;
import vo.MemberVO;

@Controller
public class MapController {
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);

	@Autowired
	MapDAO dao;
	@Autowired
	MapService mapService;

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public ModelAndView mapGet(String searchKeyword, String searchProduct, MemberVO memberVO,
			GoodsEventShopMemberVO goodsEvtShopMemberVO) {
		ModelAndView mav = new ModelAndView();
		
		logger.info("controller searchProduct: " + searchProduct);

		mav.addObject("searchKeyword", searchKeyword);
		mav.addObject("searchProduct", searchProduct);
		mav.setViewName("/map");
		return mav;
	}
	
	@RequestMapping(value = "/map", method = RequestMethod.POST)
	@ResponseBody
	public void mapPost(String searchKeyword, String searchProduct, MemberVO memberVO,
			GoodsEventShopMemberVO goodsEvtShopMemberVO, HttpServletResponse response) throws ServletException, IOException{
		
		logger.info("controller searchProduct: " + searchProduct);
		if(goodsEvtShopMemberVO != null) {		
			System.out.println("Controller : "+ goodsEvtShopMemberVO.getShop_code());
			System.out.println("Controller : " + goodsEvtShopMemberVO.getShop_name_detail());
			
			if(searchProduct != null) goodsEvtShopMemberVO.setGood_name(searchProduct);

			if(mapService != null) {
				mapService.AddMySearchStore(goodsEvtShopMemberVO, response);
			}else {
				//logger.info("map mapService NULL");
			}
		}


	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) {

		
		return "/test";
	}
	
	@RequestMapping(value = "/mapTemp", method = RequestMethod.GET)
	public String mapTemp(Model model) {

		
		return "/mapTemp";
	}
	
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public String test2(Model model) {

		return "/test2";
	}
	
	@RequestMapping(value = "/test3", method = RequestMethod.GET)
	public String test3(Model model) {

		return "/test3";
	}

	@RequestMapping(value = "/coordToAddr", method = RequestMethod.GET)
	public String coordToAddr(Model model) {

		return "/coordToAddr";
	}
	
}

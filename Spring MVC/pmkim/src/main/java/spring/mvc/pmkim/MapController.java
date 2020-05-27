package spring.mvc.pmkim;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.MapDAO;
import vo.MemberVO;

@Controller
public class MapController {
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);

	@Autowired
	MapDAO dao;

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public ModelAndView map(String searchKeyword, String searchProduct, MemberVO memberVO) {
		logger.info("map logger: " + searchProduct);
		
		ModelAndView mav = new ModelAndView();
		
		if(dao.memberListAll() != null)	mav.addObject("memberList", dao.memberListAll());			
		
		mav.addObject("searchKeyword", searchKeyword);
		mav.addObject("searchProduct", searchProduct);
		//System.out.println
		mav.setViewName("/map");
		return mav;
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

package spring.mvc.pmkim;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.EventDAO;
import vo.EventVO;
import vo.GoodsEventShopMemberVO;
import vo.GoodsVO;

@Controller
public class EventController {
	@Autowired
	private EventDAO eventDAO;

	
	//event매핑으로 전체 다 보여주기
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public ModelAndView eventMain(GoodsEventShopMemberVO gesmVO) {
		
		ModelAndView mav = new ModelAndView();
		List <GoodsEventShopMemberVO> eventAllView = eventDAO.eventAllView();
		
		
		mav.addObject("eventAllView", eventAllView);

		mav.setViewName("event");
		return mav;
	}
	
	
	@RequestMapping(value = "/event/onePlusOne", method = RequestMethod.GET)
	public ModelAndView eventOnePlusOne() {
		ModelAndView mav = new ModelAndView();
		String event_name="1+1";
		List <GoodsEventShopMemberVO> goodsSortEvent = eventDAO.goodsSortEvent(event_name);
		mav.addObject("eventAllView", goodsSortEvent);

		mav.setViewName("event");
		return mav;
	}
	
	@RequestMapping(value = "/event/twoPlusOne", method = RequestMethod.GET)
	public ModelAndView eventTwoPlusOne() {
		ModelAndView mav = new ModelAndView();
		String event_name="2+1";
		List <GoodsEventShopMemberVO> goodsSortEvent = eventDAO.goodsSortEvent(event_name);
		mav.addObject("eventAllView", goodsSortEvent);

		mav.setViewName("event");
		return mav;
	}
	
	
	//@RequestMapping(value = "/event/{name}", method = RequestMethod.GET)
	//public ModelAndView m(String searchKeyword) {
	//	ModelAndView mav = new ModelAndView();
	//	GoodsVO gvo = new GoodsVO();
	//	EventVO evo = new EventVO();
		
	//	mav.addObject("searchKeywordResult",searchKeyword);
	//	System.out.println("성공");
	//	
	//	//List<GoodsVO> list = EventDAO.listAll(goodId,goodName,searchDate,goodPrice,mfgName,goodImg);
		
	//	mav.setViewName("event");
	//	return mav;
	//}
	
	
	
}

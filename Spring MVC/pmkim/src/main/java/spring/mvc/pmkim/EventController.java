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
import vo.GoodsVO;

@Controller
public class EventController {
	@Autowired
	private EventDAO eventDAO;

	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public ModelAndView eventMain(GoodsVO gvo, EventVO evo) {
		ModelAndView mav = new ModelAndView();
		List <EventVO> eventName = eventDAO.eventName();
		//List <GoodsVO> goodsAll = eventDAO.goodsAll();
		mav.addObject("eventName", eventName);
		//mav.addObject("goodsAll",goodsAll);
		mav.setViewName("event");
		return mav;
	}
	
	@RequestMapping(value = "/event/{name}", method = RequestMethod.GET)
	public ModelAndView search(String searchKeyword) {
		ModelAndView mav = new ModelAndView();
		GoodsVO gvo = new GoodsVO();
		EventVO evo = new EventVO();
		
		mav.addObject("searchKeywordResult",searchKeyword);
		System.out.println("성공");
		
		//List<GoodsVO> list = EventDAO.listAll(goodId,goodName,searchDate,goodPrice,mfgName,goodImg);
		
		mav.setViewName("event");
		return mav;
	}
	
	
	
}

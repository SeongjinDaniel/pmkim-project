package spring.mvc.pmkim;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.CartDAO;
import dao.EventDAO;
import service.PagingService;
import vo.GoodsCategoryEventShopMemberVO;
import vo.GoodsEventShopMemberVO;

@Controller
public class EventController {

	@Autowired
	CartDAO cdao;
	
	@Autowired
	EventDAO edao;
	
	@Autowired
	PagingService ps;

	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public ModelAndView cartGet(String action, String good_name, GoodsEventShopMemberVO gesmvo, String event_name,String shop_code, @RequestParam(defaultValue="1")int pgNum) {
		ModelAndView mav = new ModelAndView();
		//paging용 시작페이지 num, 끝페이지 num
		int startNum = ps.getWritingStart(pgNum);
		int endNum = ps.getWritingEnd(pgNum);
		
		//default값 설정
		if(event_name==null && shop_code==null) {
			event_name = "1+1";
			shop_code = "GS";
		}
		//List <GoodsEventShopMemberVO> eventAllView = eventDAO.eventAllView();
		List<GoodsEventShopMemberVO> clist = null;
		List<GoodsEventShopMemberVO> geslist = cdao.goodsShopEvent(event_name,shop_code,startNum,endNum);
		
		if (action != null && good_name != null) {
			geslist = cdao.searchGoods(good_name);
			
		} else if (action != null && good_name ==null){
			if (action.equals("sort")) {
				geslist = cdao.goodsShopEvent(event_name,shop_code,startNum,endNum);
			}
		}
		//mav.addObject("gvo", gvo);
		
		//System.out.println("전체 갯수 :" + cdao.listCount(event_name, shop_code));
		//System.out.println("페이지 시작 : "+ ps.getPageStart(pgNum));
		//System.out.println("페이지 끝 : "+ ps.getPageEnd(pgNum,event_name,shop_code));
		
		//mav.addObject("eventAllView", eventAllView);
		
		mav.addObject("pgNum",pgNum);
		mav.addObject("end",ps.getPageCount(event_name, shop_code));
		mav.addObject("pageStart",ps.getPageStart(pgNum));
		mav.addObject("pageEnd",ps.getPageEnd(pgNum,event_name,shop_code));
		mav.addObject("nextData",ps.isNextData(pgNum,event_name,shop_code));
		mav.addObject("gesList", geslist);
		mav.setViewName("event");
		return mav;
	}
	

	
}

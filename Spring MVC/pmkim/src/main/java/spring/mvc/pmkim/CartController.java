package spring.mvc.pmkim;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.CartDAO;
import service.PagingService;
import vo.CartVO;
import vo.EventVO;
import vo.GoodsEventShopMemberVO;
import vo.GoodsShopVO;
import vo.GoodsVO;
import vo.MemberVO;

@Controller
public class CartController {

	@Autowired
	CartDAO cdao;
	
	@Autowired
	PagingService ps;
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	// delete search listone
	public ModelAndView cartGet(String action, String keyword, GoodsEventShopMemberVO gesmvo, String event_name,String shop_code, @RequestParam(defaultValue="1")int pgNum) {
		ModelAndView mav = new ModelAndView();
		//paging용 시작페이지 num, 끝페이지 num
		int startNum = ps.getWritingStart(pgNum);
		int endNum = ps.getWritingEnd(pgNum);
		
		//default값 설정
		if(event_name==null && shop_code==null) {
			event_name = "1+1";
			shop_code = "GS";
		}
		
		List<GoodsEventShopMemberVO> clist = null;
		List<GoodsEventShopMemberVO> geslist = cdao.goodsShopEvent(event_name,shop_code,startNum,endNum);
		
		if (action != null && keyword != null) {
			geslist = cdao.searchGoods(keyword);
			
		} else if (action != null && keyword ==null){
			if (action.equals("sort")) {
				geslist = cdao.goodsShopEvent(event_name,shop_code,startNum,endNum);
			} else if (action.equals("delete")) {
				cdao.cartDelete(gesmvo.getId());
				if(cdao.cartDelete(gesmvo.getId()))
					System.out.println("cart 삭제 성공");
			}else if (action.equals("cartOne")) {
				clist = cdao.cartView(gesmvo.getId());
			}
		}
		//mav.addObject("gvo", gvo);
		
		//System.out.println("전체 갯수 :" + cdao.listCount(event_name, shop_code));
		//System.out.println("페이지 시작 : "+ ps.getPageStart(pgNum));
		//System.out.println("페이지 끝 : "+ ps.getPageEnd(pgNum,event_name,shop_code));
		mav.addObject("pgNum",pgNum);
		mav.addObject("end",ps.getPageCount(event_name, shop_code));
		mav.addObject("pageStart",ps.getPageStart(pgNum));
		mav.addObject("pageEnd",ps.getPageEnd(pgNum,event_name,shop_code));
		mav.addObject("nextData",ps.isNextData(pgNum,event_name,shop_code));
		mav.addObject("cartList", clist);
		mav.addObject("gesList", geslist);
		mav.setViewName("mycart");
		return mav;
	}

	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	// insert update
	public ModelAndView cartPost(String action, CartVO cvo, GoodsShopVO gsvo, EventVO evo, GoodsVO gvo, MemberVO mvo) {
		ModelAndView mav = new ModelAndView();

		List<GoodsEventShopMemberVO> clist = null;
		List<GoodsEventShopMemberVO> geslist = cdao.goodsAll();
		boolean flag = false;
		if (action.equals("insert")) {
			flag = cdao.cartInsert(cvo);
			if (flag)
				clist = cdao.cartView(mvo.getId());
		}

		//mav.addObject("gvo", gvo);
		mav.addObject("cartList", clist);
		mav.addObject("gesList", geslist);
		mav.setViewName("mycart");
		return mav;
	}

}

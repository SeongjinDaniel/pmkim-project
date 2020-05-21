package spring.mvc.pmkim;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.CartDAO;
import vo.CartVO;
import vo.EventVO;
import vo.GoodsEventShopVO;
import vo.GoodsShopVO;
import vo.GoodsVO;
import vo.MemberVO;

@Controller
public class CartController {

	@Autowired
	CartDAO cdao;

	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView cartGet(String action, String keyword, CartVO cvo, GoodsShopVO gsvo, GoodsVO gvo, MemberVO mvo) {
		ModelAndView mav = new ModelAndView();

		List<CartVO> clist = cdao.cartView(mvo.getId());
		List<GoodsEventShopVO> geslist = cdao.goodsAll();
		List<GoodsVO> glist = null;
		EventVO evo = new EventVO();
		
		if (action != null && keyword != null) {
			glist = cdao.searchGoods(keyword);
			
		} else if (action != null && keyword ==null){
			if (action.equals("sortShop")) {
				glist = cdao.goodsSortShop(gsvo.getShop_code());
			} else if (action.equals("sortEvent")) {
				glist = cdao.goodsSortEvent(evo.getEvent_name());
			}
		}
		evo = cdao.eventInfo(gvo);
		//mav.addObject("gvo", gvo);
		mav.addObject("eventInfo",evo);
		mav.addObject("event");
		mav.addObject("cartList", clist);
		mav.addObject("gesList", geslist);
		mav.setViewName("mycart");
		return mav;
	}

	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public ModelAndView cartPost(String action, CartVO cvo, GoodsShopVO gsvo, EventVO evo, GoodsVO gvo, MemberVO mvo) {
		ModelAndView mav = new ModelAndView();

		List<CartVO> clist = null;
		List<GoodsEventShopVO> geslist = cdao.goodsAll();
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

	@RequestMapping(value = "/carttest", method = RequestMethod.GET)
	public ModelAndView cartTest(CartVO cvo, GoodsShopVO gsvo, EventVO evo, GoodsVO gvo) {
		ModelAndView mav = new ModelAndView();

		List<CartVO> clist = cdao.cartView(cvo.getId());
		List<GoodsEventShopVO> glist = cdao.goodsAll();
		/*
		 * if(keyword!=null) { glist = cdao.searchGoods(keyword); }else {
		 * if(action.equals("shopName")) { glist =
		 * cdao.goodsSortShop(gsvo.getGood_shop_id()); }else
		 * if(action.equals("eventName")) { glist =
		 * cdao.goodsSortEvent(evo.getEvent_name()); } }
		 */
		mav.addObject("gvo", gvo);
		mav.addObject("cartList", clist);
		mav.addObject("gesList", glist);
		mav.setViewName("mycart");
		return mav;
	}

}

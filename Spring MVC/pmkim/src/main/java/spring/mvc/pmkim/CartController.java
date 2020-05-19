package spring.mvc.pmkim;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.CartDAO;
import vo.CartVO;
import vo.EventVO;
import vo.GoodsShopVO;
import vo.GoodsVO;

@Controller
public class CartController {
	
	@Autowired
	GoodsVO gvo;
	
	@Autowired
	CartDAO cdao;
	
	@RequestMapping(value="/cart", method = RequestMethod.GET)
	public ModelAndView cartGet(@PathVariable String action, String keyword, CartVO cvo, GoodsShopVO gsvo, EventVO evo) {
		ModelAndView mav = new ModelAndView();
		
		List<CartVO> clist = cdao.cartOne(cvo.getId());
		List<GoodsVO> glist = cdao.goodsAll();
		
		if(keyword!=null) {
			glist = cdao.searchGoods(keyword);
		}else {
			if(action.equals("shopName")) {
				glist = cdao.goodsSortShop(gsvo.getGood_shop_id());
			}else if(action.equals("eventName")) {
				glist = cdao.goodsSortEvent(evo.getEvent_name());
			}
		}
		mav.addObject("gvo",gvo);
		mav.addObject("cartList",clist);
		mav.addObject("goodsList",glist);
		mav.setViewName("mycart");
		return mav;
	}
	
	@RequestMapping(value="/cart", method = RequestMethod.POST)
	public ModelAndView cartPost(@PathVariable String action, CartVO cvo, GoodsShopVO gsvo, EventVO evo) {
		ModelAndView mav = new ModelAndView();
		
		List<CartVO> clist = null;
		List<GoodsVO> glist = cdao.goodsAll();
		boolean flag = false;
		if(action.equals("insert")) {
			flag = cdao.cartInsert(cvo);
			if(flag)
				clist = cdao.cartOne(cvo.getId());
		}
		
		mav.addObject("gvo",gvo);
		mav.addObject("cartList",clist);
		mav.addObject("goodsList",glist);
		mav.setViewName("mycart");
		return mav;
	}
}

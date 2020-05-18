package spring.mvc.pmkim;

import java.text.DecimalFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.ThemeDAO;
import vo.GoodsVO;


@Controller
public class ThemeController {
	
	@Autowired
	private ThemeDAO ThemeDAO;
	
	/////Seho
	@RequestMapping(value="/test")
	public String mapStreet() {
		return "theme";
	}
	
	//데시멀 포맷 사용하면 하고 아니면 지구이
	DecimalFormat formatter = new DecimalFormat("###,###");
	
	@RequestMapping(value="/theme")
	public ModelAndView report(GoodsVO gvo) {

		GoodsVO vo1 = ThemeDAO.goods(gvo);
		ModelAndView mav = new ModelAndView();

		
		//goods table
		mav.addObject("area_coname", vo1.getGoodName());

		return mav;
	}
	

}

package spring.mvc.pmkim;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.AnalysisDAO;
import vo.AnalysisVO;


@Controller
public class ThemeController {
	
	@Autowired
	private AnalysisDAO ThemeDAO;

	
	@RequestMapping(value="/theme")
	public ModelAndView theme(AnalysisVO gitvo) {

		List<AnalysisVO> li = ThemeDAO.allGoods(gitvo);
		ModelAndView mav = new ModelAndView();
		//값 확인
		//System.out.println("Con : " + li.get(0).toString());
		//goods table
		mav.addObject("theme", li);
		mav.setViewName("theme");
		return mav;
	}
	

}

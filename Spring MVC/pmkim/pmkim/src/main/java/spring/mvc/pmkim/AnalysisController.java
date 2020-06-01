package spring.mvc.pmkim;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.AnalysisService;
@Controller
public class AnalysisController {
	@Autowired
	AnalysisService rg2;	
	
	//그래프 그리기 참고
	@RequestMapping("/graph2")
	public ModelAndView get2() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("img_content", rg2.returnRImg2());
		mav.setViewName("wc2view");
		return mav;
	}	

	//워드 클라우드 그리기 참고
	//직접 자바에서 R명령어 입력해서 그리기
	@RequestMapping("/wordcloud2_1")
	public ModelAndView get6() {
		ModelAndView mav = new ModelAndView();
		String result = rg2.returnWC2_1();
		System.out.println(result);
		mav.addObject("dynamic_content", result);
		mav.setViewName("wc2view");
		return mav;
	}
	//파일 불러와서 그리기
	@RequestMapping("/wordcloud2_2")
	public ModelAndView get7() {
		ModelAndView mav = new ModelAndView();
		String result = rg2.returnWC2_2();
		System.out.println(result);
		mav.addObject("dynamic_content", result);
		mav.setViewName("wc2view");
		return mav;
	}
	

}







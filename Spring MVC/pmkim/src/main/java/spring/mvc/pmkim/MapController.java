package spring.mvc.pmkim;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public ModelAndView map(String searchKeyword) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("searchKeyword", searchKeyword);
		mav.setViewName("/map");
		return mav;
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate );
		
		return "/test";
	}
	
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public String test2(Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate );
		
		return "/mapTemp";
	}
	
	@RequestMapping(value = "/test3", method = RequestMethod.GET)
	public String test3(Model model) {

		return "/test2";
	}
	
	@RequestMapping(value = "/test4", method = RequestMethod.GET)
	public String test4(Model model) {

		return "/test3";
	}
}

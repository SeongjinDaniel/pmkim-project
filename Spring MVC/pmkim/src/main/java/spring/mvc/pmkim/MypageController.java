package spring.mvc.pmkim;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vo.MemberVO;



@Controller
public class MypageController {
//	@Autowired
//	MapDAO dao;
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView map(String searchKeyword, MemberVO memberVO) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/mypage");
		return mav;
	}
}

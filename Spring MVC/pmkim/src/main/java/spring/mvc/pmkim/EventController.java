package spring.mvc.pmkim;


//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//import dao.EventDAO;
//import vo.GoodsVO;

@Controller
public class EventController {
	//@Autowired
	//private EventDAO EventDAO;

	
	
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public ModelAndView search(String searchKeyword) {
		ModelAndView mav = new ModelAndView();
		
		//List<GoodsVO> list = EventDAO.listAll(goodId,goodName,searchDate,goodPrice,mfgName,goodImg);
		mav.addObject("searchKeywordResult",searchKeyword);
		System.out.println("성공");
		mav.setViewName("event");
		
		return mav;
	}
	
	
	
}

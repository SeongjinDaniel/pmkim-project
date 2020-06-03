package spring.mvc.pmkim;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.AnalysisDAO;
import vo.AnalysisVO;


@Controller
public class AnalysisController2 {
	
	@Autowired
	private AnalysisDAO AnalysisDAO;

	//@RequestMapping(value="/analysis1")
	public ModelAndView main(AnalysisVO avo) {
		ModelAndView mav = new ModelAndView();
		List<AnalysisVO> li = AnalysisDAO.allGoods2(avo);
		mav.addObject("analysis", li);
		mav.setViewName("analysis");
		return mav;
	}
	
	//@RequestMapping(value="/analysis1", method=RequestMethod.POST)
	//@ResponseBody
	public List<AnalysisVO> ajax(AnalysisVO avo, HttpServletResponse response) throws ServletException, IOException{
		List<AnalysisVO> li = AnalysisDAO.allGoods(avo);
		return li;
	}

}

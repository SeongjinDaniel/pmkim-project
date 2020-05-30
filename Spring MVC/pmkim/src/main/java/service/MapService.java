package service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MapDAO;
import spring.mvc.pmkim.MapController;
import vo.GoodsEventShopMemberVO;

@Service
public class MapService {
	@Autowired
	MapDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	public void AddMySearchStore(GoodsEventShopMemberVO vo, HttpServletResponse response) throws IOException{
		//logger.info("start AddMySearchStore");
		if(vo != null) {
			logger.info("vo not null(service)");
			String oldShopCode = null, oldShopNameDetail = null;
			if(vo.getShop_code() != null && vo.getShop_name_detail() != null) {
				oldShopCode = vo.getShop_code().trim();
				oldShopNameDetail = vo.getShop_name_detail().trim();
				logger.info("service before: " + oldShopCode);	
				logger.info("service before: " + oldShopNameDetail);

				//logger.info("dao not null(service)");
				vo = dao.shopCodeName(vo);
				if(vo != null) {
					logger.info("service after: " + vo.getShop_code());
					logger.info("service after: " + vo.getShop_name_detail());
					
					if(oldShopCode.equals(vo.getShop_code().trim()) && 
							oldShopNameDetail.equals(vo.getShop_name_detail().trim())) {
						logger.info("service success");
						response.getWriter().print("1");
					}	
					else {
						logger.info("service fail");
						response.getWriter().print("0");
					}
					
				}
			}
		}	

	}

}

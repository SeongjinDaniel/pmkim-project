package service;

import java.io.IOException;
import java.net.URLEncoder;

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
	public void searchStore(GoodsEventShopMemberVO vo, HttpServletResponse response) throws IOException{
		//logger.info("start AddMySearchStore");
		if(vo != null) {
			logger.info("vo not null(service_searchStore)");
			String oldShopCode = null, oldShopNameDetail = null;
			if(vo.getShop_code() != null && vo.getShop_name_detail() != null) {
				oldShopCode = vo.getShop_code().trim();
				oldShopNameDetail = vo.getShop_name_detail().trim();
				logger.info("service_searchStore before: " + oldShopCode);	
				logger.info("service_searchStore before: " + oldShopNameDetail);

				//logger.info("dao not null(service)");
				vo = dao.shopCodeName(vo);
				if(vo != null) {
					logger.info("service_searchStore after: " + vo.getShop_code());
					logger.info("service_searchStore after: " + vo.getShop_name_detail());
					
					if(oldShopCode.equals(vo.getShop_code().trim()) && 
							oldShopNameDetail.equals(vo.getShop_name_detail().trim())) {
						logger.info("service_searchStore success");
						response.getWriter().print("success");
					}	
					else {
						logger.info("service_searchStore fail");
						response.getWriter().print("fail");
					}
				}else {
					logger.info("vo is null(service_searchStore)");
				}
			}
		}	

	}
	
	public void searchEventName(GoodsEventShopMemberVO vo, HttpServletResponse response) throws IOException{
		// DB에 EventName을 얻어와서 검색한 상품과 같은게 있는지 검색한다.
		if(vo != null) {
			logger.info("vo not null(service_searchEventName)");
			String oldGoodName = null;
			if(vo.getGood_name() != null && vo.getShop_code() != null) {
				oldGoodName = vo.getGood_name().trim();
				logger.info("service_oldGoodName : " + oldGoodName);
				vo = dao.eventName(vo);
				if(vo != null) {
					String eventName = vo.getEvent_name();
					String newGoodName = vo.getGood_name();
					if(eventName != null) eventName.trim();
					if(newGoodName != null) newGoodName.trim(); 
					logger.info("service_newGoodName : " + newGoodName);
					logger.info("service_searchEventName : " + eventName);

					if(eventName != null) {
						logger.info("service_searchEventName success");
						//2+1, 1+1만 행사이다!!
						if(eventName.equals("2+1") || eventName.equals("1+1")) {
							//String message = new String(newGoodName.getBytes("ISO-8859-1"), "UTF-8");
							String message = URLEncoder.encode(eventName + "," + newGoodName, "UTF-8");
							response.getWriter().print(message);
						}else {
							response.getWriter().print("notEvent");
						}
					}else {
						logger.info("service_searchEventName fail");
						response.getWriter().print("fail");
					}
				}
			}
		}
	}

}

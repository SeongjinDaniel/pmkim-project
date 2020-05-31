package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import dao.CartDAO;
import vo.GoodsEventShopMemberVO;
import vo.GoodsInformVO;

@Repository
@Service
public class ManHappyService {
   
   @Autowired
   CartDAO cdao;
   
   //카테고리 체크해줌
   public void checkCtg(String good_id,HttpServletResponse response) throws IOException{
      if(cdao.checkCtg(good_id)!=null) {
         response.getWriter().print("1");
      }else {
         response.getWriter().print("0");
      }
   }
   
   public void insertCart(GoodsEventShopMemberVO vo, HttpServletResponse response) throws IOException{
      if(cdao.cartInsert2(vo)) {
         response.getWriter().print("1");
      }else {
         response.getWriter().print("0");
      }
   }

   public void deleteCart(HttpServletResponse response) throws IOException{
      if(cdao.cartDelete2()) {
         response.getWriter().print("1");
      }else {
         response.getWriter().print("0");
      }
   }
   
   public List<GoodsEventShopMemberVO> getNameImg(String good_id) {
      return cdao.getNameImg(good_id);
   }
   
   public void recomGoods(String ctg_3,int min, int max, HttpServletResponse response) throws IOException{
      List<GoodsInformVO> list = cdao.recomGoodsList(ctg_3, min, max);
      if(list != null) {
         response.getWriter().print("1");
      }else {
         response.getWriter().print("0");
      }
   }
   
	/*
	 * public void test(String ctg_3, HttpServletResponse response) throws
	 * IOException{ List<GoodsInformVO> list = cdao.test(ctg_3); if(list != null) {
	 * response.getWriter().print("1"); }else { response.getWriter().print("0"); } }
	 */
}
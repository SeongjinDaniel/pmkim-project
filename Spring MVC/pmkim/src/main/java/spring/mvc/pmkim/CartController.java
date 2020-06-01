package spring.mvc.pmkim;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.CartDAO;
import service.ManHappyService;
import service.PagingService;
import vo.GoodsEventShopMemberVO;
import vo.GoodsInformVO;

@Controller
public class CartController {

   @Autowired
   CartDAO cdao;
   
   @Autowired
   PagingService ps;
   
   @Autowired
   ManHappyService mh;
   
   @RequestMapping(value = "/cart", method = RequestMethod.GET)
   // delete search listone
   public ModelAndView cartGet(String action, String keyword, GoodsEventShopMemberVO gesmvo, String event_name,String shop_code, @RequestParam(defaultValue="1")int pgNum) {
      ModelAndView mav = new ModelAndView();
      //paging용 시작페이지 num, 끝페이지 num
      int startNum = ps.getWritingStart(pgNum);
      int endNum = ps.getWritingEnd(pgNum);
      
      int end = ps.getPageCount(keyword);
      int pageEnd = ps.getPageEnd(pgNum, keyword);
      boolean nextdata = ps.isNextData(pgNum, keyword);
      //쿼리저장
      String oldQ ="";
   
      //default값 설정
      if(event_name==null && shop_code==null) {
         event_name = "1+1";
         shop_code = "GS";
      }
      
      List<GoodsEventShopMemberVO> geslist = cdao.goodsShopEvent(event_name,shop_code,startNum,endNum);
      
      if (action != null && keyword != null) {                     //search
         geslist = cdao.searchGoodsPaging(keyword, startNum, endNum);
         oldQ += "&action="+action+"&keyword="+keyword;
         
      } else if (action != null && keyword ==null){                  //sort
         
         geslist = cdao.goodsShopEvent(event_name,shop_code,startNum,endNum);
         oldQ += "&action="+action+"&event_name="+event_name+"&shop_code="+shop_code;
         end = ps.getPageCount(event_name, shop_code);
         pageEnd = ps.getPageEnd(pgNum, event_name, shop_code);
         nextdata = ps.isNextData(pgNum, event_name, shop_code);
   
      }
      
      mav.addObject("pgNum",pgNum);
      mav.addObject("oldQ",oldQ);
      mav.addObject("end",end);
      mav.addObject("pageStart",ps.getPageStart(pgNum));
      mav.addObject("pageEnd",pageEnd);
      mav.addObject("preData",ps.isPreData(pgNum));
      mav.addObject("nextData",nextdata);
      mav.addObject("gesList", geslist);
      mav.setViewName("mycart");
      return mav;
   }

   @RequestMapping(value = "/cart", method = RequestMethod.POST)
   @ResponseBody
   public void cartPost(Model model,String action, GoodsEventShopMemberVO vo, HttpServletResponse response) throws ServletException, IOException{      

      if (action.equals("insert")) {
         mh.insertCart(vo,response);
         
      }else if (action.equals("delete")) {
         mh.deleteCart(response);   
      }

   }
   
   //만원의 행복
   @RequestMapping(value="/happy", method = RequestMethod.GET)
   @ResponseBody
   public void happyGet(Model model, String maxM, GoodsInformVO givo, HttpServletResponse response) throws ServletException, IOException{
      System.out.println("givo : " + givo);
      int selectGoodPrice = Integer.parseInt(cdao.price(givo.getGood_id()).replace(",", ""));         //select 된 상품의 가격
      int max = Integer.parseInt(maxM);
      GoodsInformVO vo2 = cdao.checkCtg(givo.getGood_id());      //ctg_1, ctg_2, ctg_3 모두 가져옴
      int num = 0;
      int rand[] = new int[2];
      
      List<GoodsInformVO> gilist = new ArrayList<>();
      String msg = "";
      String good_price[] = new String[2];               //추천받는 상품의 가격
      
      int recomPrice = max-selectGoodPrice;               //최종 추천해야하는 가격
      
      if(recomPrice <=0) {
         msg = "추천 상품이 없습니다.";
                  
         model.addAttribute("msg",msg);
         model.addAttribute("recomPrice",recomPrice);
      }else {
         if(recomPrice >= 5000) {
            //상품 2개 추천
            gilist = recomAlgo(vo2.getCtg_3(),givo.getShop_name());
            System.out.println("givo.shop_name : " + givo.getShop_name());
            System.out.println("vo2.getCtg_3 : " + vo2.getCtg_3());

            num  = gilist.size();
            
         }else {
            //상품 1개 추천
         }
      }
      
      for(int i=0; i<rand.length; i++) {
         rand[i] = (int)(Math.random() * num);
         System.out.println(gilist.size());
         good_price[i] = gilist.get(rand[i]).getGood_price();
         
         for(int j=0; j<i; j++) {            // rand번호 중복 방지
            if(rand[i]==rand[j]) {
               i--;
            }
         }
         
         if(good_price[i].equals("NONE")) {      // good_price == 'none' 제거
            while(good_price[i].equals("NONE")) {
               rand[i] = (int)(Math.random() * num);
            }
         }
         
      }      
      System.out.println(recomAlgo(vo2.getCtg_3(),givo.getShop_name()).get(rand[0]));
      System.out.println(recomAlgo(vo2.getCtg_3(),givo.getShop_name()).get(rand[1]));

      mh.selectCtg_3(vo2.getCtg_3(),givo.getShop_name(), response);
      
   }
   
   private List<GoodsInformVO> recomAlgo(String ctg_3,String shop_name){
      
      System.out.println("만들어지는건가");
      
      List<GoodsInformVO> list = new ArrayList<>();
      
      switch(ctg_3) {
         case "라면" : 
            list.addAll(cdao.selectCtg_2("김치",shop_name));
            list.addAll(cdao.selectCtg_3("생수",shop_name));
            list.addAll(cdao.selectCtg_3("쌀",shop_name));
            list.addAll(cdao.selectCtg_2("반찬",shop_name));
            list.addAll(cdao.selectCtg_3("즉석밥",shop_name));
            break;
         case "즉석밥" :
            list.addAll(cdao.selectCtg_2("김치",shop_name));
            list.addAll(cdao.selectCtg_3("생수",shop_name));
            list.addAll(cdao.selectCtg_3("생선",shop_name));
            list.addAll(cdao.selectCtg_2("반찬",shop_name));
            list.addAll(cdao.selectCtg_3("김/해초",shop_name));
            list.addAll(cdao.selectCtg_3("즉석국/즉석탕",shop_name));
            list.addAll(cdao.selectCtg_3("라면",shop_name));
            break;

         case "케이크" :
         case "시리얼" :
         
         //ctg_2 = '축산'   
         case "알류" :
         case "쇠고기" :
         case "축산가공품" :
         case "닭고기" :
         case "돼지고기" : 
            list.addAll(cdao.selectCtg_2("김치",shop_name));
            list.addAll(cdao.selectCtg_3("탄산",shop_name));
            break;
         
         default : 
            list.addAll(cdao.selectCtg_3("생수",shop_name));
      }
      
      return list;
      
   }
}
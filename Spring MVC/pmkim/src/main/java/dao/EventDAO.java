package dao;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.EventVO;
import vo.GoodsEventShopMemberVO;
import vo.GoodsVO;

@Repository
public class EventDAO {

	@Autowired
	SqlSession session = null;
	
	//전체 다 보여주기
	public List<GoodsEventShopMemberVO> eventAllView() {
		System.out.println("eventView 성공?1");
		List<GoodsEventShopMemberVO> list = new ArrayList<GoodsEventShopMemberVO>();
		System.out.println("eventView 성공?2");
		String statement = "resource.CartMapper.goodsListAll";
		System.out.println("eventView 성공?3");
	      list = session.selectList(statement);
	      return list;
	   }
	
	//eventName으로 찾아오기
	public List<GoodsEventShopMemberVO> goodsSortEvent(String event_name){
	    List<GoodsEventShopMemberVO> list = new ArrayList<GoodsEventShopMemberVO>();
	    String statement = "resource.CartMapper.goodsList_eventName";
	    list = session.selectList(statement,event_name );
	    return list;
	}
	
	//상품검색
	   public List<GoodsEventShopMemberVO> searchGoods(String keyword){
	      List<GoodsEventShopMemberVO> list = new ArrayList<GoodsEventShopMemberVO>();
	      String statement = "resource.CartMapper.searchGoods";
	      list = session.selectList(statement,keyword);
	      return list;
	   }


}

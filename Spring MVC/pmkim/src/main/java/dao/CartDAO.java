package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVO;
import vo.GoodsVO;

@Repository
public class CartDAO {
	@Autowired
	SqlSession session = null;
	
	//cart담기
	public boolean cartInsert(CartVO cvo) {
		boolean result = false;
		String statement = "resource.CartMapper.insertCart";
		if(session.insert(statement,cvo)==1) {
			result=true;
		}
		return result;
	}
	
	//장바구니 비우기
	public boolean cartDelete(String id) {
		boolean result = false;
		String statement = "resource.CartMapper.deleteCart";
		if(session.delete(statement,id)==1) {
			result = true;
		}
		return result;
	}
	
	//저장된 카트 보여주기
	public List<CartVO> cartOne(String id) {
		List<CartVO> list = new ArrayList<CartVO>();
		String statement = "resource.CartMapper.selectCart";
		list = session.selectList(statement,id);
		return list;
	}
	
	//상품검색
	public List<GoodsVO> searchGoods(String keyword){
		List<GoodsVO> list = new ArrayList<>();
		String statement = "resource.CartMapper.searchGoods";
		list = session.selectList(statement,keyword);
		return list;
	}
	
	//paging
	public int listCount(String type) {
		//System.out.println("sql : "+sql);
		int count = 0;
		String statement = "resource.CartMapper.listCount";
		if(session.selectOne(statement)!=null) {
			count = session.selectOne(statement,type);
		}else {
			System.out.println("null이에유");
		}
		return count;
	}
	//상품 전체 리스트 출력
	public List<GoodsVO> goodsAll(){
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		String statement = "resource.CartMapper.goodsListAll";
		list = session.selectList(statement);
		return list;
	}
	
	//shopName으로 찾아오기
	public List<GoodsVO> goodsSortShop(String shopName) {
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		String statement = "resource.CartMapper.goodsList_shopName";
		list = session.selectList(statement,shopName);
		return list;
	}
	
	//eventName으로 찾아오기
	public List<GoodsVO> goodsSortEvent(String eventName){
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		String statement = "resource.CartMapper.goodsList_eventName";
		list = session.selectList(statement,eventName);
		return list;
	}
	
	//shopName&eventName 모두로 찾아오기
	public List<GoodsVO> goodsShopEvent(String eventName, String shopName){
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		String statement = "resource.CartMapper.goodsList_shopEvent";
		Map<String,String> map = new HashMap<String,String>();
		map.put("eventName", eventName);
		map.put("shopName", shopName);
		list = session.selectList(statement,map);
		return list;
	}
}

package dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.EventVO;
import vo.GoodsVO;

@Repository
public class EventDAO {

	@Autowired
	SqlSession session = null;
	public List<EventVO> eventName() {
		System.out.println("eventOne 성공?1");
		List<EventVO> eList = null;
		String statement = "resource.EventMapper.EventName";
		System.out.println("eventOne 성공?2");
		eList = session.selectList(statement);
		System.out.println("eventOne 성공?3");
		return eList;
	}
	
	public List<GoodsVO> goodsAll(){
		System.out.println("goodsALL 성공?1");
		List<GoodsVO> list= null;
		String statement = "resource.EventMapper.GoodsVOAll";//mapper namespace + id
		System.out.println("goodsALL 성공?2");
		list = session.selectList(statement);
		System.out.println("goodsALL 성공?3");
		return list;
	}
	/*
	 * public ShopVO shop (ShopVO vo) { ShopVO svo;
	 * 
	 * String statement = "resource.BackstreetMapper.sales_1Area1";////////변경해야함 svo
	 * = session.selectOne(statement,vo); return svo; }
	 */
	
	

}

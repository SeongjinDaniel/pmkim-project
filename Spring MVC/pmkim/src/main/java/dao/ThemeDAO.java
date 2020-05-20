package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.GoodsVO;

@Repository
public class ThemeDAO {
	
	@Autowired
	SqlSession session = null;
		
	public GoodsVO goods(GoodsVO vo){
		GoodsVO vo1;
		String statement = "resource.BackstreetMapper.sales_1Area1";////////변경해야함
		vo1 = session.selectOne(statement,vo);
		return vo1;
	}
	
}

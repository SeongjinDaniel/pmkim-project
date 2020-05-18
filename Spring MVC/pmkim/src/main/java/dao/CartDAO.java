package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVO;

@Repository
public class CartDAO {
	@Autowired
	SqlSession session = null;
	
	public boolean cartInsert(CartVO cvo) {
		boolean result = false;
		String statement = "resource.CartMapper.insertCart";
		if(session.insert(statement,cvo)==1) {
			result=true;
		}
		return result;
	}
	
	public boolean cartDelete(String id) {
		boolean result = false;
		String statement = "resource.CartMapper.deleteCart";
		if(session.delete(statement,id)==1) {
			result = true;
		}
		return result;
	}
	
	public List<CartVO> cartOne(String id) {
		List<CartVO> list = new ArrayList<CartVO>();
		String statement = "resource.CartMapper.selectCart";
		list = session.selectList(statement,id);
		return list;
	}
}

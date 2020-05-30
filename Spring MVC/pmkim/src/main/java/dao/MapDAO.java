package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.GoodsEventShopMemberVO;
import vo.MemberVO;

@Repository
public class MapDAO {
	private static final Logger logger = LoggerFactory.getLogger(MapDAO.class);
    @Autowired
    SqlSession sqlSession; // mybatis 실행 객체

	public List<MemberVO> memberListAll() {
		//logger.info("Mybatis memberListAll");
		List<MemberVO> list = null;
		String statement = "resource.MapMapper.selectMemberList";
		list = sqlSession.selectList(statement);
		return list;
	}
	
	public GoodsEventShopMemberVO mapAlgorithmDB(GoodsEventShopMemberVO vo) {
		//logger.info("Mybatis mapAlgorithmDBList");
		String statement = "resource.MapMapper.mapAlgorithmDBList";
		//logger.info("mapAlgorithmDB dao: "+vo.getGood_name());
		vo = sqlSession.selectOne(statement, vo);
		// null 수정후 확인할것 !!
		//logger.info("mapAlgorithmDB dao: "+vo.getGood_name());
		return vo;
	}
	//selShopCodeNameDetail
	
	public GoodsEventShopMemberVO shopCodeName(GoodsEventShopMemberVO vo) {
		//logger.info("Mybatis shopCodeName");
		String statement = "resource.MapMapper.selShopCodeNameDetail";
		vo = sqlSession.selectOne(statement, vo);
//		logger.info("Mybatis shopCode : ", vo.getShop_code());
//		logger.info("Mybatis getShop_name_detail : ", vo.getShop_name_detail());
		return vo;
	}
	
	public List<GoodsEventShopMemberVO> shopCodeTableList() {
		//logger.info("Mybatis shopCodeTableList");
		List<GoodsEventShopMemberVO> list = null;
		String statement = "resource.MapMapper.shopCodeTableList";
		list = sqlSession.selectList(statement);
		return list;
	}
    
//    // 01_01. 회원 로그인체크
//    public boolean loginCheck(WeetCustomerInfoVO vo) {
//    	System.out.println("Mybatis loginCheck");
//        String name = sqlSession.selectOne("resource.WeetMapper.loginCheck", vo);
//        return (name == null) ? false : true;
//    }
//    
//    // 01_02. 회원 로그인 정보
//    public WeetCustomerInfoVO viewCustomer(WeetCustomerInfoVO vo) {
//    	System.out.println("Mybatis viewCustomer");
//        return sqlSession.selectOne("resource.WeetMapper.viewCustomer", vo);
//    }
//    
//    // 02. 회원 로그아웃
//    public void logout(HttpSession session) {
//    }
//    
//    // 회원가입
//    public boolean signup(WeetCustomerInfoVO vo) {
//    	System.out.println("Mybatis signup");
//    	boolean result = false;
//    	String statement = "resource.WeetMapper.insertCustomerId";
//    	if(sqlSession.insert(statement, vo) == 1)
//    		result = true;
//
//    	return result;
//    }
}


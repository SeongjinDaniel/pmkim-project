package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class MapDAO {
    @Autowired
    SqlSession sqlSession; // mybatis 실행 객체

	public List<MemberVO> memberListAll() {
		System.out.println("Mybatis memberListAll");
		List<MemberVO> list = null;
		String statement = "resource.MapMapper.selectMemberList";
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

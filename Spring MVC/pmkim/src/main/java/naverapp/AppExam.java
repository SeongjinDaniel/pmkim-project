package naverapp;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AppExam {
	public static String timeToStrDate(long time) {
		DateFormat formatter = 
				new SimpleDateFormat("yyyy-MM-dd");
		return formatter.format(time);
	}

	public static Date parseStrDate(String strDate) throws ParseException {
		DateFormat formatter = 
				new SimpleDateFormat("yyyy년 MM월 dd일");
		return formatter.parse(strDate);
	}
    public static void main(String[] args) throws Exception {
    	/*
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","pmkim","pmkimbear");
    	Statement stmt = conn.createStatement();
    	ResultSet rs = stmt.executeQuery("select good_name,good_price from goods where rownum <= 10");
    	
    	while(rs.next()) {
    		System.out.println(Integer.parseInt(rs.getString(2).replace(",", "")));
    	}
    	*/
    	

    		System.out.println(timeToStrDate(new Date().getTime()));
    		System.out.println(parseStrDate("2019년 12월 25일")); 		
    	
    	/*
    	CartDAO cdao = new CartDAO();
    	List<GoodsEventShopMemberVO> list = new ArrayList<GoodsEventShopMemberVO>();
        list = cdao.goodsAll();
        */
    	
    }
}

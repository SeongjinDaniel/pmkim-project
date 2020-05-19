package vo;

public class GoodsShopVO {

    // 상품 판매점 아이디 
    private String good_shop_id;

    // 판매점 명 
    private String shop_name;

    // 상품 아이디 
    private String good_id;

	public String getGood_shop_id() {
		return good_shop_id;
	}

	public void setGood_shop_id(String good_shop_id) {
		this.good_shop_id = good_shop_id;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getGood_id() {
		return good_id;
	}

	public void setGood_id(String good_id) {
		this.good_id = good_id;
	}

	@Override
	public String toString() {
		return "GoodsShopVO [good_shop_id=" + good_shop_id + ", shop_name=" + shop_name + ", good_id=" + good_id + "]";
	}
    
    

}

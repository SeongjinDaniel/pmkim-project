package vo;

public class CartVO {

    // 장바구니 아이디 
    private int cartId;

    // 아이디 
    private String id;

    // 상품 아이디 
    private String goodId;

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGoodId() {
        return goodId;
    }

    public void setGoodId(String goodId) {
        this.goodId = goodId;
    }

    // Cart 모델 복사
    public void CopyData(CartVO param)
    {
        this.cartId = param.getCartId();
        this.id = param.getId();
        this.goodId = param.getGoodId();
    }
}
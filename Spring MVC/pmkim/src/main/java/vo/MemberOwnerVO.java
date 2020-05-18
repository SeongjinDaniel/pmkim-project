package vo;

public class MemberOwnerVO {

    // 아이디 
    private String id;

    // 판매점 아이디 
    private String shopId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId;
    }

    // MemberOwner 모델 복사
    public void CopyData(MemberOwnerVO param)
    {
        this.id = param.getId();
        this.shopId = param.getShopId();
    }
}
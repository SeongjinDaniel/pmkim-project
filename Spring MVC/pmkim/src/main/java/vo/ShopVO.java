package vo;

public class ShopVO {

    // 판매점 아이디 
    private String shopId;

    // 판매점 주소 
    private String shopAddr;

    // 위도 
    private Float lat;

    // 경도 
    private Float lng;

    // 전화 번호 
    private String telNum;

    // 판매점 명 
    private String shopName;

    // 판매점 명 상세 
    private String shopNameDetail;

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId;
    }

    public String getShopAddr() {
        return shopAddr;
    }

    public void setShopAddr(String shopAddr) {
        this.shopAddr = shopAddr;
    }

    public Float getLat() {
        return lat;
    }

    public void setLat(Float lat) {
        this.lat = lat;
    }

    public Float getLng() {
        return lng;
    }

    public void setLng(Float lng) {
        this.lng = lng;
    }

    public String getTelNum() {
        return telNum;
    }

    public void setTelNum(String telNum) {
        this.telNum = telNum;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getShopNameDetail() {
        return shopNameDetail;
    }

    public void setShopNameDetail(String shopNameDetail) {
        this.shopNameDetail = shopNameDetail;
    }

    // Shop 모델 복사
    public void CopyData(ShopVO param)
    {
        this.shopId = param.getShopId();
        this.shopAddr = param.getShopAddr();
        this.lat = param.getLat();
        this.lng = param.getLng();
        this.telNum = param.getTelNum();
        this.shopName = param.getShopName();
        this.shopNameDetail = param.getShopNameDetail();
    }
}
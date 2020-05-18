package vo;

import java.util.Date;

public class GoodsVO {

    // 상품 아이디 
    private String goodId;

    // 상품 명 
    private String goodName;

    // 조사 날짜 
    private Date searchDate;

    // 상품 가격 
    private String goodPrice;

    // 제조사 명 
    private String mfgName;

    // 상품 이미지 
    private String goodImg;

    public String getGoodId() {
        return goodId;
    }

    public void setGoodId(String goodId) {
        this.goodId = goodId;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public Date getSearchDate() {
        return searchDate;
    }

    public void setSearchDate(Date searchDate) {
        this.searchDate = searchDate;
    }

    public String getGoodPrice() {
        return goodPrice;
    }

    public void setGoodPrice(String goodPrice) {
        this.goodPrice = goodPrice;
    }

    public String getMfgName() {
        return mfgName;
    }

    public void setMfgName(String mfgName) {
        this.mfgName = mfgName;
    }

    public String getGoodImg() {
        return goodImg;
    }

    public void setGoodImg(String goodImg) {
        this.goodImg = goodImg;
    }

    // Goods 모델 복사
    public void CopyData(GoodsVO param)
    {
        this.goodId = param.getGoodId();
        this.goodName = param.getGoodName();
        this.searchDate = param.getSearchDate();
        this.goodPrice = param.getGoodPrice();
        this.mfgName = param.getMfgName();
        this.goodImg = param.getGoodImg();
    }
}

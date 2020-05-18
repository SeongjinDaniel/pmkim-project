package vo;

public class MemberCustomerVO {

    // 아이디 
    private String id;

    // 선호 상품 1 
    private String preferGood1;

    // 선호 상품 2 
    private String preferGood2;

    // 선호 상품 3 
    private String preferGood3;

    // 선호 판매점 
    private String preferShop;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPreferGood1() {
        return preferGood1;
    }

    public void setPreferGood1(String preferGood1) {
        this.preferGood1 = preferGood1;
    }

    public String getPreferGood2() {
        return preferGood2;
    }

    public void setPreferGood2(String preferGood2) {
        this.preferGood2 = preferGood2;
    }

    public String getPreferGood3() {
        return preferGood3;
    }

    public void setPreferGood3(String preferGood3) {
        this.preferGood3 = preferGood3;
    }

    public String getPreferShop() {
        return preferShop;
    }

    public void setPreferShop(String preferShop) {
        this.preferShop = preferShop;
    }

    // MemberCustomer 모델 복사
    public void CopyData(MemberCustomerVO param)
    {
        this.id = param.getId();
        this.preferGood1 = param.getPreferGood1();
        this.preferGood2 = param.getPreferGood2();
        this.preferGood3 = param.getPreferGood3();
        this.preferShop = param.getPreferShop();
    }
}

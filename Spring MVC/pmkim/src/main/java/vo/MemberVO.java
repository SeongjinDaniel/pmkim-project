package vo;

import java.util.Date;

public class MemberVO {

    // 아이디 
    private String id;

    // 비밀번호 
    private String pw;

    // 명 
    private String name;

    // 전화 번호 
    private String telNum;

    // 이메일 
    private String email;

    // 가입 날짜 
    private Date signDate;

    // 별칭 명 
    private String nickName;

    // 도로 주소 
    private String roadAddr;

    // 로그인 종류 
    private String loginType;

    // 멤버 종류 
    private String memberType;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelNum() {
        return telNum;
    }

    public void setTelNum(String telNum) {
        this.telNum = telNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getSignDate() {
        return signDate;
    }

    public void setSignDate(Date signDate) {
        this.signDate = signDate;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getRoadAddr() {
        return roadAddr;
    }

    public void setRoadAddr(String roadAddr) {
        this.roadAddr = roadAddr;
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }

    public String getMemberType() {
        return memberType;
    }

    public void setMemberType(String memberType) {
        this.memberType = memberType;
    }

    // Member 모델 복사
    public void CopyData(MemberVO param)
    {
        this.id = param.getId();
        this.pw = param.getPw();
        this.name = param.getName();
        this.telNum = param.getTelNum();
        this.email = param.getEmail();
        this.signDate = param.getSignDate();
        this.nickName = param.getNickName();
        this.roadAddr = param.getRoadAddr();
        this.loginType = param.getLoginType();
        this.memberType = param.getMemberType();
    }
}

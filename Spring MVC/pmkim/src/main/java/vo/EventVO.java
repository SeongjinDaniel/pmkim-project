package vo;

public class EventVO {

    // 상품 아이디 
    private String goodId;

    // 행사 명 
    private String eventName;

    // 행사 아이디 
    private String eventId;

    public String getGoodId() {
        return goodId;
    }

    public void setGoodId(String goodId) {
        this.goodId = goodId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    // Event 모델 복사
    public void CopyData(EventVO param)
    {
        this.goodId = param.getGoodId();
        this.eventName = param.getEventName();
        this.eventId = param.getEventId();
    }
}
package vo;

import java.util.Date;

public class BoardVO {

    // 게시 아이디 
    private Integer writeId;

    // 아이디 
    private String id;

    // 날짜 
    private Date date;

    // 제목 
    private String title;

    // 수 
    private Integer cnt;

    // 내용 
    private String content;

    public Integer getWriteId() {
        return writeId;
    }

    public void setWriteId(Integer writeId) {
        this.writeId = writeId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getCnt() {
        return cnt;
    }

    public void setCnt(Integer cnt) {
        this.cnt = cnt;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    // Board 모델 복사
    public void CopyData(BoardVO param)
    {
        this.writeId = param.getWriteId();
        this.id = param.getId();
        this.date = param.getDate();
        this.title = param.getTitle();
        this.cnt = param.getCnt();
        this.content = param.getContent();
    }
}

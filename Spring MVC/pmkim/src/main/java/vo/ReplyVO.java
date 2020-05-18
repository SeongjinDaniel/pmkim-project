package vo;

import java.util.Date;

public class ReplyVO {

    // 댓글 아이디 
    private Integer replyId;

    // 게시 아이디 
    private Integer writeId;

    // 내용 
    private String content;

    // 아이디 
    private String id;

    // 날짜 
    private Date date;

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public Integer getWriteId() {
        return writeId;
    }

    public void setWriteId(Integer writeId) {
        this.writeId = writeId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    // Reply 모델 복사
    public void CopyData(ReplyVO param)
    {
        this.replyId = param.getReplyId();
        this.writeId = param.getWriteId();
        this.content = param.getContent();
        this.id = param.getId();
        this.date = param.getDate();
    }
}

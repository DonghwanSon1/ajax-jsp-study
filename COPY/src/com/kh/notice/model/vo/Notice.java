package com.kh.notice.model.vo;

import java.sql.Date;

public class Notice {

	  private int noticeNo;//NOTICE_NO NUMBER PRIMARY KEY,
	  private String noticeTitle;//NOTICE_TITLE VARCHAR2(100) NOT NULL,
	  private String noticeContent;//NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
	  private String noticeWriter;//NOTICE_WRITER NUMBER NOT NULL,
	  private int count;//COUNT NUMBER DEFAULT 0,
	  private Date createDate;//CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
	  private String status;//STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
	
	
	  // 기본 생성자, 매개변수 전부를 갖는 생성자, 모든 필드에 대한 게터/세터, toString()
	  
	public Notice() {}
	  
	
	
	public Notice(int noticeNo, String noticeTitle, String noticeContent, String noticeWriter, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.createDate = createDate;
	}



	public Notice(int noticeNo, String noticeTitle, String noticeWriter, int count, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.count = count;
		this.createDate = createDate;
	}


	public Notice(int noticeNo, String noticeTitle, String noticeContent, String noticeWriter, int count, Date createDate,
			String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}


	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}


	public String getNoticeTitle() {
		return noticeTitle;
	}


	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}


	public String getNoticeContent() {
		return noticeContent;
	}


	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}


	public String getNoticeWriter() {
		return noticeWriter;
	}


	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeWriter=" + noticeWriter + ", count=" + count + ", createDate=" + createDate + ", status="
				+ status + "]";
	}
	  
	  
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
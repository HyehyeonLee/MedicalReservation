
package com.medical.dto;

public class BoardDto {
	private int bno;	// 게시판 DB key값  , Auto incremental
	private String title;	// 제목 
	private String content;	// 내용
	private String writer;	// 작성자
	private String reg_date;	// 작성날짜

	public BoardDto() {}
	public BoardDto(int bno, String title, String content, String writer, String reg_date) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.reg_date = reg_date;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

}

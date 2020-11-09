package com.medical.dto;

public class ReplyDto {
	private int bno;
	private int rno;
	private String content;
	private String writer;
	private String reg_date;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
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

	@Override
	public String toString() {
		return "ReplyDto [bno=" + bno + ", rno=" + rno + ", content=" + content + ", writer=" + writer + ", regdate="
				+ reg_date + "]";
	}

}

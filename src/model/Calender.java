package model;

import java.util.Date;

public class Calender {
	private int no;
	private String subject;
	private String content;
	private Date regdate;
	private int kindno;
	private String memberno;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getKindno() {
		return kindno;
	}
	public void setKindno(int kindno) {
		this.kindno = kindno;
	}
	public String getMemberno() {
		return memberno;
	}
	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}
	@Override
	public String toString() {
		return "Calender [no=" + no + ", subject=" + subject + ", content=" + content + ", regdate=" + regdate
				+ ", kindno=" + kindno + ", memberno=" + memberno + "]";
	}
	
	
}

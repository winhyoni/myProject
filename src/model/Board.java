package model;

import java.util.Date;

public class Board {
	private int no;
	private String name;
	private String pass;
	private String subject;
	private String content;
	private String file1;
	private int kindno;
	private Date regdate;
	private int readcnt;
	private String memberno;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
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
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public int getKindno() {
		return kindno;
	}
	public void setKindno(int kindno) {
		this.kindno = kindno;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getMemberno() {
		return memberno;
	}
	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}
	@Override
	public String toString() {
		return "Board [no=" + no + ", name=" + name + ", pass=" + pass + ", subject=" + subject + ", content=" + content
				+ ", file1=" + file1 + ", kindno=" + kindno + ", regdate=" + regdate + ", readcnt=" + readcnt
				+ ", memberno=" + memberno + "]";
	}
	
	
	
	
	
}

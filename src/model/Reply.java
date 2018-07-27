package model;

import java.util.Date;

public class Reply {
	private int replyno;
	private String name;
	private String content;
	private Date regdate;
	private int ref;
	private int reflevel;
	private int refstep;
	private int no;
	private String memberno;
	public int getReplyno() {
		return replyno;
	}
	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getReflevel() {
		return reflevel;
	}
	public void setReflevel(int reflevel) {
		this.reflevel = reflevel;
	}
	public int getRefstep() {
		return refstep;
	}
	public void setRefstep(int refstep) {
		this.refstep = refstep;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMemberno() {
		return memberno;
	}
	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}
	@Override
	public String toString() {
		return "Reply [replyno=" + replyno + ", name=" + name + ", content=" + content + ", regdate=" + regdate
				+ ", ref=" + ref + ", reflevel=" + reflevel + ", refstep=" + refstep + ", no=" + no + ", memberno="
				+ memberno + "]";
	}
	
	
}

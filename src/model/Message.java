package model;

import java.util.Date;

public class Message {
	private int no;
	private String sendmem;
	private String receivemem;
	private String subject;
	private String content;
	private String file1;
	private Date regdate;
	private int kindno;
	private int senddelete;
	private int receivedelete;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSendmem() {
		return sendmem;
	}
	public void setSendmem(String sendmem) {
		this.sendmem = sendmem;
	}
	public String getReceivemem() {
		return receivemem;
	}
	public void setReceivemem(String receivemem) {
		this.receivemem = receivemem;
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
	public int getSenddelete() {
		return senddelete;
	}
	public void setSenddelete(int senddelete) {
		this.senddelete = senddelete;
	}
	public int getReceivedelete() {
		return receivedelete;
	}
	public void setReceivedelete(int receivedelete) {
		this.receivedelete = receivedelete;
	}
	@Override
	public String toString() {
		return "Message [no=" + no + ", sendmem=" + sendmem + ", receivemem=" + receivemem + ", subject=" + subject
				+ ", content=" + content + ", file1=" + file1 + ", regdate=" + regdate + ", kindno=" + kindno
				+ ", senddelete=" + senddelete + ", receivedelete=" + receivedelete + "]";
	}
	
	
	
}

package club.charleyking.model;

import java.util.Date;

public class Diary {
	private int id = 0;
	private String title = "";
	private String address = "";
	private Date writeTime = null;
	private int userid = 0;
	
	public int getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}
	public String getAddress() {
		return address;
	}
	public Date getWriteTime() {
		return writeTime;
	}
	public int getUserid() {
		return userid;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setWriteTime(Date wirteTime) {
		this.writeTime = writeTime;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
}

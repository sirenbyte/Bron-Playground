package main.databean;

import org.genericdao.PrimaryKey;

@PrimaryKey("id")
public class BronBean {
	private int id;
	private int playgroundId;
	private String b_time;
	private String b_day;
	private boolean torf;
	private String userName;
	
	public boolean isTorf() {
		return torf;
	}
	public void setTorf(boolean torf) {
		this.torf = torf;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPlaygroundId() {
		return playgroundId;
	}
	public void setPlaygroundId(int playgroundId) {
		this.playgroundId = playgroundId;
	}
	public String getB_time() {
		return b_time;
	}
	public void setB_time(String b_time) {
		this.b_time = b_time;
	}
	public String getB_day() {
		return b_day;
	}
	public void setB_day(String b_day) {
		this.b_day = b_day;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}

package main.databean;

import java.util.Date;

import org.genericdao.PrimaryKey;

@PrimaryKey("id")
public class CommentBean {
	private int id;
	private String userName;
	private String content;
	private Date date;
	private int playgroundId;
	private double stars;
	public double getStars() {
		return stars;
	}
	public void setStars(double stars) {
		this.stars = stars;
	}
	public int getPlaygroundId() {
		return playgroundId;
	}
	public void setPlaygroundId(int playgroundId) {
		this.playgroundId = playgroundId;
	}
	private int position;
	
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	
}

package main.databean;

import org.genericdao.PrimaryKey;

@PrimaryKey("id")
public class PlaygroundBean {
	private String sname, typeStadion, cover, simg, address, wtime; 
	private int idCategory, id, capacity;
	private double width, length, price;
	private boolean shower, chanRoom, lighting, parking, stands;
	
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getTypeStadion() {
		return typeStadion;
	}
	public void setTypeStadion(String typeStadion) {
		this.typeStadion = typeStadion;
	}




	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getSimg() {
		return simg;
	}

	public void setSimg(String simg) {
		this.simg = simg;
	}

	public String getWtime() {
		return wtime;
	}

	public void setWtime(String wtime) {
		this.wtime = wtime;
	}

	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}








	public int getIdCategory() {
		return idCategory;
	}




	public void setIdCategory(int idCategory) {
		this.idCategory = idCategory;
	}




	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public int getCapacity() {
		return capacity;
	}




	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}




	public double getWidth() {
		return width;
	}




	public void setWidth(double width) {
		this.width = width;
	}




	public double getLength() {
		return length;
	}




	public void setLength(double length) {
		this.length = length;
	}




	public double getPrice() {
		return price;
	}




	public void setPrice(double price) {
		this.price = price;
	}




	public boolean isShower() {
		return shower;
	}




	public void setShower(boolean shower) {
		this.shower = shower;
	}




	public boolean isChanRoom() {
		return chanRoom;
	}




	public void setChanRoom(boolean chanRoom) {
		this.chanRoom = chanRoom;
	}




	public boolean isLighting() {
		return lighting;
	}




	public void setLighting(boolean lighting) {
		this.lighting = lighting;
	}




	public boolean isParking() {
		return parking;
	}




	public void setParking(boolean parking) {
		this.parking = parking;
	}




	public boolean isStands() {
		return stands;
	}




	public void setStands(boolean stands) {
		this.stands = stands;
	}




//	public String toString() {
//		return name+"\n"+idCategory+"\n"+width+"\n"+length+"\n"+cover+"\n"+capacity+"\n"+typeStadion+"\n"+shower+"\n"+chanRoom+"\n"+lighting+"\n"+parking+"\n"+stands+"\n"+price+"\n"+sourceImage+"\n"+address+"\n"+waitTime+"\n";                  
//	}
		
}

package main.formbean;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.formbeanfactory.InputType;

public class PlaygroundForm {
	private String name, typeStadion, cover, capacity, sourceImage, address, startTime, endTime, idCategory, width, length, price;

	public PlaygroundForm(HttpServletRequest request) {
		this.name = request.getParameter("name");
		this.idCategory = request.getParameter("category");
    	this.width = request.getParameter("width");
    	this.length = request.getParameter("length");
    	this.typeStadion = request.getParameter("typeStadion");
    	this.cover = request.getParameter("cover");
    	this.capacity = request.getParameter("capacity");
    	this.price = request.getParameter("price");
    	this.sourceImage = request.getParameter("simg");
    	this.address = request.getParameter("address");
    	this.startTime = request.getParameter("startTime");
    	this.endTime = request.getParameter("endTime");
    }

	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	public String getTypeStadion() { return typeStadion; }
	public void setTypeStadion(String typeStadion) { this.typeStadion = typeStadion; }
	public String getCover() { return cover; }
	public void setCover(String cover) { this.cover = cover; }
	public String getCapacity() { return capacity; }
	public void setCapacity(String capacity) { this.capacity = capacity; }
	public String getSourceImage() { return sourceImage; }
	public void setSourceImage(String sourceImage) { this.sourceImage = sourceImage; }
	public String getAddress() { return address; }
	public void setAddress(String address) { this.address = address; }
	public String getStartTime() { return startTime; }
	public void setStartTime(String startTime) { this.startTime = startTime; }
	public String getEndTime() { return endTime; }
	public void setEndTime(String endTime) { this.endTime = endTime; }
	public String getIdCategory() { return idCategory; }
	public void setIdCategory(String idCategory) { this.idCategory = idCategory; }
	public String getWidth() { return width; }
	public void setWidth(String width) { this.width = width; }
	public String getLength() { return length; }
	public void setLength(String length) { this.length = length; }
	public String getPrice() { return price; }
	public void setPrice(String price) { this.price = price; }
	
	public ArrayList<String> getValidationErrors(){
		ArrayList<String> errors = new ArrayList<>();
		
		if(name.isEmpty()) { errors.add("Name is required"); }
		if(idCategory.equals("-1")) { errors.add("Category is not selected"); }
		if(width.isEmpty()) { errors.add("Width is required"); }
		if(length.isEmpty()) { errors.add("Length is required"); }
		if(name.isEmpty()) { errors.add("Name is required"); }
		if(cover.isEmpty()) { errors.add("Cover is required"); }
		if(capacity.isEmpty()) { errors.add("Capacity is required"); }
		if(price.isEmpty()) { errors.add("Price is required"); }
		if(sourceImage.isEmpty()) { errors.add("Image is required"); }	
		if(address.isEmpty()) { errors.add("Address is required"); }
		if(startTime.isEmpty()) { errors.add("Start time is required"); }
		if(endTime.isEmpty()) { errors.add("End time is required"); }
		
		try { double temp = Double.parseDouble(width);}catch(Exception e) { errors.add("Width is not number"); }
		try { double temp = Double.parseDouble(length);}catch(Exception e) { errors.add("Width is not number"); }
		try { double temp = Double.parseDouble(capacity);}catch(Exception e) { errors.add("Capacity is not number"); }
		try { double temp = Double.parseDouble(price); }catch(Exception e) { errors.add("Price is not number"); }
		
		return errors;
	}
}


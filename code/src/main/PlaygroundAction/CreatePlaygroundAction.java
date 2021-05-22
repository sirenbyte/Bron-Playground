package main.PlaygroundAction;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.RollbackException;

import main.Action;
import main.dao.*;
import main.databean.*;
import main.formbean.PlaygroundForm;


public class CreatePlaygroundAction extends Action{
	private CategoryDAO categoryDAO;
    private PlaygroundDAO playgroundDAO;

    public CreatePlaygroundAction(Model model) {
    	categoryDAO = model.getCategoryDAO();
        playgroundDAO = model.getPlaygroundDAO();
    }

	
	public String getName() {
        return "createPlaygroundAction.do";
    }
	
	public String performGet(HttpServletRequest request) {
		try {
			Category[] categories = categoryDAO.match();
			request.setAttribute("categories", categories);
		} catch (RollbackException e) {
			e.printStackTrace();
		}
		
		return "createPlayground.jsp";  
    }
	
    public String performPost(HttpServletRequest request) {
    	try {
			Category[] categories = categoryDAO.match();
			request.setAttribute("categories", categories);
						
			PlaygroundForm form = new PlaygroundForm(request);
	    	ArrayList<String> errors = form.getValidationErrors();
	    	
	        if(errors.size() != 0) {
	        	request.setAttribute("errors", errors);
		        request.setAttribute("form", form);
	    		return "createPlayground.jsp";
	    	}
	        
	        PlaygroundBean playground = new PlaygroundBean();
	        byte[] bytes1 = form.getName().getBytes(StandardCharsets.ISO_8859_1);
	    	playground.setSname(new String(bytes1, StandardCharsets.UTF_8)); 
	    	playground.setIdCategory(Integer.parseInt(form.getIdCategory()));
	    	playground.setWidth(Double.parseDouble(form.getWidth()));
	    	playground.setLength(Double.parseDouble(form.getLength()));
	    	byte[] bytes2 = form.getTypeStadion().getBytes(StandardCharsets.ISO_8859_1);
	    	playground.setTypeStadion(new String(bytes2, StandardCharsets.UTF_8));
	    	byte[] bytes3 = form.getCover().getBytes(StandardCharsets.ISO_8859_1);
	    	playground.setCover(new String(bytes3, StandardCharsets.UTF_8));
	    	playground.setCapacity(Integer.parseInt(form.getCapacity()));
	    	playground.setPrice(Double.parseDouble(form.getPrice()));
	    	playground.setShower( (request.getParameter("shower") != null) ? true : false);
	    	playground.setChanRoom((request.getParameter("chanRoom") != null) ? true : false);
	    	playground.setLighting((request.getParameter("lighting") != null) ? true : false);
	    	playground.setParking((request.getParameter("parking") != null) ? true : false);
	    	playground.setStands((request.getParameter("stands") != null) ? true : false);
	    	playground.setSimg(form.getSourceImage());
	    	byte[] bytes4 = form.getAddress().getBytes(StandardCharsets.ISO_8859_1);
	    	playground.setAddress(new String(bytes4, StandardCharsets.UTF_8));
	    	String wTime = form.getStartTime() + "-" + form.getEndTime();
	    	playground.setWtime(wTime);
	    	
	    	playgroundDAO.create(playground);
//			PlaygroundBean[] playgrounds = playgroundDAO.getPlaygrounds();
//			request.setAttribute("playgrounds", playgrounds);
			request.setAttribute("message", "Playground is created succesfully!");
    	}
		catch (RollbackException e) {
			e.printStackTrace();
		}
    	
    	return "createPlayground.jsp";
    }
}


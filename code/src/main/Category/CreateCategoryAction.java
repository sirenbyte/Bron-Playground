package main.Category;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.RollbackException;

import main.Action;
import main.databean.*;
import main.dao.*;

public class CreateCategoryAction extends Action{
	private CategoryDAO categoryDAO;
	private PlaygroundDAO playgroundDAO;
	
	public CreateCategoryAction(Model model) {
		this.categoryDAO = model.getCategoryDAO();
		this.playgroundDAO = model.getPlaygroundDAO();
	}
	
	@Override
	public String getName() {
		return "createCategoryAction.do";
	}
	
	public String performGet(HttpServletRequest request) {
		return performPost(request);  
    }
	
    public String performPost(HttpServletRequest request) {
    	try {
    		String name = request.getParameter("name");

    		if(name.isEmpty()) {
    			request.setAttribute("errorMessage", "Category name is empty!");
        	}else {
        		Category category = new Category();
        		byte[] bytes = name.getBytes(StandardCharsets.ISO_8859_1);
            	name = new String(bytes, StandardCharsets.UTF_8);
            	category.setName(name);
    			categoryDAO.create(category);
    			request.setAttribute("message", "Category is created succesfully!");
        	}
        	
			Map<Integer, Integer> mapQuantity = new HashMap<>();
			PlaygroundBean[] playgrounds = playgroundDAO.match();
			
			for(int i = 0; i < playgrounds.length; i++) {
				int id = playgrounds[i].getIdCategory();
				if(mapQuantity.containsKey(id)) {
					mapQuantity.put(id, mapQuantity.get(id) + 1);
				}else {
					mapQuantity.put(id, 1);
				}
			}
			request.setAttribute("quantity", mapQuantity);
			request.setAttribute("categories", categoryDAO.getAllCategory());
			
		} catch (RollbackException e) {
			e.printStackTrace();
		}
    	return "manageCategory.jsp"; 
    }

	
}

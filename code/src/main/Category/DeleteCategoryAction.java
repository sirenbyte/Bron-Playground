package main.Category;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.genericdao.RollbackException;
import main.Action;
import main.dao.*;
import main.databean.*;

public class DeleteCategoryAction extends Action{
	private CategoryDAO categoryDAO;
	private PlaygroundDAO playgroundDAO;
	
	public DeleteCategoryAction(Model model) {
		this.categoryDAO = model.getCategoryDAO();
		this.playgroundDAO = model.getPlaygroundDAO();
	}
	
	@Override
	public String getName() {
		return "deleteCategoryAction.do";
	}
	
	public String performGet(HttpServletRequest request) {
		return performPost(request);  
    }
	
    public String performPost(HttpServletRequest request) {
    	int id = Integer.parseInt(request.getParameter("id"));    	
    	try {
			categoryDAO.delete(id);
			
			PlaygroundBean[] playgrounds = playgroundDAO.match();
			Map<Integer, Integer> mapQuantity = new HashMap<>();
			
			for(int i = 0; i < playgrounds.length; i++) {
				int idCategory = playgrounds[i].getIdCategory();
				if(idCategory == id) { 
					playgroundDAO.delete(playgrounds[i].getId());
					continue;
				}

				if(mapQuantity.containsKey(idCategory)) {
					mapQuantity.put(idCategory, mapQuantity.get(idCategory) + 1);
				}else {
					mapQuantity.put(idCategory, 1);
				}
			}
			
			request.setAttribute("quantity", mapQuantity);
			request.setAttribute("categories", categoryDAO.getAllCategory());
			request.setAttribute("message", "Category is deleted succesfully!");
		} catch (RollbackException e) {
			e.printStackTrace();
		}
    	return "manageCategory.jsp"; 
    }

}


package main.Category;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.genericdao.RollbackException;
import main.Action;
import main.dao.*;
import main.databean.*;


public class ManageCategoryAction extends Action{
	private CategoryDAO categoryDAO;
	private PlaygroundDAO playgroundDAO;
	
	public ManageCategoryAction(Model model) {
		this.categoryDAO = model.getCategoryDAO();
		this.playgroundDAO = model.getPlaygroundDAO();
	}

	@Override
	public String getName() {
		return "manageCategoryAction.do";
	}
	
	public String performGet(HttpServletRequest request) {
		try {
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
			
			request.setAttribute("categories", categoryDAO.getAllCategory());
			request.setAttribute("quantity", mapQuantity);
		} catch (RollbackException e) {
			e.printStackTrace();
		}
		
		return "manageCategory.jsp";  
    }
	
    public String performPost(HttpServletRequest request) {    	
    	return performGet(request);
    }

}

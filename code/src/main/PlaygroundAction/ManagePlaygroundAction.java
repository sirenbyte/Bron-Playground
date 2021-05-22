package main.PlaygroundAction;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.RollbackException;

import main.Action;
import main.dao.*;
import main.databean.*;

public class ManagePlaygroundAction extends Action{
	private CategoryDAO categoryDAO;
    private PlaygroundDAO playgroundDAO;
	
	
	public ManagePlaygroundAction(Model model) {
		this.categoryDAO = model.getCategoryDAO();
        this.playgroundDAO = model.getPlaygroundDAO();
	}

	@Override
	public String getName() {
		return "managePlaygroundAction.do";
	}
	
	public String performGet(HttpServletRequest request) {
		try {
			PlaygroundBean[] playgrounds = playgroundDAO.match();
			Category[] categories = categoryDAO.match();
			
			Map<Integer, String> mapCategory = new HashMap<>();
			for(int i = 0; i < categories.length; i++) {
				int id = categories[i].getId();
				String name = categories[i].getName();
				mapCategory.put(id, name);
			}
			
			
			
			request.setAttribute("playgrounds", playgrounds);
			request.setAttribute("categories", mapCategory);
			return "managePlayground.jsp";
		} catch (RollbackException e) {
			e.printStackTrace();
		}
		return "action-error-message.jsp";
		  
    }
	
	public String performPost(HttpServletRequest request) {
		return performGet(request);  
    }

}

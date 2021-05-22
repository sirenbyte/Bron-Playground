package main.PlaygroundAction;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import main.Action;
import main.dao.*;
import main.databean.*;

public class DeletePlaygroundAction extends Action {
	private PlaygroundDAO playgroundDAO;
	private CategoryDAO categoryDAO;

	public DeletePlaygroundAction(Model model) {
		this.playgroundDAO = model.getPlaygroundDAO();
		this.categoryDAO = model.getCategoryDAO();
	}
	
	@Override
	public String getName() {
		return "deletePlaygroundAction.do";
	}
	
	public String performGet(HttpServletRequest request) {
		return performPost(request);
	}
	
	public String performPost(HttpServletRequest request) {
		int idDelete = Integer.parseInt(request.getParameter("id"));
		
		try {
			playgroundDAO.delete(idDelete);
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
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "managePlayground.jsp";
	}

}

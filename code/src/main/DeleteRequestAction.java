package main;

import javax.servlet.http.HttpServletRequest;
import main.dao.*;
import main.databean.BronBean;

public class DeleteRequestAction extends Action{
	private BronDAO bronDAO;
	 
	public DeleteRequestAction(Model model) {
		this.bronDAO = model.getBronDAO();
	}

	@Override
	public String getName() {
		return "deleteRequestAction.do";
	}
	
	public String performGet(HttpServletRequest request) {
		try {
    		BronBean[] requests = bronDAO.match();
    		request.setAttribute("requests", requests);
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
		return "adminPage.jsp";  
    }
	
    public String performPost(HttpServletRequest request) {
    	int id = Integer.parseInt(request.getParameter("id"));
    	try {
    		bronDAO.delete(id);
    		BronBean[] requests = bronDAO.match();
    		request.setAttribute("requests", requests);
    		request.setAttribute("message", "Bron is deleted succesfully!");
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return "adminPage.jsp";
    }
}

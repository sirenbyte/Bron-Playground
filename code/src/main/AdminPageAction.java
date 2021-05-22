package main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import main.dao.BronDAO;
import main.dao.Model;
import main.databean.BronBean;
import main.databean.User;


public class AdminPageAction extends Action {
	private BronDAO bronDAO;

    public AdminPageAction(Model model) {
    	this.bronDAO = model.getBronDAO();
    }

	
	public String getName() {
        return "adminPageAction.do";
    }
	
	public String performGet(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		if(!user.getUserName().equals("admin")) {
			return "index.do";
		}
		try {
			BronBean[] requests = bronDAO.match();
			request.setAttribute("requests", requests);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "adminPage.jsp";  
    }
	
    public String performPost(HttpServletRequest request) {    	
    	return performGet(request);
    }
}

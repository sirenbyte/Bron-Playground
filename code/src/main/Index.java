package main;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.genericdao.RollbackException;

import main.dao.CommentDAO;
import main.dao.Model;
import main.dao.PlaygroundDAO;
import main.dao.UserDAO;
import main.databean.User;


public class Index extends Action {
    private PlaygroundDAO playgroundDAO;
    private UserDAO userDAO;
    private CommentDAO commentDAO;

    public Index(Model model) {
    	playgroundDAO = model.getPlaygroundDAO();
        userDAO = model.getUserDAO();
        commentDAO = model.getCommentDAO();
    }

    public String getName() {
        return "index.do";
    }
    
    public String performGet(HttpServletRequest request) {
        return performPost(request);
    }

    public String performPost(HttpServletRequest request) {
        try {
        	HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            request.setAttribute("user", user);
            request.setAttribute("playgrounds",playgroundDAO.getPlaygrounds());
            return ("index.jsp");
        } catch (RollbackException e) {
            request.setAttribute("error",e.getMessage());
            return "error.jsp";
        }
    }
}

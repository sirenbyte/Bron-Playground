package main;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.genericdao.MatchArg;
import org.genericdao.RollbackException;

import main.dao.CommentDAO;
import main.dao.Model;
import main.dao.PlaygroundDAO;
import main.dao.UserDAO;
import main.databean.PlaygroundBean;
import main.databean.User;


public class Contacts extends Action {

    public Contacts(Model model) {
    }

    public String getName() {
        return "contacts.do";
    }
    
    public String performGet(HttpServletRequest request) {
        return performPost(request);
    }

    public String performPost(HttpServletRequest request) {
        	HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            request.setAttribute("user", user);
            return ("contacts.jsp");
     
    }
}

package main;


import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.genericdao.MatchArg;
import org.genericdao.RollbackException;

import main.dao.CategoryDAO;
import main.dao.CommentDAO;
import main.dao.Model;
import main.dao.PlaygroundDAO;
import main.dao.UserDAO;
import main.databean.Category;
import main.databean.PlaygroundBean;
import main.databean.User;


public class Playgrounds extends Action {
    private PlaygroundDAO playgroundDAO;
    private UserDAO userDAO;
    private CommentDAO commentDAO;
    private CategoryDAO categoryDAO;

    public Playgrounds(Model model) {
    	playgroundDAO = model.getPlaygroundDAO();
        userDAO = model.getUserDAO();
        commentDAO = model.getCommentDAO();
        categoryDAO = model.getCategoryDAO();
    }

    public String getName() {
        return "playgrounds.do";
    }
    
    public String performGet(HttpServletRequest request) {
        return performPost(request);
    }

    public String performPost(HttpServletRequest request) {
        try {
        	HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            String categ=request.getParameter("categ");
            if(categ!=null) {
            	byte[] bytes = categ.getBytes(StandardCharsets.ISO_8859_1);
            	categ = new String(bytes, StandardCharsets.UTF_8);
            	Category[] cat=categoryDAO.match(MatchArg.equals("name",categ));
            	PlaygroundBean[] playgrounds=playgroundDAO.match(MatchArg.equals("idCategory",cat[0].getId()));
            	
                request.setAttribute("playgrounds",playgrounds);
                return ("playgrounds.jsp");
            }
            request.setAttribute("user", user);
            request.setAttribute("playgrounds",playgroundDAO.getPlaygrounds());
            return ("playgrounds.jsp");
        } catch (RollbackException e) {
            request.setAttribute("error",e.getMessage());
            return "error.jsp";
        }
    }
}

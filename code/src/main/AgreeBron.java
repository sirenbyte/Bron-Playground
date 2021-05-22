package main;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.genericdao.MatchArg;
import org.genericdao.RollbackException;

import main.dao.BronDAO;
import main.dao.CommentDAO;
import main.dao.Model;
import main.dao.PlaygroundDAO;
import main.dao.UserDAO;
import main.databean.BronBean;
import main.databean.PlaygroundBean;
import main.databean.User;

public class AgreeBron extends Action{
		private PlaygroundDAO playgroundDAO;
	    private UserDAO userDAO;
	    private CommentDAO commentDAO;
	    private BronDAO bronDAO;

	public AgreeBron(Model model) {
		bronDAO=model.getBronDAO();
		playgroundDAO = model.getPlaygroundDAO();
		userDAO = model.getUserDAO();
		commentDAO = model.getCommentDAO();
 }

 public String getName() {
     return "agreebron.do";
 }
 
 public String performGet(HttpServletRequest request) {
     return performPost(request);
 }
 public String performPost(HttpServletRequest request) {
	    
 	 HttpSession session = request.getSession();
 	 User user = (User) session.getAttribute("user");
 
 	 
 	String playgroundId = request.getParameter("playgroundId");
 	String t = request.getParameter("t");
 	String d = request.getParameter("d");
    int id=Integer.parseInt(playgroundId);
     
    
		
    
    BronBean bean = new BronBean();
    try {
    	
		bean.setId(bronDAO.getCount()+1);
		bean.setB_day(d);
		bean.setB_time(t);
		bean.setPlaygroundId(id);
		bean.setUserName(user.getUserName());
		bronDAO.create(bean);
	} catch (RollbackException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    
   
    
    
    
      return ("index.do");
 
 
   
    }
}

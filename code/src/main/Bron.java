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
import main.databean.CommentBean;
import main.databean.PlaygroundBean;
import main.databean.User;
import main.formbean.CommentForm;

public class Bron extends Action{
	 private PlaygroundDAO playgroundDAO;
	    private UserDAO userDAO;
	    private CommentDAO commentDAO;
	    private BronDAO bronDAO;

	public Bron(Model model) {
		bronDAO=model.getBronDAO();
		playgroundDAO = model.getPlaygroundDAO();
        userDAO = model.getUserDAO();
        commentDAO = model.getCommentDAO();
    }

    public String getName() {
        return "bron.do";
    }
    
    public String performGet(HttpServletRequest request) {
        return performPost(request);
    }

    public String performPost(HttpServletRequest request) {
    
         	 HttpSession session = request.getSession();
         	 User user = (User) session.getAttribute("user");
         	 if(user == null) {
           	 return "login.do";
            }
         	 Calendar calendar = new GregorianCalendar();
             Date[] arr= new Date[7];
             for(int i=0;i<7;i++) {
             	arr[i]=calendar.getTime();
             	calendar.add(Calendar.DAY_OF_MONTH,1);
             }
         	 
         	String playgroundId = request.getParameter("playgroundId");
         	String t = request.getParameter("t");
         	String d = request.getParameter("d");
            int id=Integer.parseInt(playgroundId);
             
           
            
            PlaygroundBean[] playground;
			try {
				playground = playgroundDAO.match(MatchArg.equals("id",id));
				 request.setAttribute("playground", playground);
				 request.setAttribute("time", t);
				 request.setAttribute("date", d);
				 request.setAttribute("user", user);
				 
		            
		            
				  return ("bron.jsp");
			         
			} catch (RollbackException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
           
			
            
            
            
              return ("bron.jsp");
         
         
     }

}

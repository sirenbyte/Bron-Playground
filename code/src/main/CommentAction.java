package main;


import java.nio.charset.StandardCharsets;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.formbeanfactory.FormBeanFactory;
import org.genericdao.MatchArg;
import org.genericdao.RollbackException;

import main.dao.BronDAO;
import main.dao.CategoryDAO;
import main.dao.CommentDAO;
import main.dao.Model;
import main.dao.PlaygroundDAO;
import main.dao.UserDAO;
import main.databean.BronBean;
import main.databean.Category;
import main.databean.CommentBean;
import main.databean.PlaygroundBean;
import main.databean.User;
import main.formbean.CommentForm;


public class CommentAction extends Action {
	private FormBeanFactory<CommentForm> formBeanFactory = new FormBeanFactory<>(CommentForm.class);
    private PlaygroundDAO playgroundDAO;
    private UserDAO userDAO;
    private CommentDAO commentDAO;
    private BronDAO bronDAO;
    private CategoryDAO categoryDAO;
    public CommentAction(Model model) {
    	playgroundDAO = model.getPlaygroundDAO();
        userDAO = model.getUserDAO();
        commentDAO = model.getCommentDAO();
        bronDAO=model.getBronDAO();
        categoryDAO=model.getCategoryDAO();
    }

    public String getName() {
        return "comment.do";
    }
    
    public String performGet(HttpServletRequest request) {
        return performPost(request);
    }

    public String performPost(HttpServletRequest request) {
        try {
        	HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            String playgroundId = request.getParameter("playgroundId");
            Calendar calendar = new GregorianCalendar();
            Date[] arr= new Date[7];
            for(int i=0;i<7;i++) {
            	arr[i]=calendar.getTime();
            	calendar.add(Calendar.DAY_OF_MONTH,1);
            }
            int id=Integer.parseInt(playgroundId);
            CommentForm form = formBeanFactory.create(request);
            if (form.hasValidationErrors()) {
                request.setAttribute("form", form);
                request.setAttribute("comments", commentDAO.getComments());
                return "playground.jsp";
            }
            
            CommentBean bean = new CommentBean();
            String content=form.getComment();
            byte[] bytes = content.getBytes(StandardCharsets.ISO_8859_1);
        	content = new String(bytes, StandardCharsets.UTF_8);
            bean.setContent(content);
            String name=((User) request.getSession().getAttribute("user")).getFirstName();
            byte[] bytes2 = name.getBytes(StandardCharsets.ISO_8859_1);
        	name = new String(bytes2, StandardCharsets.UTF_8);
            bean.setUserName(name);
            bean.setDate(form.getDate());
            double stars=Double.parseDouble(form.getStars());
            bean.setStars(stars);
            bean.setPlaygroundId(id);
            commentDAO.addToTop(bean);
            PlaygroundBean[] playground=playgroundDAO.match(MatchArg.equals("id",id));
            request.setAttribute("user", user);
            request.setAttribute("playground",playground);
            CommentBean[] comments=commentDAO.match(MatchArg.equals("playgroundId",id));
            request.setAttribute("totalCom", comments.length);
  
            Category[] categ=categoryDAO.match(MatchArg.equals("id",playground[0].getIdCategory()));
            request.setAttribute("categ", categ[0].getName());
            request.setAttribute("comments", comments);
            request.setAttribute("date", arr);
            request.setAttribute("check", bronDAO.match(MatchArg.equals("playgroundId",id)));
            request.setAttribute("form", new CommentForm());
          
         
            return ("playground.jsp");
        } catch (RollbackException e) {
            request.setAttribute("error",e.getMessage());
            return "error.jsp";
        }
    }
}

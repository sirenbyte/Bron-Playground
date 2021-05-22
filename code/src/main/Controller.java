package main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.genericdao.RollbackException;

import main.Category.CreateCategoryAction;
import main.Category.DeleteCategoryAction;
import main.Category.ManageCategoryAction;
import main.PlaygroundAction.*;
import main.dao.Model;
import main.databean.User;


public class Controller extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public void init() throws ServletException {
        Model model = new Model(getServletConfig());

        Action.add(new Index(model));
        Action.add(new Playgrounds(model));
        Action.add(new Playground(model));
        Action.add(new Register(model));
        Action.add(new Login(model));
        Action.add(new Logout(model));
        Action.add(new Contacts(model));
        Action.add(new Bron(model));
        Action.add(new AgreeBron(model));
        Action.add(new CommentAction(model));
        Action.add(new AdminPageAction(model));
        Action.add(new DeleteRequestAction(model));
        Action.add(new CreateCategoryAction(model));
        Action.add(new ManageCategoryAction(model));
        Action.add(new DeleteCategoryAction(model));
        Action.add(new CreatePlaygroundAction(model));
        Action.add(new DeletePlaygroundAction(model));
        Action.add(new ManagePlaygroundAction(model));

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nextPage = null;
		try {
			nextPage = performTheAction(request);
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        sendToNextPage(nextPage, request, response);
    }

    /*
     * Extracts the requested action and (depending on whether the user is
     * logged in) perform it (or make the user login).
     * 
     * @param request
     * 
     * @return the next page (the view)
     */
    private String performTheAction(HttpServletRequest request) throws RollbackException, IOException, ServletException {
        HttpSession session = request.getSession(true);
        String servletPath = request.getServletPath();
        User user = (User) session.getAttribute("user");
        String action = getActionName(servletPath);
       
//      Admin
//      if (action.equals("adminPageAction.do")) {
//          return Action.perform("adminPageAction.do", request);
//      }
//      if(action.equals("deleteRequestAction.do")) {
//      	return Action.perform("deleteRequestAction.do", request);
//      }
//      if(action.equals("manageCategoryAction.do")) {
//      	return Action.perform("manageCategoryAction.do", request);
//      }
//      if(action.equals("deleteCategoryAction.do")) {
//      	return Action.perform("deleteCategoryAction.do", request);
//      }
//      if(action.equals("createCategoryAction.do")) {
//      	return Action.perform("createCategoryAction.do", request);
//      }
//      if(action.equals("createPlaygroundAction.do")) {
//      	return Action.perform("createPlaygroundAction.do", request);
//      }
//      if(action.equals("managePlaygroundAction.do")) {
//      	return Action.perform("managePlaygroundAction.do", request);
//      }
//      if(action.equals("deletePlaygroundAction.do")) {
//      	return Action.perform("deletePlaygroundAction.do", request);
//      }


        
        if (user != null) {
            // Let the logged in user run his chosen action
            return Action.perform(action, request);
        }
        
        // If the user hasn't logged in, login is the only option
        // Note in this example, register is in the login action.
        if (action.equals("index.do")) {
            return Action.perform("index.do", request);
        }
        if (action.equals("register.do")) {
            return Action.perform("register.do", request);
        }
        if (action.equals("playgrounds.do")) {
            return Action.perform("playgrounds.do", request);
        }
        if (action.equals("login.do")) {
            return Action.perform("login.do", request);
        }
        if (action.equals("playground.do")) {
            return Action.perform("playground.do", request);
        }
        if (action.equals("contacts.do")) {
            return Action.perform("contacts.do", request);
        }
        if (action.equals("bron.do")) {
            return Action.perform("bron.do", request);
        }
        
        
        // The not-logged user is trying to execute an action other
        // than login.  This is usually due to his session timing
        // out but he could be fooling around.  Let's give him a
        // stale session error message.  Another option would be
        // to send him to login.jsp, instead.
        return "controller-stale-session.jsp";
    }

    /*
     * If nextPage is null, send back 404 If nextPage ends with ".do", redirect
     * to this page. If nextPage ends with ".jsp", dispatch (forward) to the
     * page (the view) This is the common case
     */
    private void sendToNextPage(String nextPage, HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        if (nextPage == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    request.getServletPath());
            return;
        }

        if (nextPage.endsWith(".do")) {
            response.sendRedirect(nextPage);
            return;
        }

        if (nextPage.endsWith(".jsp")) {
            RequestDispatcher d = request.getRequestDispatcher("WEB-INF/" + nextPage);
            d.forward(request, response);
            return;
        }

        throw new ServletException(Controller.class.getName()
                + ".sendToNextPage(\"" + nextPage + "\"): invalid extension.");
    }

    /*
     * Returns the path component after the last slash removing any "extension"
     * if present.
     */
    private String getActionName(String path) {
        // We're guaranteed that the path will start with a slash
        int slash = path.lastIndexOf('/');
        return path.substring(slash + 1);
    }
}

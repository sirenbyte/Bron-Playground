package main;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.formbeanfactory.FormBeanFactory;
import org.genericdao.RollbackException;

import main.dao.Model;
import main.dao.UserDAO;
import main.databean.User;
import main.formbean.LoginForm;


public class Login extends Action {
    private FormBeanFactory<LoginForm> formBeanFactory = new FormBeanFactory<>(LoginForm.class);

    private UserDAO userDAO;
    private static MessageDigest md;
    private String pas;
    public Login(Model model) {
        userDAO = model.getUserDAO();
    }

    public String getName() {
        return "login.do";
    }

    public String performGet(HttpServletRequest request) throws RollbackException {
        // If user is already logged in, redirect to todolist.do
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            return "index.do";
        }

        // Otherwise, just display the login page.
        request.setAttribute("form", new LoginForm());
        request.setAttribute("users", userDAO.getUsers());
        
        return "login.jsp";
    }

    public String performPost(HttpServletRequest request) {
        // If user is already logged in, redirect to todolist.do
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            return "index.do";
        }

        try {
            LoginForm form = formBeanFactory.create(request);
            request.setAttribute("form", form);

            // Any validation errors?
            if (form.hasValidationErrors()) {
                return "login.jsp";
            }

            // Look up the user
            User user = userDAO.read(form.getUserName());
            try {
                md = MessageDigest.getInstance("MD5");
                byte[] passBytes = form.getPassword().getBytes();
                md.reset();
                byte[] digested = md.digest(passBytes);
                StringBuffer sb = new StringBuffer();
                for(int i=0;i<digested.length;i++){
                    sb.append(Integer.toHexString(0xff & digested[i]));
                }
                pas=sb.toString();
            } catch (NoSuchAlgorithmException ex) {}
            
            if((form.getUserName().equals("admin@admin.com")) && form.getPassword().equals("admin")) {
            	User admin = new User();
       
            	admin.setUserName("admin");
                admin.setPassword("admin");
                admin.setLastName("admin");
                admin.setFirstName("admin");
            	session.setAttribute("user", admin);
            	session.setAttribute("userN", admin.getUserName());
            	return "adminPageAction.do";
            }
            if (user == null) {
                form.addFieldError("userName", "User Name not found");
                return "login.jsp";
            }
            
            // Check the password
            if (!user.getPassword().equals(pas)) {
                form.addFieldError("password", "Incorrect password");
                return "login.jsp";
            }
            
            // Attach (this copy of) the user bean to the session
            session.setAttribute("user", user);
            

            // If redirectTo is null, redirect to the "todolist" action
            return "index.do";
        } catch (RollbackException e) {
            request.setAttribute("error", e.getMessage());
            return "error.jsp";
        }
    }
}

package main;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.formbeanfactory.FormBeanFactory;
import org.genericdao.DuplicateKeyException;
import org.genericdao.RollbackException;

import main.dao.Model;
import main.dao.UserDAO;
import main.databean.User;
import main.formbean.LoginForm;
import main.formbean.RegisterForm;


public class Register extends Action {
    private FormBeanFactory<RegisterForm> formBeanFactory = new FormBeanFactory<>(RegisterForm.class);

    private UserDAO userDAO;
    private static MessageDigest md;
    private String pas;

    public Register(Model model) {
        userDAO = model.getUserDAO();
    }

    public String getName() {
        return "register.do";
    }

    public String performGet(HttpServletRequest request) {
    	HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            return "index.do";
        }

        // Otherwise, just display the login page.
        request.setAttribute("form", new RegisterForm());
    
        return "register.jsp";
    }

    public String performPost(HttpServletRequest request) {
        // If user is already logged in, redirect to todolist.do
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            return "index.do";
        }

        try {
            RegisterForm form = formBeanFactory.create(request);
            request.setAttribute("form", form);

            // Any validation errors?
            if (form.hasValidationErrors()) {
                return "register.jsp";
            }
            	
                User newUser = new User();
                try {
                    md = MessageDigest.getInstance("MD5");
                    byte[] passBytes = form.getPass2().getBytes();
                    md.reset();
                    byte[] digested = md.digest(passBytes);
                    StringBuffer sb = new StringBuffer();
                    for(int i=0;i<digested.length;i++){
                        sb.append(Integer.toHexString(0xff & digested[i]));
                    }
                    pas=sb.toString();
                } catch (NoSuchAlgorithmException ex) {}
          
                newUser.setUserName(form.getUserName());
                newUser.setPassword(pas);
                byte[] bytes = form.getlName().getBytes(StandardCharsets.ISO_8859_1);
                newUser.setLastName(new String(bytes, StandardCharsets.UTF_8));
                byte[] bytes1 = form.getfName().getBytes(StandardCharsets.ISO_8859_1);
                newUser.setFirstName(new String(bytes1, StandardCharsets.UTF_8));
                try {
                    userDAO.create(newUser);

                    session.setAttribute("user", newUser);
                    return ("index.do");
                } catch (DuplicateKeyException e) {
                    form.addFieldError("userName", "A user with this name already exists");
                    return "register.jsp";
                }
            
        } catch (RollbackException e) {
            request.setAttribute("error", e.getMessage());
            return "error.jsp";
        }
    }
}

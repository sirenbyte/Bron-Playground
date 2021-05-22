package main.dao;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;

public class Model {
	private PlaygroundDAO playgroundDAO;
	private UserDAO userDAO;
	private CommentDAO commentDAO;
	private BronDAO bronDAO;
	private CategoryDAO categoryDAO;

	public Model(ServletConfig config) throws ServletException {
		try {
			String jdbcDriver = config.getInitParameter("jdbcDriverName");
			String jdbcURL    = config.getInitParameter("jdbcURL");
			
			ConnectionPool pool = new ConnectionPool(jdbcDriver,jdbcURL);
			userDAO  = new UserDAO(pool, "p_users");
			playgroundDAO = new PlaygroundDAO(pool, "playgrounds");
			commentDAO = new CommentDAO(pool,"comments");
			bronDAO= new BronDAO(pool,"p_bron");
			categoryDAO = new CategoryDAO(pool, "categ");
			
		} catch (DAOException e) {
			throw new ServletException(e);
		}
	}
	
	public PlaygroundDAO getPlaygroundDAO()  { return playgroundDAO; }
	public UserDAO getUserDAO()  { return userDAO; }
	public CommentDAO getCommentDAO()  { return commentDAO; }
	public BronDAO getBronDAO() { return bronDAO; }
	public CategoryDAO getCategoryDAO() { return categoryDAO; }
	
}

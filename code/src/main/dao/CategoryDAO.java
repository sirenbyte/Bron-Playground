package main.dao;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;
import org.genericdao.RollbackException;

import main.databean.*;

public class CategoryDAO extends GenericDAO<Category>{

	public CategoryDAO(ConnectionPool connectionPool, String tableName) throws DAOException {
		super(Category.class, tableName, connectionPool);
	}

	public Category[] getAllCategory() throws RollbackException {
		return match();
	}
}

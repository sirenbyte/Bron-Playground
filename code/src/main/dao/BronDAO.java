package main.dao;



import java.util.Arrays;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;
import org.genericdao.RollbackException;

import main.databean.BronBean;
import main.databean.CommentBean;

public class BronDAO extends GenericDAO<BronBean> {
	public BronDAO(ConnectionPool cp, String tableName) throws DAOException {
		super(BronBean.class, tableName, cp);
	
	}
	public BronBean[] getBrons() throws RollbackException {

		// Calls GenericDAO's match() method.
		// This no match constraint arguments, match returns all the Item beans
		BronBean[] bron= match();
		

		return bron;
	}
}

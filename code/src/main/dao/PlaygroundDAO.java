package main.dao;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;
import org.genericdao.RollbackException;

import main.databean.PlaygroundBean;


public class PlaygroundDAO extends GenericDAO<PlaygroundBean> {
	public PlaygroundDAO(ConnectionPool cp, String tableName) throws DAOException {
		super(PlaygroundBean.class, tableName, cp);
	}
	public PlaygroundBean[] getPlaygrounds() throws RollbackException {

		PlaygroundBean[] items = match();
		return items;
	}
}

package com.model.printids.dao;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.model.parents.dto.Parents;
import com.util.HibernateUtil;

public class PrintIdsDAO {
	Session session = null;
	/**
	 * * Hibernate Session Variable
	 */
	Transaction transaction = null;
	/**
	 * * Hibernate Transaction Variable
	 */
	SessionFactory sessionFactory;
	
	private static final Logger logger = LogManager.getLogger(PrintIdsDAO.class);

	public PrintIdsDAO() {
		session = HibernateUtil.openSession();
	}


	public Parents printMultipleIds(String id) {
		 Parents parentsDetails = new Parents();
	        
	       try {
	            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
	            //System.out.println("In DAO with id " + personalIds);
	            transaction = session.beginTransaction();
	                    int sid = Integer.valueOf(id);
	                    Query query = session.createQuery("From Parents as parents where parents.Student.sid=" + sid);
	                    parentsDetails = (Parents) query.uniqueResult();
	            transaction.commit();
	        } catch (HibernateException hibernateException) { transaction.rollback(); logger.error(hibernateException);
	            
	            hibernateException.printStackTrace();
	        } 	      
	        return parentsDetails;
	}

}

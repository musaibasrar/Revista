/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.user.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.model.user.dto.Login;
import com.util.HibernateUtil;
import com.util.Session;
import com.util.Session.Transaction;


/**
 *
 * @author CPEDUR1P5
 */
public class UserDAO {

     Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    SessionFactory sessionFactory;
    
    
    public UserDAO() {
        session=HibernateUtil.openCurrentSession();
    }

    public Login readUniqueObject(String userName, String password) {
         Login login = null;
        try{
            transaction = session.beginTransaction();
            
            Query query = session.createQuery("from Login as user where user.username= :loginName and user.password= :password");
            query.setParameter("loginName", userName);
            query.setParameter("password", password);
            login = (Login) query.uniqueResult();
            transaction.commit();
            System.out.println("THE  login result from the readunique object is "+login);
        }catch(HibernateException hibernateException){
            System.out.println("In userdao null pointer exception"+hibernateException);
            hibernateException.printStackTrace();
        }finally{
            	HibernateUtil.closeSession();
    		}
            return login;
    }
    
    public void sessionClose(){
		HibernateUtil.closeSession();
		
		}

    public Login readPassword(String currentPassword) {
         Login login = null;
                
         System.out.println("The password in DAO is: "+currentPassword);
        try{
            System.out.println("in USERDAO");
            transaction = session.beginTransaction();
            
            Query query = session.createQuery("from Login as user where user.password= :password");
            query.setParameter("password", currentPassword);
            login = (Login) query.uniqueResult();
            transaction.commit();
            System.out.println("THE  login result from the readunique object is "+login);
        }catch(HibernateException hibernateException){
            System.out.println("In userdao null pointer exception"+hibernateException);
            hibernateException.printStackTrace();
        }finally{
            	HibernateUtil.closeSession();
    		}
            return login;
    }

    public Login update(Login login) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.update(login);
            transaction.commit();
            System.out.println("in add2");
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            	HibernateUtil.closeSession();
    		}
            return login;
    }

   
    
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.executive.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.model.executive.dto.ExecutiveDetails;
import com.model.personal.dto.PersonalDetails;
import com.util.HibernateUtil;
import com.util.Session;
import com.util.Session.Transaction;

/**
 *
 * @author CPEDUR1P5
 */
public class ExecutiveDetailsDAO {
     
     Session session = null;
    /** * Hibernate Session Variable */
    Transaction transaction = null;
    /** * Hibernate Transaction Variable */
    Transaction transaction1;
    SessionFactory sessionFactory;
    
     public ExecutiveDetailsDAO() {
         session = HibernateUtil.openCurrentSession();
    }
    
    public List<ExecutiveDetails> readListOfObjects() {
         List<ExecutiveDetails> results = new ArrayList<ExecutiveDetails>();
       
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

           // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name desc LIMIT 5 ").list();
             Query query = session.createQuery("From ExecutiveDetails order by name");
             query.setFirstResult(0);
             query.setMaxResults(1000);
             results = query.list();
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
            //session.close();
            return results;
        }
    }

    public void deleteMultipleExecutive(List ids) {
       try {
            transaction=session.beginTransaction();
            Query query=session.createQuery("delete from ExecutiveDetails where eid IN (:ids)");
            query.setParameterList("ids",ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }finally {
        	HibernateUtil.closeSession();
		}
    }

    public ExecutiveDetails create(ExecutiveDetails executive) {
         try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(executive);


            transaction.commit();
            System.out.println("in add3");
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
        	HibernateUtil.closeSession();
            //session.close();
            return executive;
        }
    }

    public ExecutiveDetails readUniqueObject(long id) {
        ExecutiveDetails executive = new ExecutiveDetails();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            
            transaction = session.beginTransaction();
            Query query = session.createQuery("From ExecutiveDetails as executive where executive.eid=" + id);
            executive = (ExecutiveDetails) query.uniqueResult();
            
            transaction.commit();
            }
        catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }finally {
        	HibernateUtil.closeSession();
		}
        //session.close();
        return executive;
    }

    public ExecutiveDetails update(ExecutiveDetails executive) {
         try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.update(executive);
            transaction.commit();
            
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
        	HibernateUtil.closeSession();
            //session.close();
        }
         return executive;
    }

    public int getnoOfExecutives() {
        List<ExecutiveDetails> results = new ArrayList<ExecutiveDetails>();
        int noOfRecords=0;
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            
           results = (List<ExecutiveDetails>) session.createQuery("From ExecutiveDetails").list();
           noOfRecords=results.size();  
             System.out.println("The size of list is:::::::::::::::::::::::::::::::::::::::::: "+noOfRecords);
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
        return noOfRecords;
    }

    public int findSubscribers(String executiveName) {
       
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();
        int noOfRecords=0;
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            String hql = "From PersonalDetails p where  p.subscribedby= :executiveName";
            Query query = session.createQuery(hql);
            query.setParameter("executiveName", executiveName);
           //results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where  p.subscribedby="  '"+executiveName+"').list();
            results = query.list();
            noOfRecords=results.size();  
            System.out.println("The size of list is:::::::::::::::::::::::::::::::::::::::::: "+noOfRecords);
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
            //session.close();
        }
        return noOfRecords;
    }
    
    
}

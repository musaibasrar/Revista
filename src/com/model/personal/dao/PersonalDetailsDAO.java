/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.personal.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import org.hibernate.SessionFactory;

import com.model.personal.dto.City;
import com.model.personal.dto.District;
import com.model.personal.dto.PersonalDetails;
import com.util.HibernateUtil;
import com.util.Session;
import com.util.Session.Transaction;

/**
 *
 * @author CPEDUR1P5
 */
public class PersonalDetailsDAO {

    Session session = null;
    /**
     * * Hibernate Session Variable
     */
    Transaction transaction = null;
    /**
     * * Hibernate Transaction Variable
     */
    Transaction transaction1;
    SessionFactory sessionFactory;
    

    public PersonalDetailsDAO() {
        session = HibernateUtil.openCurrentSession();
    }

    public List<PersonalDetails> readListOfObjects() {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name desc LIMIT 5 ").list();
            Query query = session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name");
            query.setFirstResult(0);
            query.setMaxResults(500);
            results = query.list();
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
        return results;
    }

    public List<PersonalDetails> readListOfObjectsForIcon() {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name ").list();

            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
            
        	HibernateUtil.closeSession();
        }
        return results;
    }

    public PersonalDetails readUniqueObject(String name) {
        PersonalDetails personal = null;
        System.out.println("M in persoonal service");
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("From PersonalDetails as personal where personal.name= :Name");
            query.setParameter("Name", name);
            personal = (PersonalDetails) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
        	HibernateUtil.closeSession();
        }
        	return personal;
        
    }

    public PersonalDetails readUniqueObjectM(String mobile) {
        PersonalDetails personal = null;
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("From PersonalDetails as personal where personal.contactnumber= :mobileNo");
            query.setParameter("mobileNo", mobile);
            personal = (PersonalDetails) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
        	HibernateUtil.closeSession();
        }
            return personal;
    }

    public List<City> readListOfCity() {
        List<City> results = new ArrayList<City>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<City>) session.createQuery("From City order by name").list();

            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public List<District> readListOfDistrict() {
        List<District> results = new ArrayList<District>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<District>) session.createQuery("From District order by name").list();

            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public PersonalDetails create(PersonalDetails personal) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(personal);


            transaction.commit();
            System.out.println("in add3");
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
            //session.close();
            return personal;
        }
    }

    public City addcity(City city) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(city);


            transaction.commit();
            System.out.println("in add3");
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
        	HibernateUtil.closeSession();	
        }
            return city;
    }

    public District adddist(District dist) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.save(dist);


            transaction.commit();
            System.out.println("in add3");
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
        	HibernateUtil.closeSession();
        }
            return dist;
    }

    public PersonalDetails readUniqueObject(long id) {
        PersonalDetails personal = new PersonalDetails();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();

            transaction = session.beginTransaction();
            Query query = session.createQuery("From PersonalDetails as personal where personal.pid=" + id);
            personal = (PersonalDetails) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        }finally {
        	HibernateUtil.closeSession();
		}
        //session.close();
        return personal;
    }

    public PersonalDetails update(PersonalDetails personal) {
        try {
            //this.session = sessionFactory.openCurrentSession();
            transaction = session.beginTransaction();
            session.update(personal);
            transaction.commit();
            System.out.println("in add2");
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
        	HibernateUtil.closeSession();
        }
            return personal;
    }

    public List<PersonalDetails> readListOfExpiry(int offset, int noOfRecords) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            //results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.noofissues <= 4 and p.subscriber = 1 and p.archive = 0 order by name ").list();
            Query query = session.createQuery("From PersonalDetails p where p.noofissues <= 4 and p.subscriber = 1 and p.archive = 0 order by name ");
            query.setFirstResult(offset);
            query.setMaxResults(noOfRecords);
            results = query.list();

            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public List<PersonalDetails> readListOfObjectsfromcomplementary() {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.complimentarysubscriber=1 and p.archive = 0 order by name").list();

            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;

    }

    public PersonalDetails printMultiple(String[] personalIds,HttpSession httpSession) {
        PersonalDetails personal = new PersonalDetails();
        Date date= new Date();
        if(personalIds != null) {
        	
		       try {
		            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
		            //System.out.println("In DAO with id " + personalIds);
		            transaction = session.beginTransaction();
		
		            int i = 1;
		            
		          
		
		                for (String id : personalIds) {
		
		                   
		                    System.out.println("Value of i is " + i);
		                    int pid = Integer.valueOf(id);
		                    Query query = session.createQuery("From PersonalDetails as personal where personal.pid=" + pid);
		                    personal = (PersonalDetails) query.uniqueResult();
		                    //PersonalDetails personal = new PersonalDetailsDAO().printMultiple(pid);
		
		                    if (personal != null) {
		                        httpSession.setAttribute("personaltoissueno" + i + "", personal.getToissueno());
		                        httpSession.setAttribute("personalpid" + i + "", personal.getPid());
		                        httpSession.setAttribute("personalName" + i + "", personal.getName());
		                        httpSession.setAttribute("personaladdressline1" + i + "", personal.getAddressline1());
		                        httpSession.setAttribute("personaladdressline2" + i + "", personal.getAddressline2());
		                        httpSession.setAttribute("personaladdressline2" + i + "", personal.getAddressline2());
		                        httpSession.setAttribute("personalcity" + i + "", personal.getCity());
		                        httpSession.setAttribute("personaldist" + i + "", personal.getDist());
		                        httpSession.setAttribute("personalstate" + i + "", personal.getState());
		                        httpSession.setAttribute("pincode" + i + "", personal.getPincode());
		                        //result = true;
		                    } else {
		
		                       
		                        //result = false;
		                    }
		
		                    i++;
		                }
		            
		            httpSession.setAttribute("iInitial", i);
		            i = (int) (Math.ceil((float) (i) / 3));
		            httpSession.setAttribute("endValue", i);
		            transaction.commit();
		        } catch (HibernateException hibernateException) {
		            transaction.rollback();
		            hibernateException.printStackTrace();
		        } finally {
		        	HibernateUtil.closeSession();
		        }
        	} 
            return personal;
        //session.close();
       
    }

    public PersonalDetails printMultiple_Org(int pid) {
        PersonalDetails personal = new PersonalDetails();
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            System.out.println("In DAO with id " + pid);
            transaction = session.beginTransaction();
            Query query = session.createQuery("From PersonalDetails as personal where personal.pid=" + pid);
            personal = (PersonalDetails) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();
        } finally {
        	HibernateUtil.closeSession();
        }
        	 return personal;
        //session.close();
    }

    public boolean archiveMultiple(List<Long> ids) {
    	boolean result = false;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("update PersonalDetails  set archive = 1  where id IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
            result=true;
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }finally {
        	HibernateUtil.closeSession();
		}
        return result;
    }

    public List<PersonalDetails> readListOfArchive() {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where  p.archive=1 order by name").list();

            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public void deleteMultiple(List ids) {
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("delete from PersonalDetails where pid IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }finally {
        	HibernateUtil.closeSession();
		}
    }

    public void restoreMultiple(List ids) {
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("update PersonalDetails  set archive = 0  where id IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }finally {
        	HibernateUtil.closeSession();
		}
    }

    public List<PersonalDetails> readListOfObjectsForPrint(int offset, int noOfRecords) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            System.out.println("Reading list of objects");
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where  p.archive = 0 order by name").list();
            Query query = session.createQuery("From PersonalDetails  p where p.subscriber=1 and  p.archive = 0 and p.noofissues > 0 order by pincode");
            query.setFirstResult(offset);
            query.setMaxResults(noOfRecords);
            results = query.list();
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public List<PersonalDetails> readListOfObjectsForPrintCS() {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where  p.archive = 0 order by name").list();
            Query query = session.createQuery("From PersonalDetails  p where p.complimentarysubscriber=1 and  p.archive = 0  order by name");
            query.setFirstResult(0);
            query.setMaxResults(500);
            results = query.list();
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public List<PersonalDetails> readListOfObjectsAjax(String alphabet) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.name = :Alphabet").list();
            System.out.println("The alphabet in DAO is****** " + alphabet);
            Query query = session.createQuery("From PersonalDetails p where p.name like CONCAT(:alphabet,'%') and p.archive = 0");
            query.setParameter("alphabet", alphabet);
            results = query.list();
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public List<PersonalDetails> readListOfObjectsAjaxPrint(String alphabet) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.name = :Alphabet").list();
            System.out.println("The alphabet in DAO is****** " + alphabet);
            Query query = session.createQuery("From PersonalDetails p where p.name like CONCAT(:alphabet,'%') and p.archive = 0 and p.noofissues > 0 and p.subscriber=1");
            query.setParameter("alphabet", alphabet);
            results = query.list();
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public void PrintUpdate(List ids) {
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("update PersonalDetails set noofissues=noofissues-1 where pid IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }finally {
        	HibernateUtil.closeSession();
		}
    }

    public List<PersonalDetails> readListOfObjectsForConfirmPrintPaid(int offset, int noOfRecords) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 and p.noofissues >= 1 order by name ").list();
            Query query = session.createQuery("From PersonalDetails p where p.subscriber=1 and p.archive = 0 and p.noofissues >= 1 order by name ");
            query.setFirstResult(offset);
            query.setMaxResults(noOfRecords);
            results = query.list();
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public List<PersonalDetails> readListOfObjectsNextLink(String first) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();
        int one = Integer.parseInt(first);


        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name desc LIMIT 5 ").list();
            Query query = session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 and p.noofissues >= 1");
            query.setFirstResult(one);
            query.setMaxResults(500);
            results = query.list();
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public int getNoOfRecords() {

        List<PersonalDetails> results = new ArrayList<PersonalDetails>();
        int noOfRecords = 0;
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 ").list();
            noOfRecords = results.size();
            System.out.println("The size of list is:::::::::::::::::::::::::::::::::::::::::: " + noOfRecords);
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return noOfRecords;
    }

    public List<PersonalDetails> readListOfObjectsPagination(int offset, int noOfRecords) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name desc LIMIT 5 ").list();
            Query query = session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by dist");
            query.setFirstResult(offset);
            query.setMaxResults(noOfRecords);
            results = query.list();
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public int getNoOfRecordsExpire() {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();
        int noOfRecords = 0;
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.noofissues <= 4 and p.subscriber = 1 and p.archive = 0 order by name").list();
            noOfRecords = results.size();
            System.out.println("The size of list is:::::::::::::::::::::::::::::::::::::::::: " + noOfRecords);
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return noOfRecords;
    }

    public int getNoOfRecordsconfirmPrint() {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();
        int noOfRecords = 0;
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 and p.noofissues >= 1").list();
            noOfRecords = results.size();
            System.out.println("The size of list is:::::::::::::::::::::::::::::::::::::::::: " + noOfRecords);
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return noOfRecords;
    }

    public int getNoOfRecordsPrintAll() {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();
        int noOfRecords = 0;
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<PersonalDetails>) session.createQuery("From PersonalDetails  p where p.subscriber=1 and  p.archive = 0 and p.noofissues > 0").list();
            noOfRecords = results.size();
            System.out.println("The size of list is:::::::::::::::::::::::::::::::::::::::::: " + noOfRecords);
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return noOfRecords;
    }

    public int getNoOfRecordsOfComplSubscribers() {

        List<PersonalDetails> results = new ArrayList<PersonalDetails>();
        int noOfRecords = 0;
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.complimentarysubscriber=1 ").list();
            noOfRecords = results.size();
            System.out.println("The size of list is:::::::::::::::::::::::::::::::::::::::::: " + noOfRecords);
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return noOfRecords;
    }

    public int getNoOfRecordsOfArchive() {

        List<PersonalDetails> results = new ArrayList<PersonalDetails>();
        int noOfRecords = 0;
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where  p.archive=1 ").list();
            noOfRecords = results.size();
            System.out.println("The size of list is:::::::::::::::::::::::::::::::::::::::::: " + noOfRecords);
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return noOfRecords;
    }

    public List<PersonalDetails> readListOfObjectsPaginationForSearchBy(String criteria) {

        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name desc LIMIT 5 ").list();

            Query query = session.createQuery("From PersonalDetails  p where p.subscriber=1 and  p.archive = 0 and p.noofissues > 0 and p.dist='" + criteria + "' order by pincode");

            results = query.list();
            int resultSize = results.size();


            if (resultSize == 0) {

                Query queryState = session.createQuery("From PersonalDetails  p where p.subscriber=1 and  p.archive = 0 and p.noofissues > 0 and p.state='" + criteria + "' order by pincode");

                results = queryState.list();
            }

            if (results.size() == 0) {

                Query queryState = session.createQuery("From PersonalDetails  p where p.subscriber=1 and  p.archive = 0 and p.noofissues > 0 and p.subscribedby='" + criteria + "' order by pincode");

                results = queryState.list();
            }


            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public List<PersonalDetails> readListOfObjectsForBetweenDates(String fromDate, String toDate) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            String myArray[] = fromDate.split("/");
            String myArray2[] = toDate.split("/");
            String fromDateFormatted = myArray[2] + "/" + myArray[0] + "/" + myArray[1];
            String toDateFormatted = myArray2[2] + "/" + myArray2[0] + "/" + myArray2[1];

            System.out.println("The result is " + fromDateFormatted);
            System.out.println("The result is " + toDateFormatted);
            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name desc LIMIT 5 ").list();

            // Query query = session.createQuery("From PersonalDetails  p where p.subscriber=1 and  p.archive = 0 and p.noofissues > 0 and  str_to_date(p.createddate,'%m/%d/%Y') between '" +fromDateFormatted+ "' and '"+toDateFormatted+"' order by pincode");

            //Query sqlQuery = session.createSQLQuery("SELECT * FROM personal_details where str_to_date(createddate,'%m/%d/%Y')  between '" +fromDateFormatted+ "' and '"+toDateFormatted+"'");
            //.addEntity(PersonalDetails.class)
            Query sqlQuery = session.createSQLQuery("SELECT * FROM personal_details where subscriber=1 and  archive = 0 and noofissues > 0 and str_to_date(createddate,'%m/%d/%Y')  between '" + fromDateFormatted + "' and '" + toDateFormatted + "' ");
            results = sqlQuery.list();
            System.out.println("The SQL Query with str to date is " + results.size());




            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public List<PersonalDetails> readListOfObjectsfromcredit() {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.creditsubscribers=1  and p.archive = 0 order by name").list();

            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public int getNoOfRecordsOfCreditSubscribers() {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();
        int noOfRecords = 0;
        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.creditsubscribers=1 ").list();
            noOfRecords = results.size();
            System.out.println("The size of list is:::::::::::::::::::::::::::::::::::::::::: " + noOfRecords);
            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return noOfRecords;
    }

    public List<PersonalDetails> readListOfObjectsPaginationForSearchForComplS(String criteria) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name desc LIMIT 5 ").list();

            Query query = session.createQuery("From PersonalDetails  p where  p.complimentarysubscriber=1 and  p.archive = 0  and p.dist='" + criteria + "' order by pincode");

            results = query.list();
            int resultSize = results.size();

            if (resultSize == 0) {

                Query queryState = session.createQuery("From PersonalDetails  p where  p.complimentarysubscriber=1 and  p.archive = 0  and p.subscribedby='" + criteria + "' order by pincode");

                results = queryState.list();
            }


            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public List<PersonalDetails> readListOfObjectsForBetweenDatesComplS(String fromDate, String toDate) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name desc LIMIT 5 ").list();

            //Original Query query = session.createQuery("From PersonalDetails  p where p.complimentarysubscriber=1 and  p.archive = 0 and p.createddate between '" +fromDate+ "' and '"+toDate+"' order by pincode");
            String myArray[] = fromDate.split("/");
            String myArray2[] = toDate.split("/");
            String fromDateFormatted = myArray[2] + "/" + myArray[0] + "/" + myArray[1];
            String toDateFormatted = myArray2[2] + "/" + myArray2[0] + "/" + myArray2[1];

            System.out.println("The result is " + fromDateFormatted);
            System.out.println("The result is " + toDateFormatted);
            //.addEntity(PersonalDetails.class)	
            Query sqlQuery = session.createSQLQuery("SELECT * FROM personal_details where complimentarysubscriber=1 and  archive = 0  and str_to_date(createddate,'%m/%d/%Y')  between '" + fromDateFormatted + "' and '" + toDateFormatted + "' ");
            results = sqlQuery.list();




            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public List<PersonalDetails> readListOfObjectsPaginationForSearchForComplSState(String criteria) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name desc LIMIT 5 ").list();

            Query queryState = session.createQuery("From PersonalDetails  p where  p.complimentarysubscriber=1 and  p.archive = 0  and p.state='" + criteria + "' order by pincode");

            results = queryState.list();


            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public List<PersonalDetails> readListOfObjectsPaginationForSearchForComplSubscribedby(String criteria) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name desc LIMIT 5 ").list();

            Query queryState = session.createQuery("From PersonalDetails  p where  p.complimentarysubscriber=1 and  p.archive = 0  and p.subscribedby='" + criteria + "' order by pincode");

            results = queryState.list();


            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public List<PersonalDetails> readListOfObjectsPaginationForSearchByCreditS(String criteria) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name desc LIMIT 5 ").list();

            Query query = session.createQuery("From PersonalDetails  p where p.creditsubscribers=1 and  p.archive = 0 and p.noofissues > 0 and p.dist='" + criteria + "' order by pincode");

            results = query.list();
            int resultSize = results.size();


            if (resultSize == 0) {

                Query queryState = session.createQuery("From PersonalDetails  p where p.creditsubscribers=1 and  p.archive = 0 and p.noofissues > 0 and p.state='" + criteria + "' order by pincode");

                results = queryState.list();
            }

            if (results.size() == 0) {

                Query queryState = session.createQuery("From PersonalDetails  p where p.creditsubscribers=1 and  p.archive = 0 and p.noofissues > 0 and p.subscribedby='" + criteria + "' order by pincode");

                results = queryState.list();
            }


            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

    public List<PersonalDetails> readListOfObjectsForBetweenDatesCreditS(String fromDate, String toDate) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();
            String myArray[] = fromDate.split("/");
            String myArray2[] = toDate.split("/");
            String fromDateFormatted = myArray[2] + "/" + myArray[0] + "/" + myArray[1];
            String toDateFormatted = myArray2[2] + "/" + myArray2[0] + "/" + myArray2[1];

            System.out.println("The result is " + fromDateFormatted);
            System.out.println("The result is " + toDateFormatted);
            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 order by name desc LIMIT 5 ").list();

            // Query query = session.createQuery("From PersonalDetails  p where p.subscriber=1 and  p.archive = 0 and p.noofissues > 0 and  str_to_date(p.createddate,'%m/%d/%Y') between '" +fromDateFormatted+ "' and '"+toDateFormatted+"' order by pincode");

            //Query sqlQuery = session.createSQLQuery("SELECT * FROM personal_details where str_to_date(createddate,'%m/%d/%Y')  between '" +fromDateFormatted+ "' and '"+toDateFormatted+"'");
            //.addEntity(PersonalDetails.class)
            Query sqlQuery = session.createSQLQuery("SELECT * FROM personal_details where creditsubscribers=1 and  archive = 0 and noofissues > 0 and str_to_date(createddate,'%m/%d/%Y')  between '" + fromDateFormatted + "' and '" + toDateFormatted + "' ");
            results = sqlQuery.list();
            // System.out.println("The SQL Query with str to date is "+results.size());




            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }
    
    public List<PersonalDetails> readListOfSubscribersByName(String subscriberName) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("From PersonalDetails p where p.name like '%"+subscriberName+"%' and p.archive = 0");
            results = query.list();
            transaction.commit();
        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

	public List<PersonalDetails> readListOfExpiryComp(int offset, int recordsPerPage) {
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            //results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.noofissues <= 4 and p.subscriber = 1 and p.archive = 0 order by name ").list();
            Query query = session.createQuery("From PersonalDetails p where p.noofissues <= 4 and p.complimentarysubscriber = 1 and p.archive = 0 order by name ");
            query.setFirstResult(offset);
            query.setMaxResults(recordsPerPage);
            results = query.list();

            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

	public boolean paidMultiple(List ids) {
		
    	boolean result = false;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("update PersonalDetails  set creditsubscribers = 0, subscriber = 1  where id IN (:ids)");
            query.setParameterList("ids", ids);
            query.executeUpdate();
            transaction.commit();
            result=true;
        } catch (HibernateException hibernateException) {
            hibernateException.printStackTrace();
        }finally {
        	HibernateUtil.closeSession();
		}
        return result;
    }

	public List<PersonalDetails> readListOfExpiryCredit(int offset, int recordsPerPage) {
		
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            //results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.noofissues <= 4 and p.subscriber = 1 and p.archive = 0 order by name ").list();
            Query query = session.createQuery("From PersonalDetails p where p.noofissues <= 4 and p.creditsubscribers = 1 and p.archive = 0 order by name ");
            query.setFirstResult(offset);
            query.setMaxResults(recordsPerPage);
            results = query.list();

            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

	public List<PersonalDetails> readListOfAllExpiry(int offset, int recordsPerPage) {
		
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            //results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.noofissues <= 4 and p.subscriber = 1 and p.archive = 0 order by name ").list();
            Query query = session.createQuery("From PersonalDetails p where p.noofissues <= 4 and p.archive = 0 order by name ");
            query.setFirstResult(offset);
            query.setMaxResults(recordsPerPage);
            results = query.list();

            transaction.commit();



        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

	public List<PersonalDetails> readListOfObjectsForConfirmPrintComp(int offset, int noOfRecords) {
		
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 and p.noofissues >= 1 order by name ").list();
            Query query = session.createQuery("From PersonalDetails p where p.complimentarysubscriber=1 and p.archive = 0 and p.noofissues >= 1 order by name ");
            query.setFirstResult(offset);
            query.setMaxResults(noOfRecords);
            results = query.list();
            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }

	public List<PersonalDetails> readListOfObjectsForConfirmPrintCredit(int offset, int noOfRecords) {
		
        List<PersonalDetails> results = new ArrayList<PersonalDetails>();

        try {
            //this.session = HibernateUtil.getSessionFactory().openCurrentSession();
            transaction = session.beginTransaction();

            // results = (List<PersonalDetails>) session.createQuery("From PersonalDetails p where p.subscriber=1 and  p.archive = 0 and p.noofissues >= 1 order by name ").list();
            Query query = session.createQuery("From PersonalDetails p where p.creditsubscribers=1 and p.archive = 0 and p.noofissues >= 1 order by name ");
            query.setFirstResult(offset);
            query.setMaxResults(noOfRecords);
            results = query.list();
            transaction.commit();

        } catch (HibernateException hibernateException) {
            transaction.rollback();
            hibernateException.printStackTrace();

        } finally {
        	HibernateUtil.closeSession();
        }
            return results;
    }
	
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.personal.service;

import java.io.InputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.Logger;

import com.model.currentIssue.dao.CurrentIssueDAO;
import com.model.currentIssue.dto.CurrentIssue;
import com.model.executive.dao.ExecutiveDetailsDAO;
import com.model.executive.dto.ExecutiveDetails;
import com.model.personal.dao.PersonalDetailsDAO;
import com.model.personal.dto.City;
import com.model.personal.dto.District;
import com.model.personal.dto.PersonalDetails;
import com.util.DataUtil;
import com.util.HibernateUtil;

/**
 *
 * @author CPEDUR1P5
 */
public class PersonalService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public PersonalService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public boolean viewAllPersonal() {


        boolean result = false;
        String pages = "1";
        try {
            int page = 1;
            int recordsPerPage = 2000;
            if (pages != null) {
                page = Integer.parseInt(pages);
            }
            System.out.println("The page is::::::::::::::::::::::::::::: " + page);
            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsPagination((page - 1) * recordsPerPage, recordsPerPage);
            int noOfRecords = new PersonalDetailsDAO().getNoOfRecords();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            request.setAttribute("employeeList", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
            //List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjects();
            List<City> listcity = new PersonalDetailsDAO().readListOfCity();
            List<District> listdist = new PersonalDetailsDAO().readListOfDistrict();
            List<ExecutiveDetails> listExecutive = new ExecutiveDetailsDAO().readListOfObjects();
            httpSession.setAttribute("DistList", listdist);
            httpSession.setAttribute("CityList", listcity);
            httpSession.setAttribute("PersonalDetailsList", list);
            httpSession.setAttribute("ExecutiveList", listExecutive);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }finally {
        	HibernateUtil.closeSession();
		}
        return result;
    }

    public boolean addContact() {
        PersonalDetails personal = new PersonalDetails();
        City city = new City();
        District dist = new District();


        personal.setSubscriber(DataUtil.emptyString(request.getParameter("subscriber")));
        personal.setName(DataUtil.emptyString(request.getParameter("name")));
        personal.setContactnumber(DataUtil.emptyString(request.getParameter("contactNO")));
        personal.setCocontactnumber(DataUtil.emptyString(request.getParameter("cocontactnumber")));
        personal.setEmail(DataUtil.emptyString(request.getParameter("email")));
        personal.setAddressline1(DataUtil.emptyString(request.getParameter("addressline1")));
        //personal.setAddressline2(DataUtil.emptyString(request.getParameter("addressline2")));
        personal.setCity(DataUtil.emptyString(request.getParameter("city")));
        personal.setDist(DataUtil.emptyString(request.getParameter("dist")));
        personal.setState(DataUtil.emptyString(request.getParameter("state")));
        personal.setPincode(DataUtil.emptyString(request.getParameter("pincode")));
        personal.setLandmark(DataUtil.emptyString(request.getParameter("landmark")));
        personal.setCreateddate(DataUtil.emptyString(request.getParameter("createddate")));
        personal.setSubscriptionfor(DataUtil.emptyString(request.getParameter("subscriptionfor")));
        personal.setNoofissues(DataUtil.emptyString(request.getParameter("totalissues")));
        personal.setTotalissues(DataUtil.parseInt(request.getParameter("totalissues")));
        personal.setSubscribedby(DataUtil.emptyString(request.getParameter("subscribedby")));
        personal.setFromissueno(DataUtil.parseInt(request.getParameter("fromkmissueno")));
        personal.setToissueno(DataUtil.parseInt(request.getParameter("tokmissueno")));
        personal.setRemarks(DataUtil.emptyString(request.getParameter("remarks")));
        personal.setarchive(0);
        personal.setMarketing("0");
        personal.setComplimentarysubscriber("0");
        personal.setAdvertiser("0");
        personal.setCreditsubscribers("0");

        String extracity = request.getParameter("city");
        String extradist = request.getParameter("dist");

        if ("Add New".equals(extracity)) {
            personal.setCity(DataUtil.emptyString(request.getParameter("addcity")));
        }


        if ("Add New".equals(extradist)) {
            personal.setDist(DataUtil.emptyString(request.getParameter("adddist")));
        }


        String addcity = request.getParameter("addcity");
        String adddist = request.getParameter("adddist");

        if (!"".equals(addcity)) {
            city.setName(addcity);
            city = new PersonalDetailsDAO().addcity(city);
        }

        if (!"".equals(adddist)) {
            dist.setName(adddist);
            dist = new PersonalDetailsDAO().adddist(dist);
        }

        personal = new PersonalDetailsDAO().create(personal);

        if (personal.getPid() == 0l) {
            return false;
        } else {
            httpSession.setAttribute("personal", personal);
            System.out.println("must display");


            return true;
        }
    }

    public boolean viewDetailsOfContact() {
    	
        boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));
            PersonalDetails personal = new PersonalDetailsDAO().readUniqueObject(id);

            if (personal == null) {
                result = false;
            } else {
                httpSession.setAttribute("personal", personal);
                System.out.println("the total number of issues are " + personal.getTotalissues());
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
        
    }

    public long updateContactInformation() {
        PersonalDetails personal = new PersonalDetails();
        System.out.println("m in personal service");
        String id = "";
        id = request.getParameter("id");

        System.out.println("THE ID IS: " + id);

        int personalId = 0;
        personalId = Integer.parseInt(id);
        System.out.println("M in in personal service and ID is :::::::::::::::::::::::::::::: " + personalId);

        personal.setPid(personalId);
        personal.setSubscriber(DataUtil.emptyString(request.getParameter("subscriber")));
        personal.setName(DataUtil.emptyString(request.getParameter("name")));
        personal.setContactnumber(DataUtil.emptyString(request.getParameter("contactNO")));
        personal.setCocontactnumber(DataUtil.emptyString(request.getParameter("cocontactnumber")));
        personal.setEmail(DataUtil.emptyString(request.getParameter("email")));
        personal.setAddressline1(DataUtil.emptyString(request.getParameter("addressline1")));
        personal.setAddressline2(DataUtil.emptyString(request.getParameter("addressline2")));
        personal.setCity(DataUtil.emptyString(request.getParameter("city")));
        personal.setDist(DataUtil.emptyString(request.getParameter("dist")));

        personal.setState(DataUtil.emptyString(request.getParameter("state")));
        personal.setPincode(DataUtil.emptyString(request.getParameter("pincode")));

        personal.setLandmark(DataUtil.emptyString(request.getParameter("landmark")));
        personal.setCreateddate(DataUtil.emptyString(request.getParameter("createddate")));
        personal.setSubscriptionfor(DataUtil.emptyString(request.getParameter("subscriptionfor")));
        personal.setNoofissues(DataUtil.emptyString(request.getParameter("noofissues")));
        personal.setTotalissues(DataUtil.parseInt(request.getParameter("totalissues")));
        personal.setFromissueno(DataUtil.parseInt(request.getParameter("fromkmissueno")));
        personal.setToissueno(DataUtil.parseInt(request.getParameter("tokmissueno")));
        personal.setSubscribedby(DataUtil.emptyString(request.getParameter("subscribedby")));
        personal.setRemarks(DataUtil.emptyString(request.getParameter("remarks")));
        personal.setarchive(0);
        personal.setMarketing("0");
        personal.setComplimentarysubscriber("0");
        personal.setAdvertiser("0");



        personal = new PersonalDetailsDAO().update(personal);
        return personal.getPid();
    }

    public boolean viewAllExpiry(String pages) {
        boolean result = false;
        String inPage = pages;
        try {
            int page = 1;
            int recordsPerPage = 500;
            if (inPage != null) {
                page = Integer.parseInt(inPage);
            }
            System.out.println("The page is::::::::::::::::::::::::::::: " + page);

            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfExpiry((page - 1) * recordsPerPage, recordsPerPage);
            httpSession.setAttribute("PersonalDetailsListExpire", list);
            int noOfRecords = new PersonalDetailsDAO().getNoOfRecordsExpire();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean addcomplimentarysubscriber() {

        PersonalDetails personal = new PersonalDetails();
        City city = new City();
        District dist = new District();

        personal.setComplimentarysubscriber(DataUtil.emptyString(request.getParameter("complsubscriber")));
        personal.setName(DataUtil.emptyString(request.getParameter("name")));
        personal.setContactnumber(DataUtil.emptyString(request.getParameter("contactNO")));
        personal.setCocontactnumber(DataUtil.emptyString(request.getParameter("cocontactnumber")));
        personal.setEmail(DataUtil.emptyString(request.getParameter("email")));
        personal.setAddressline1(DataUtil.emptyString(request.getParameter("addressline1")));
        personal.setAddressline2(DataUtil.emptyString(request.getParameter("addressline2")));
        personal.setCity(DataUtil.emptyString(request.getParameter("city")));
        personal.setDist(DataUtil.emptyString(request.getParameter("dist")));
        personal.setState(DataUtil.emptyString(request.getParameter("state")));
        personal.setPincode(DataUtil.emptyString(request.getParameter("pincode")));
        personal.setLandmark(DataUtil.emptyString(request.getParameter("landmark")));
        personal.setCreateddate(DataUtil.emptyString(request.getParameter("createddate")));
        personal.setSubscriptionfor(DataUtil.emptyString(request.getParameter("subscriptionfor")));
        personal.setNoofissues(DataUtil.emptyString(request.getParameter("noofissues")));
        personal.setTotalissues(DataUtil.parseInt(request.getParameter("noofissues")));
        personal.setFromissueno(DataUtil.parseInt(request.getParameter("fromkmissueno")));
        personal.setToissueno(DataUtil.parseInt(request.getParameter("tokmissueno")));
        personal.setSubscribedby(DataUtil.emptyString(request.getParameter("subscribedby")));
        personal.setRemarks(DataUtil.emptyString(request.getParameter("remarks")));
        personal.setarchive(0);
        personal.setMarketing("0");
        personal.setSubscriber("0");
        personal.setAdvertiser("0");
        personal.setCreditsubscribers("0");

        String extracity = request.getParameter("city");
        String extradist = request.getParameter("dist");

        if ("Add New".equals(extracity)) {
            personal.setCity(DataUtil.emptyString(request.getParameter("addcity")));
        }


        if ("Add New".equals(extradist)) {
            personal.setDist(DataUtil.emptyString(request.getParameter("adddist")));
        }


        String addcity = request.getParameter("addcity");
        String adddist = request.getParameter("adddist");

        if (!"".equals(addcity)) {
            city.setName(addcity);
            city = new PersonalDetailsDAO().addcity(city);
        }

        if (!"".equals(adddist)) {
            dist.setName(adddist);
            dist = new PersonalDetailsDAO().adddist(dist);
        }

        personal = new PersonalDetailsDAO().create(personal);

        if (personal.getPid() == 0l) {
            return false;
        } else {
            httpSession.setAttribute("personal", personal);
            System.out.println("must display");


            return true;
        }
    }

    public boolean viewAllCompementary() {
        boolean result = false;
        try {
            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsfromcomplementary();
            List<City> listcity = new PersonalDetailsDAO().readListOfCity();
            List<District> listdist = new PersonalDetailsDAO().readListOfDistrict();
            httpSession.setAttribute("DistList", listdist);
            httpSession.setAttribute("CityList", listcity);
            httpSession.setAttribute("PersonalDetailsList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean printMultiple() {
        boolean result = false;
        String[] personalIds = request.getParameterValues("select-item");
        List<Long> ids = new ArrayList<Long>();
        CurrentIssue currentIssue = new CurrentIssueDAO().getCurrentIssue();
        httpSession.setAttribute("currentissue", currentIssue);
        Date date = new Date();
        //int i = 1;
          System.out.println("Time before executing Query : "+new Timestamp(date.getTime()));
       PersonalDetails personal = new PersonalDetailsDAO().printMultiple(personalIds, httpSession);
       
        if (personal == null) {
            result = false;
        } else {
            result = true;
        }
        return result;

    }

    public boolean printMultiple_Org() {
        boolean result = false;
        String[] personalIds = request.getParameterValues("select-item");
        List<Long> ids = new ArrayList<Long>();
        CurrentIssue currentIssue = new CurrentIssueDAO().getCurrentIssue();
        httpSession.setAttribute("currentissue", currentIssue);
        //List<PersonalDetails> listPersonal = (List<PersonalDetails>) new PersonalDetails();
        int i = 1;

        try {
            for (String id : personalIds) {

                System.out.println("id print multiple" + id);


                System.out.println("Value of i is " + i);
                int pid = Integer.valueOf(id);
                PersonalDetails personal = new PersonalDetailsDAO().printMultiple_Org(pid);

                if (personal == null) {
                    result = false;
                } else {


                    //httpSession.setAttribute("personal"+i+"", personal.getName());

//                        request.getSession().setAttribute("personaltoissueno"+i+"", personal.getToissueno());
//                        request.getSession().setAttribute("personalpid"+i+"", personal.getPid());
//                        request.getSession().setAttribute("personalName"+i+"", personal.getName());
//                        request.getSession().setAttribute("personaladdressline1"+i+"", personal.getAddressline1());
//                        request.getSession().setAttribute("personaladdressline2"+i+"", personal.getAddressline2());
//                        request.getSession().setAttribute("personaladdressline2"+i+"", personal.getAddressline2());
//                        request.getSession().setAttribute("personalcity"+i+"", personal.getCity());
//                        request.getSession().setAttribute("personaldist"+i+"", personal.getDist());
//                        request.getSession().setAttribute("personalstate"+i+"", personal.getState());

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



                    result = true;
                }

                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        httpSession.setAttribute("iInitial", i);
        i = (int) (Math.ceil((float) (i) / 3));
        httpSession.setAttribute("endValue", i);

        return result;
//                if (personal == null) {
//                    result = false;
//                } else {
//                    
////                    httpSession.setAttribute("personal'"+i+"'", personal);
//                    
//                    
//                   if (i == 0) {
//                       CurrentIssue currentIssue = new CurrentIssueDAO().getCurrentIssue();
//                       httpSession.setAttribute("currentissue", currentIssue);
//                      System.out.println("the current issue is "+currentIssue);
//                        httpSession.setAttribute("personal", personal);
//
//                    } else if (i == 1) {
//                        httpSession.setAttribute("personal1", personal);
//                    } else if (i == 2) {
//                        httpSession.setAttribute("personal2", personal);
//                    } else if (i == 3) {
//                        httpSession.setAttribute("personal3", personal);
//                    } else if (i == 4) {
//                        httpSession.setAttribute("personal4", personal);
//                    } else if (i == 5) {
//                        httpSession.setAttribute("personal5", personal);
//                    } else if (i == 6) {
//                        httpSession.setAttribute("personal6", personal);
//                    } else if (i == 7) {
//                        httpSession.setAttribute("personal7", personal);
//                    } else if (i == 8) {
//                        httpSession.setAttribute("personal8", personal);
//                    } else if (i == 9) {
//                        httpSession.setAttribute("personal9", personal);
//                    }else if (i == 10) {
//                        httpSession.setAttribute("personal10", personal);
//                    }
//
//                    result = true;
//               }
        //ids.add(Long.valueOf(id));

        //System.out.println("id length" + personalIds.length);
        // new PersonalDetailsDAO().printMultiple(ids);
    }

    public boolean printMultipleCS() {
        boolean result = false;
        String[] personalIds = request.getParameterValues("select-item");
        List<Long> ids = new ArrayList<Long>();
        int i = 0;
        try {
            for (String id : personalIds) {

                System.out.println("id print multiple" + id);


                System.out.println("Value of i is " + i);
                int pid = Integer.valueOf(id);
                PersonalDetails personal = new PersonalDetailsDAO().printMultiple_Org(pid);
                if (personal == null) {
                    result = false;
                } else {

                    CurrentIssue currentIssue = new CurrentIssueDAO().getCurrentIssue();
                    httpSession.setAttribute("currentissue", currentIssue);
                    //httpSession.setAttribute("personal"+i+"", personal.getName());

//                        request.getSession().setAttribute("personaltoissueno"+i+"", personal.getToissueno());
//                        request.getSession().setAttribute("personalpid"+i+"", personal.getPid());
//                        request.getSession().setAttribute("personalName"+i+"", personal.getName());
//                        request.getSession().setAttribute("personaladdressline1"+i+"", personal.getAddressline1());
//                        request.getSession().setAttribute("personaladdressline2"+i+"", personal.getAddressline2());
//                        request.getSession().setAttribute("personaladdressline2"+i+"", personal.getAddressline2());
//                        request.getSession().setAttribute("personalcity"+i+"", personal.getCity());
//                        request.getSession().setAttribute("personaldist"+i+"", personal.getDist());
//                        request.getSession().setAttribute("personalstate"+i+"", personal.getState());

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

                    System.out.println("The name of the compl. subscribers " + personal.getName());

                    result = true;
                }

                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        httpSession.setAttribute("iInitial", i);
        i = (int) (Math.ceil((float) (i) / 3));
        httpSession.setAttribute("endValue", i);
        System.out.println("The value of the I at the end is " + i);
        return result;
        //System.out.println("id length" + personalIds.length);
        // new PersonalDetailsDAO().printMultiple(ids);
    }

    public boolean archiveMultiple() {
    	
        String[] personalIds = request.getParameterValues("select-item");
        List ids = new ArrayList();
        boolean result = false;
        
        if(personalIds != null) {
        	
        	 for (String id : personalIds) {
                 System.out.println("id" + id);
                 ids.add(Integer.valueOf(id));
             }
             result = new PersonalDetailsDAO().archiveMultiple(ids);
        }
        return result;
        
    }

    public boolean viewAllArchive() {
        boolean result = false;
        try {
            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfArchive();
            List<City> listcity = new PersonalDetailsDAO().readListOfCity();
            List<District> listdist = new PersonalDetailsDAO().readListOfDistrict();
            httpSession.setAttribute("DistList", listdist);
            httpSession.setAttribute("CityList", listcity);
            httpSession.setAttribute("PersonalDetailsListArchive", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public void deleteMultiple() {
        String[] personalIds = request.getParameterValues("select-item");
        List ids = new ArrayList();
        for (String id : personalIds) {
            System.out.println("id" + id);
            ids.add(Integer.valueOf(id));

        }
        System.out.println("id length" + personalIds.length);
        new PersonalDetailsDAO().deleteMultiple(ids);
    }

    public void restoreMultiple() {
        String[] personalIds = request.getParameterValues("select-item");
        List ids = new ArrayList();
        for (String id : personalIds) {
            System.out.println("id" + id);
            ids.add(Integer.valueOf(id));

        }
        System.out.println("id length" + personalIds.length);
        new PersonalDetailsDAO().restoreMultiple(ids);
    }

    public Integer updateComplsubscriberContactInformation() {

        PersonalDetails personal = new PersonalDetails();
        System.out.println("m in personal service");
        String id = "";
        id = request.getParameter("id");

        System.out.println("THE ID IS: " + id);

        int personalId = 0;
        personalId = Integer.parseInt(id);
        System.out.println("M in in personal service and ID is :::::::::::::::::::::::::::::: " + personalId);

        personal.setPid(personalId);
        personal.setComplimentarysubscriber("1");
        personal.setName(DataUtil.emptyString(request.getParameter("name")));
        personal.setContactnumber(DataUtil.emptyString(request.getParameter("contactNO")));
        personal.setCocontactnumber(DataUtil.emptyString(request.getParameter("cocontactnumber")));
        personal.setEmail(DataUtil.emptyString(request.getParameter("email")));
        personal.setAddressline1(DataUtil.emptyString(request.getParameter("addressline1")));
        personal.setAddressline2(DataUtil.emptyString(request.getParameter("addressline2")));
        personal.setCity(DataUtil.emptyString(request.getParameter("city")));
        personal.setDist(DataUtil.emptyString(request.getParameter("dist")));

        personal.setState(DataUtil.emptyString(request.getParameter("state")));
        personal.setPincode(DataUtil.emptyString(request.getParameter("pincode")));

        personal.setLandmark(DataUtil.emptyString(request.getParameter("landmark")));
        personal.setCreateddate(DataUtil.emptyString(request.getParameter("createddate")));
        personal.setSubscriptionfor(DataUtil.emptyString(request.getParameter("subscriptionfor")));
        personal.setNoofissues(DataUtil.emptyString(request.getParameter("noofissues")));

        personal.setTotalissues(DataUtil.parseInt(request.getParameter("totalissues")));
        personal.setFromissueno(DataUtil.parseInt(request.getParameter("fromkmissueno")));
        personal.setToissueno(DataUtil.parseInt(request.getParameter("tokmissueno")));
        
        personal.setSubscribedby(DataUtil.emptyString(request.getParameter("subscribedby")));
        personal.setRemarks(DataUtil.emptyString(request.getParameter("remarks")));
        personal.setarchive(0);
        personal.setMarketing("0");
        personal.setSubscriber("0");
        personal.setAdvertiser("0");

        personal = new PersonalDetailsDAO().update(personal);
        return personal.getPid();
    }

    public boolean viewAllPrint(String pages) {
        boolean result = false;
        String inPage = pages;
        try {
            int page = 1;
            int recordsPerPage = 500;
            if (inPage != null) {
                page = Integer.parseInt(inPage);
            }

            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsForPrint((page - 1) * recordsPerPage, recordsPerPage);

            int noOfRecords = new PersonalDetailsDAO().getNoOfRecordsPrintAll();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);

            httpSession.setAttribute("PersonalDetailsListForPrint", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewAllPrintCS() {
        boolean result = false;
        try {
            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsForPrintCS();
            List<City> listcity = new PersonalDetailsDAO().readListOfCity();
            List<District> listdist = new PersonalDetailsDAO().readListOfDistrict();
            httpSession.setAttribute("DistList", listdist);
            httpSession.setAttribute("CityList", listcity);
            httpSession.setAttribute("PersonalDetailsListForPrintCS", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public Integer subscribe() {
        PersonalDetails personal = new PersonalDetails();
        System.out.println("m in personal service");
        String id = "";
        id = request.getParameter("id");

        System.out.println("THE ID IS: " + id);

        int personalId = 0;
        personalId = Integer.parseInt(id);
        System.out.println("M in in personal service and ID is :::::::::::::::::::::::::::::: " + personalId);

        personal.setPid(personalId);
        personal.setComplimentarysubscriber("1");
        personal.setName(DataUtil.emptyString(request.getParameter("name")));
        personal.setContactnumber(DataUtil.emptyString(request.getParameter("contactNO")));
        personal.setCocontactnumber(DataUtil.emptyString(request.getParameter("cocontactnumber")));
        personal.setEmail(DataUtil.emptyString(request.getParameter("email")));
        personal.setAddressline1(DataUtil.emptyString(request.getParameter("addressline1")));
        personal.setAddressline2(DataUtil.emptyString(request.getParameter("addressline2")));
        personal.setCity(DataUtil.emptyString(request.getParameter("city")));
        personal.setDist(DataUtil.emptyString(request.getParameter("dist")));

        personal.setState(DataUtil.emptyString(request.getParameter("state")));
        personal.setPincode(DataUtil.emptyString(request.getParameter("pincode")));

        personal.setLandmark(DataUtil.emptyString(request.getParameter("landmark")));
        personal.setCreateddate(DataUtil.emptyString(request.getParameter("createddate")));
        personal.setSubscriptionfor(DataUtil.emptyString(request.getParameter("subscriptionfor")));
        personal.setNoofissues(DataUtil.emptyString(request.getParameter("noofissues")));
        personal.setTotalissues(DataUtil.parseInt(request.getParameter("noofissues")));
        personal.setSubscribedby(DataUtil.emptyString(request.getParameter("subscribedby")));
        personal.setRemarks(DataUtil.emptyString(request.getParameter("remarks")));
        personal.setFromissueno(DataUtil.parseInt(request.getParameter("fromkmissueno")));
        personal.setToissueno(DataUtil.parseInt(request.getParameter("tokmissueno")));
        personal.setarchive(0);
        personal.setMarketing("0");
        personal.setSubscriber("1");
        personal.setAdvertiser("0");
        personal.setComplimentarysubscriber("0");



        personal = new PersonalDetailsDAO().update(personal);
        return personal.getPid();
    }

    public boolean backupData(String fileName) {
        System.out.println("In the backup for IS");
        boolean result = false;
        try {
            Properties properties = new Properties();
              // FileReader reader = new FileReader("Backuplocation.properties");
             //  properties.load(reader);
            //   String backupDirectory = properties.getProperty("backupdirectory");
           //    System.out.println("the backup directory is " + backupDirectory);
          //	 InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("Backuplocation.properties");

            InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("Backuplocation.properties");
            properties.load(inputStream);
            String backupDirectoryIS = properties.getProperty("backupdirectory");
            System.out.println("the backup directory from input stream is " + backupDirectoryIS);


            int processComplete; // to verify that either process completed or not
            String sqlExtension = ".sql";
            String backupLocation = backupDirectoryIS + fileName + sqlExtension;
            String mysqlPath = properties.getProperty("mysqlpath");
            System.out.println("the back up for  the backuplocation " + backupLocation);
            request.setAttribute("Backuplocation", backupLocation);
            Process runtimeProcess = Runtime.getRuntime().exec(mysqlPath + backupLocation);
            
            //Process runtimeProcess = Runtime.getRuntime().exec("/opt/software/mysql-5.6.40-linux-glibc2.12-x86_64/bin/mysqldump -uroot -pmysql --add-drop-database -B schoolcare -r " + "/home/mushy/" + "schoolcare" + ".sql");

            // call the mysqldump in terminal and execute it

            processComplete = runtimeProcess.waitFor();//store the state in variable

            if (processComplete == 1) {//if values equal 1 process failed
                System.out.println("FAILED");
                result = false;

            } else if (processComplete == 0) {//if values equal 0 process failed
                System.out.println("success");

                //display message
                result = true;

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean confirmPrintDelete() {
        boolean result = false;
        String[] personalIds = request.getParameterValues("select-item");
        List ids = new ArrayList();
        for (String id : personalIds) {

            ids.add(Integer.valueOf(id));

        }
        System.out.println("id length" + personalIds.length);
        try {
            new PersonalDetailsDAO().PrintUpdate(ids);
            result = true;
        } catch (Exception e) {
            System.out.println(e);
            result = false;
        }

        return result;
    }

    public boolean viewAllPersonalconfirmPrintPaid(String pages) {
        boolean result = false;
        String inPage = pages;
        try {
            int page = 1;
            int recordsPerPage = 2000;
            if (inPage != null) {
                page = Integer.parseInt(inPage);
            }
            System.out.println("The page is::::::::::::::::::::::::::::: " + page);
            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsForConfirmPrintPaid((page - 1) * recordsPerPage, recordsPerPage);
            int noOfRecords = new PersonalDetailsDAO().getNoOfRecordsconfirmPrint();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);

            httpSession.setAttribute("PersonalDetailsListConfirmPrint", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewAllPersonalNextLink(String first) {
        boolean result = false;
        try {
            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsNextLink(first);
            //  List<City> listcity = new PersonalDetailsDAO().readListOfCity();
            //  List<District> listdist = new PersonalDetailsDAO().readListOfDistrict();
            //  List<ExecutiveDetails> listExecutive = new ExecutiveDetailsDAO().readListOfObjects();
            // httpSession.setAttribute("DistList", listdist);
            // httpSession.setAttribute("CityList", listcity);
            httpSession.setAttribute("PersonalDetailsListConfirmPrint", list);
            //httpSession.setAttribute("ExecutiveList", listExecutive);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean viewAllPersonalPage(String pages) {
        boolean result = false;
        String inPage = pages;
        try {
            int page = 1;
            int recordsPerPage = 500;
            if (inPage != null) {
                page = Integer.parseInt(inPage);
            }
            System.out.println("The page is::::::::::::::::::::::::::::: " + page);
            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsPagination((page - 1) * recordsPerPage, recordsPerPage);
            int noOfRecords = new PersonalDetailsDAO().getNoOfRecords();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            request.setAttribute("employeeList", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
            //List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjects();
            List<City> listcity = new PersonalDetailsDAO().readListOfCity();
            List<District> listdist = new PersonalDetailsDAO().readListOfDistrict();
            List<ExecutiveDetails> listExecutive = new ExecutiveDetailsDAO().readListOfObjects();
            httpSession.setAttribute("DistList", listdist);
            httpSession.setAttribute("CityList", listcity);
            httpSession.setAttribute("PersonalDetailsList", list);
            httpSession.setAttribute("ExecutiveList", listExecutive);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public void dashBoard() {
        int noOfRecordsOfSubscribers = new PersonalDetailsDAO().getNoOfRecords();
        int noOfExecutives = new ExecutiveDetailsDAO().getnoOfExecutives();
        int noOfRecordsOfExpiringSubscribers = new PersonalDetailsDAO().getNoOfRecordsExpire();
        int noOfRecordsOfComplSubscribers = new PersonalDetailsDAO().getNoOfRecordsOfComplSubscribers();
        int noOfArchive = new PersonalDetailsDAO().getNoOfRecordsOfArchive();
        int noOfCreditSubscribers = new PersonalDetailsDAO().getNoOfRecordsOfCreditSubscribers();

        request.setAttribute("noOfRecordsOfSubscribers", noOfRecordsOfSubscribers);
        request.setAttribute("noOfRecordsOfComplSubscribers", noOfRecordsOfComplSubscribers);
        request.setAttribute("noOfRecordsOfExpiringSubscribers", noOfRecordsOfExpiringSubscribers);
        request.setAttribute("noOfCreditSubscribers", noOfCreditSubscribers);
        request.setAttribute("noOfExecutives", noOfExecutives);
        request.setAttribute("noOfArchive", noOfArchive);
    }

    public boolean distListView() {


        boolean result = false;

        try {



            List<District> listdist = new PersonalDetailsDAO().readListOfDistrict();

            httpSession.setAttribute("DistList", listdist);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean searchBy(String criteria) {

        boolean result = false;

        try {

            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsPaginationForSearchBy(criteria);


            httpSession.setAttribute("PersonalDetailsListForPrint", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean searchByDates() {


        String fromDate = request.getParameter("fromdate");
        String toDate = request.getParameter("todate");
        boolean result = false;

        try {

            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsForBetweenDates(fromDate, toDate);


            httpSession.setAttribute("PersonalDetailsListForPrint", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean addContactCreditS() {

        PersonalDetails personal = new PersonalDetails();
        City city = new City();
        District dist = new District();


        personal.setCreditsubscribers(DataUtil.emptyString(request.getParameter("creditsubscriber")));
        personal.setName(DataUtil.emptyString(request.getParameter("name")));
        personal.setContactnumber(DataUtil.emptyString(request.getParameter("contactNO")));
        personal.setCocontactnumber(DataUtil.emptyString(request.getParameter("cocontactnumber")));
        personal.setEmail(DataUtil.emptyString(request.getParameter("email")));
        personal.setAddressline1(DataUtil.emptyString(request.getParameter("addressline1")));
        //personal.setAddressline2(DataUtil.emptyString(request.getParameter("addressline2")));
        personal.setCity(DataUtil.emptyString(request.getParameter("city")));
        personal.setDist(DataUtil.emptyString(request.getParameter("dist")));
        personal.setState(DataUtil.emptyString(request.getParameter("state")));
        personal.setPincode(DataUtil.emptyString(request.getParameter("pincode")));
        personal.setLandmark(DataUtil.emptyString(request.getParameter("landmark")));
        personal.setCreateddate(DataUtil.emptyString(request.getParameter("createddate")));
        personal.setSubscriptionfor(DataUtil.emptyString(request.getParameter("subscriptionfor")));
        personal.setNoofissues(DataUtil.emptyString(request.getParameter("noofissues")));
        personal.setTotalissues(DataUtil.parseInt(request.getParameter("noofissues")));
        personal.setFromissueno(DataUtil.parseInt(request.getParameter("fromkmissueno")));
        personal.setToissueno(DataUtil.parseInt(request.getParameter("tokmissueno")));
        personal.setSubscribedby(DataUtil.emptyString(request.getParameter("subscribedby")));
        personal.setRemarks(DataUtil.emptyString(request.getParameter("remarks")));
        personal.setarchive(0);
        personal.setMarketing("0");
        personal.setComplimentarysubscriber("0");
        personal.setAdvertiser("0");
        personal.setSubscriber("0");


        String extracity = request.getParameter("city");
        String extradist = request.getParameter("dist");

        if ("Add New".equals(extracity)) {
            personal.setCity(DataUtil.emptyString(request.getParameter("addcity")));
        }


        if ("Add New".equals(extradist)) {
            personal.setDist(DataUtil.emptyString(request.getParameter("adddist")));
        }


        String addcity = request.getParameter("addcity");
        String adddist = request.getParameter("adddist");

        if (!"".equals(addcity)) {
            city.setName(addcity);
            city = new PersonalDetailsDAO().addcity(city);
        }

        if (!"".equals(adddist)) {
            dist.setName(adddist);
            dist = new PersonalDetailsDAO().adddist(dist);
        }

        personal = new PersonalDetailsDAO().create(personal);

        if (personal.getPid() == 0l) {
            return false;
        } else {
            httpSession.setAttribute("personal", personal);
            System.out.println("must display");


            return true;
        }
    }

    public boolean viewAllCreditS() {
    	
        boolean result = false;
        
        try {
            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsfromcredit();
            List<City> listcity = new PersonalDetailsDAO().readListOfCity();
            List<District> listdist = new PersonalDetailsDAO().readListOfDistrict();
            httpSession.setAttribute("DistList", listdist);
            httpSession.setAttribute("CityList", listcity);
            httpSession.setAttribute("PersonalDetailsList", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        
        return result;
        
    }

    public Integer updateCreditsubscriberContactInformation() {
        PersonalDetails personal = new PersonalDetails();
        System.out.println("m in personal service");
        String id = "";
        id = request.getParameter("id");

        System.out.println("THE ID IS: " + id);

        int personalId = 0;
        personalId = Integer.parseInt(id);
        System.out.println("M in in personal service and ID is :::::::::::::::::::::::::::::: " + personalId);

        personal.setPid(personalId);
        personal.setCreditsubscribers("1");
        personal.setName(DataUtil.emptyString(request.getParameter("name")));
        personal.setContactnumber(DataUtil.emptyString(request.getParameter("contactNO")));
        personal.setCocontactnumber(DataUtil.emptyString(request.getParameter("cocontactnumber")));
        personal.setEmail(DataUtil.emptyString(request.getParameter("email")));
        personal.setAddressline1(DataUtil.emptyString(request.getParameter("addressline1")));
        personal.setAddressline2(DataUtil.emptyString(request.getParameter("addressline2")));
        personal.setCity(DataUtil.emptyString(request.getParameter("city")));
        personal.setDist(DataUtil.emptyString(request.getParameter("dist")));

        personal.setState(DataUtil.emptyString(request.getParameter("state")));
        personal.setPincode(DataUtil.emptyString(request.getParameter("pincode")));

        personal.setLandmark(DataUtil.emptyString(request.getParameter("landmark")));
        personal.setCreateddate(DataUtil.emptyString(request.getParameter("createddate")));
        personal.setSubscriptionfor(DataUtil.emptyString(request.getParameter("subscriptionfor")));
        personal.setNoofissues(DataUtil.emptyString(request.getParameter("noofissues")));
        
        personal.setTotalissues(DataUtil.parseInt(request.getParameter("totalissues")));
        personal.setFromissueno(DataUtil.parseInt(request.getParameter("fromkmissueno")));
        personal.setToissueno(DataUtil.parseInt(request.getParameter("tokmissueno")));
        
        personal.setSubscribedby(DataUtil.emptyString(request.getParameter("subscribedby")));
        personal.setRemarks(DataUtil.emptyString(request.getParameter("remarks")));
        personal.setarchive(0);
        personal.setMarketing("0");
        personal.setSubscriber("0");
        personal.setAdvertiser("0");



        personal = new PersonalDetailsDAO().update(personal);
        return personal.getPid();
    }

    public Integer subscribeCredit() {
        PersonalDetails personal = new PersonalDetails();
        System.out.println("m in personal service");
        String id = "";
        id = request.getParameter("id");

        System.out.println("THE ID IS: " + id);

        int personalId = 0;
        personalId = Integer.parseInt(id);
        System.out.println("M in in personal service and ID is :::::::::::::::::::::::::::::: " + personalId);

        personal.setPid(personalId);
        personal.setCreditsubscribers("0");
        personal.setName(DataUtil.emptyString(request.getParameter("name")));
        personal.setContactnumber(DataUtil.emptyString(request.getParameter("contactNO")));
        personal.setCocontactnumber(DataUtil.emptyString(request.getParameter("cocontactnumber")));
        personal.setEmail(DataUtil.emptyString(request.getParameter("email")));
        personal.setAddressline1(DataUtil.emptyString(request.getParameter("addressline1")));
        personal.setAddressline2(DataUtil.emptyString(request.getParameter("addressline2")));
        personal.setCity(DataUtil.emptyString(request.getParameter("city")));
        personal.setDist(DataUtil.emptyString(request.getParameter("dist")));

        personal.setState(DataUtil.emptyString(request.getParameter("state")));
        personal.setPincode(DataUtil.emptyString(request.getParameter("pincode")));

        personal.setLandmark(DataUtil.emptyString(request.getParameter("landmark")));
        personal.setCreateddate(DataUtil.emptyString(request.getParameter("createddate")));
        personal.setSubscriptionfor(DataUtil.emptyString(request.getParameter("subscriptionfor")));
        personal.setNoofissues(DataUtil.emptyString(request.getParameter("noofissues")));
        personal.setSubscribedby(DataUtil.emptyString(request.getParameter("subscribedby")));
        personal.setRemarks(DataUtil.emptyString(request.getParameter("remarks")));
        personal.setarchive(0);
        personal.setMarketing("0");
        personal.setSubscriber("1");
        personal.setAdvertiser("0");
        personal.setComplimentarysubscriber("0");

        personal = new PersonalDetailsDAO().update(personal);
        return personal.getPid();
    }

    public boolean viewAllPrintCreditS() {
        boolean result = false;
        try {
            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsfromcredit();
            List<City> listcity = new PersonalDetailsDAO().readListOfCity();
            List<District> listdist = new PersonalDetailsDAO().readListOfDistrict();
            httpSession.setAttribute("DistList", listdist);
            httpSession.setAttribute("CityList", listcity);
            httpSession.setAttribute("PersonalDetailsListForPrintCreditS", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean searchForComplS(String criteria) {
        boolean result = false;

        try {

            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsPaginationForSearchForComplS(criteria);


            httpSession.setAttribute("PersonalDetailsListForPrintCS", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean searchByDatesComplS() {
        System.out.println("In search by dates");

        String fromDate = request.getParameter("fromdatecompls");
        String toDate = request.getParameter("todatecompls");
        boolean result = false;

        try {

            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsForBetweenDatesComplS(fromDate, toDate);


            httpSession.setAttribute("PersonalDetailsListForPrintCS", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean searchForComplSState(String criteria) {
        boolean result = false;

        try {

            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsPaginationForSearchForComplSState(criteria);


            httpSession.setAttribute("PersonalDetailsListForPrintCS", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean searchForComplSSubcribedby(String criteria) {
        boolean result = false;

        try {

            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsPaginationForSearchForComplSubscribedby(criteria);


            httpSession.setAttribute("PersonalDetailsListForPrintCS", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean searchByCreditS(String criteria) {
        boolean result = false;

        try {

            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsPaginationForSearchByCreditS(criteria);


            httpSession.setAttribute("PersonalDetailsListForPrint", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public boolean searchByDatesCreditS() {

        String fromDate = request.getParameter("fromdatecredits");
        String toDate = request.getParameter("todatecredits");
        boolean result = false;

        try {

            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsForBetweenDatesCreditS(fromDate, toDate);


            httpSession.setAttribute("PersonalDetailsListForPrint", list);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }
    
    
    public boolean addSubscriber(){
    	
        boolean result = false;
        List<ExecutiveDetails> listExecutive = new ExecutiveDetailsDAO().readListOfObjects();
        if(listExecutive!=null){
            result=true;
            httpSession.setAttribute("ExecutiveList", listExecutive);
        }
        List<City> listCity = new PersonalDetailsDAO().readListOfCity();
        if(listCity!=null){
            result=true;
            httpSession.setAttribute("CityList", listCity);
        }
            
        return result;
    }

	public void getSubscribersByName() {
		 List<PersonalDetails> list = new PersonalDetailsDAO().readListOfSubscribersByName(request.getParameter("subscribersname"));
         httpSession.setAttribute("subscribersnamelist", list);
	}

	public boolean viewAllExpiryComp(String pages) {
        boolean result = false;
        String inPage = pages;
        try {
            int page = 1;
            int recordsPerPage = 500;
            if (inPage != null) {
                page = Integer.parseInt(inPage);
            }
            System.out.println("The page is::::::::::::::::::::::::::::: " + page);

            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfExpiryComp((page - 1) * recordsPerPage, recordsPerPage);
            httpSession.setAttribute("PersonalDetailsListExpire", list);
            int noOfRecords = new PersonalDetailsDAO().getNoOfRecordsExpire();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

	public boolean markPaid() {
    	
        String[] personalIds = request.getParameterValues("select-item");
        List ids = new ArrayList();
        boolean result = false;
        
        if(personalIds != null) {
        	
        	 for (String id : personalIds) {
                 System.out.println("id" + id);
                 ids.add(Integer.valueOf(id));
             }
        	 
             result = new PersonalDetailsDAO().paidMultiple(ids);
        }
        return result;
        
    }

	public boolean viewAllExpiryCredit() {
        boolean result = false;
        try {
            int page = 1;
            int recordsPerPage = 500;

            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfExpiryCredit((page - 1) * recordsPerPage, recordsPerPage);
            httpSession.setAttribute("PersonalDetailsListExpire", list);
            int noOfRecords = new PersonalDetailsDAO().getNoOfRecordsExpire();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

	public boolean viewExpiringAll() {
        boolean result = false;
        try {
            int page = 1;
            int recordsPerPage = 500;

            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfAllExpiry((page - 1) * recordsPerPage, recordsPerPage);
            httpSession.setAttribute("PersonalDetailsListExpire", list);
            int noOfRecords = new PersonalDetailsDAO().getNoOfRecordsExpire();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

	public boolean viewAllPersonalconfirmPrintComp(String pages) {
		
        boolean result = false;
        String inPage = pages;
        try {
            int page = 1;
            int recordsPerPage = 2000;
            if (inPage != null) {
                page = Integer.parseInt(inPage);
            }
            System.out.println("The page is::::::::::::::::::::::::::::: " + page);
            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsForConfirmPrintComp((page - 1) * recordsPerPage, recordsPerPage);
            int noOfRecords = new PersonalDetailsDAO().getNoOfRecordsconfirmPrint();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);

            httpSession.setAttribute("PersonalDetailsListConfirmPrint", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

	public boolean viewAllPersonalconfirmPrintCredit(String pages) {
		
        boolean result = false;
        String inPage = pages;
        try {
            int page = 1;
            int recordsPerPage = 2000;
            if (inPage != null) {
                page = Integer.parseInt(inPage);
            }
            System.out.println("The page is::::::::::::::::::::::::::::: " + page);
            List<PersonalDetails> list = new PersonalDetailsDAO().readListOfObjectsForConfirmPrintCredit((page - 1) * recordsPerPage, recordsPerPage);
            int noOfRecords = new PersonalDetailsDAO().getNoOfRecordsconfirmPrint();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);

            httpSession.setAttribute("PersonalDetailsListConfirmPrint", list);

            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }
}

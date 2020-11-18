/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.executive.service;

import com.model.executive.dao.ExecutiveDetailsDAO;
import com.model.executive.dto.ExecutiveDetails;
import com.model.personal.dao.PersonalDetailsDAO;
import com.model.personal.dto.City;
import com.model.personal.dto.District;
import com.model.personal.dto.PersonalDetails;
import com.util.DataUtil;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CPEDUR1P5
 */
public class ExecutiveService {
    
     private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;

    public ExecutiveService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

      public boolean viewAllExecutive() {
        boolean result = false;
        try {
            
            List<ExecutiveDetails> listExecutive = new ExecutiveDetailsDAO().readListOfObjects();
            httpSession.setAttribute("ExecutiveListAll", listExecutive);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public void deleteMultipleExecutive() {
         String[] personalIds = request.getParameterValues("executiveIDs");
        List ids = new ArrayList();
        for (String id : personalIds) {
            System.out.println("id" + id);
            ids.add(Integer.valueOf(id));

        }
        System.out.println("id length" + personalIds.length);
        new ExecutiveDetailsDAO().deleteMultipleExecutive(ids);
    }

    public boolean addContactExecutive() {
          System.out.println("in addcontactexecutive of executive service");
        ExecutiveDetails executive = new ExecutiveDetails();
        
        executive.setName(DataUtil.emptyString(request.getParameter("name")));
        executive.setContactnumber(DataUtil.emptyString(request.getParameter("contactNO")));
        executive.setJoiningdate(DataUtil.emptyString(request.getParameter("joiningdate")));
        executive.setAddress(DataUtil.emptyString(request.getParameter("address")));
        executive.setEmail(DataUtil.emptyString(request.getParameter("email")));
        executive.setRemarks(DataUtil.emptyString(request.getParameter("remarks")));
        
          executive = new ExecutiveDetailsDAO().create(executive);
        
        if (executive.getEid() == 0l) {
            return false;
        } else {
            httpSession.setAttribute("executive", executive);
            System.out.println("must display");


            return true;
        }
    }

    public boolean viewDetailsOfContact() {
         boolean result = false;
        try {
            long id = Long.parseLong(request.getParameter("id"));
            ExecutiveDetails executive = new ExecutiveDetailsDAO().readUniqueObject(id);
            String executiveName = executive.getName();
            int subscribersByExecutive = new ExecutiveDetailsDAO().findSubscribers(executiveName);
            System.out.println("The total number of subscribers subscribed by the executive:::::::: "+subscribersByExecutive);
            if (executive == null) {
                result = false;
            } else {
                httpSession.setAttribute("executiveDetails", executive);
                httpSession.setAttribute("subscribersByExecutive", subscribersByExecutive);

                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }
        return result;
    }

    public long updateContactInformation() {
        ExecutiveDetails executive = new ExecutiveDetails();
        System.out.println("m in executive service");
        String id = "";
        id = request.getParameter("id");

        System.out.println("THE ID IS: " + id);

        int executiveId = 0;
        executiveId = Integer.parseInt(id);
        System.out.println("M in in personal service and ID is :::::::::::::::::::::::::::::: " + executiveId);

        executive.setEid(executiveId);
       
        executive.setName(DataUtil.emptyString(request.getParameter("name")));
        executive.setContactnumber(DataUtil.emptyString(request.getParameter("contactNO")));
        executive.setJoiningdate(DataUtil.emptyString(request.getParameter("joiningdate")));
        executive.setEmail(DataUtil.emptyString(request.getParameter("email")));
        executive.setAddress(DataUtil.emptyString(request.getParameter("address")));
        executive.setRemarks(DataUtil.emptyString(request.getParameter("remarks")));
        

        executive = new ExecutiveDetailsDAO().update(executive);
        return executive.getEid();
    }
    
    
}

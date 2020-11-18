/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.currentIssue.service;

import com.model.currentIssue.dao.CurrentIssueDAO;
import com.model.currentIssue.dto.CurrentIssue;
import com.model.personal.dao.PersonalDetailsDAO;
import com.model.personal.dto.City;
import com.model.personal.dto.District;
import com.model.personal.dto.PersonalDetails;
import com.util.DataUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Musaib
 */
public class CurrentIssueService {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession httpSession;
    
    public CurrentIssueService(HttpServletRequest request, HttpServletResponse response) {
     this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public Integer add() {
         CurrentIssue currentIssue = new CurrentIssue();
       
         currentIssue.setPci(1);
         
       String issue= DataUtil.emptyString(request.getParameter("issue"));
       
       if(!issue.equalsIgnoreCase("")){
           int issueNumber = Integer.parseInt(issue);
           currentIssue.setCurrentissue(issueNumber);
       }

        currentIssue = new CurrentIssueDAO().createIssue(currentIssue);
        
        return currentIssue.getPci();
        
       
           }

    
    
}

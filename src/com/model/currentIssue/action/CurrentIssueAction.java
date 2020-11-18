/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.currentIssue.action;

import com.model.currentIssue.service.CurrentIssueService;
import com.model.personal.service.PersonalService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Musaib
 */
public class CurrentIssueAction {
    HttpServletRequest request;
    HttpServletResponse response;
    HttpSession httpSession;
    String url;
    
    public CurrentIssueAction(HttpServletRequest request, HttpServletResponse response){

         this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }
     public String execute(String action) {
        if (action.equalsIgnoreCase("addIssue")) {
            System.out.println("Action is addIssue");
            url = addIssue();
        } 
        return url;
    }

    private String addIssue() {
        new CurrentIssueService(request, response).add();
        return "currentIssueSuccess.jsp";
    }

    
    
}

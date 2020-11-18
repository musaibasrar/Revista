/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.executive.action;

import com.model.executive.service.ExecutiveService;
import com.model.personal.service.PersonalService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CPEDUR1P5
 */
public class ExecutiveAction {
 

    HttpServletRequest request;
    HttpServletResponse response;
    HttpSession httpSession;
    String url;

    public ExecutiveAction(HttpServletRequest request, HttpServletResponse response) {

        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();
    }

    public String execute(String action) {
       if (action.equalsIgnoreCase("viewAllExecutive")) {
            url = viewAllExecutive();
        }else if (action.equalsIgnoreCase("deleteExecutiveMultiple")) {
            url = deleteExecutiveMultiple();
        }else if (action.equalsIgnoreCase("AddContactExecutive")) {
            url = AddContactExecutive();
        }else if (action.equalsIgnoreCase("viewDetails")) {
            url = viewDetails();

        }else if (action.equalsIgnoreCase("updateContactDetails")) {
            url =  updateContactDetails();

        }else if (action.equalsIgnoreCase("update")) {
            url =updateContact();
        }
        return url;
    }


    private String viewAllExecutive() {
       new ExecutiveService(request, response).viewAllExecutive();
        System.out.println("IN action's view all");
        return "viewAllExecutive.jsp";
    }

    private String deleteExecutiveMultiple() {
        new ExecutiveService(request, response).deleteMultipleExecutive();
        return "Controller?process=ExecutiveProcess&action=viewAllExecutive";
    }

    private String AddContactExecutive() {
        System.out.println("in add executive of executive action");
        if (new ExecutiveService(request, response).addContactExecutive()) {
            return "savedExecutive.jsp";
        } else {
            return "notSaved.jsp";
        }
    }

    private String viewDetails() {
         if (new ExecutiveService(request, response).viewDetailsOfContact()) {
            //return "patientDetails_1.jsp";
            return "Executive_details.jsp";
        } else {
            return "viewAllExecutive.jsp";
        }
    }

    private String updateContactDetails() {
        if (new ExecutiveService(request, response).viewDetailsOfContact()) {
            String userType = "admin";
            if(userType.equalsIgnoreCase("admin") ){
            return "update_Executive.jsp";
            }else{
                   return "update_Executive.jsp";
            }

        } else {
            return "Controller?process=ExecutiveProcess&action=viewAllExecutive";
        }
    }

    private String updateContact() {
         return "Controller?process=ExecutiveProcess&action=viewDetails&id=" + new ExecutiveService(request, response).updateContactInformation();
    }
   
}

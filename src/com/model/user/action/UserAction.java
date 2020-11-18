/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.user.action;

import com.model.user.service.UserService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CPEDUR1P5
 */
public class UserAction {
    HttpServletRequest request;
    HttpServletResponse response;
    private String url;

    public UserAction(HttpServletRequest request, HttpServletResponse response) {
        this.request=request;
        this.response=response;
    }

    public String execute(String action) {
       if (action.equalsIgnoreCase("authenticateUser")) {
            url = authenticateUser();
        }else if (action.equalsIgnoreCase("logout")) {
            url = logOutUser();
        }else if (action.equalsIgnoreCase("changePassword")) {
            url = changePassword();
        } else if (action.equalsIgnoreCase("sessionTimeOut")) {
            url = sessionTimeOut();
        }
       return url;
    }

    private String sessionTimeOut() {
		return "sessiontimeout.jsp";
		}

	private String authenticateUser() {
         if (new UserService(request, response).authenticateUser()) {

            return "login.jsp?login_success=true";
        } else {
            return "login.jsp?login_success=false";
        }
    }

    private String logOutUser() {
        new UserService(request, response).logOutUser();
        return "login.jsp?logout=true";
    }

    private String changePassword() {
        if(new UserService(request, response).ChangePassword()){
            return "passwordSuccess.jsp";
        }else{
            return "passwordFail.jsp";
        }
        
    }
    
}

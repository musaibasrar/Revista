/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.user.service;

import com.model.user.dao.UserDAO;
import com.model.user.dto.Login;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CPEDUR1P5
 */
public class UserService {

    HttpServletRequest request;
    HttpServletResponse response;
    HttpSession httpSession;
    private Login login;

    public UserService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.httpSession = request.getSession();

    }

    public boolean authenticateUser() {
         boolean result;
         System.out.println("in user service");
        String userName = request.getParameter("loginName");
        String password = request.getParameter("password");
        System.out.println("IN UserService class");
        System.out.println("The user name is "+userName);

        login = new UserDAO().readUniqueObject(userName, password);
        
//        String usertype = login.getUsertype();
//        System.out.println("The the the usertype is "+usertype);
        


        if (login != null) {
            request.setAttribute("userType", login.getUsertype());
            System.out.println("In userservice user present");
            httpSession.setAttribute("executive",login.getUsertype());
            httpSession.setAttribute("userAuth", login.getUsertype());
            //new NationalityService(request, response).setSessionAtrributes();
            result = true;
        } else {
            System.out.println("In userservice the login is null");
            System.out.println("Login Fail");
            result = false;
            
        }
      //setting session to expiry in 60 mins
       	httpSession.setMaxInactiveInterval(60*60);
		Cookie cookie = new Cookie("user",  login.getUsertype());
		cookie.setMaxAge(30*60);
		response.addCookie(cookie);
		
        return result;
    }

    public void logOutUser() {
		httpSession.invalidate();
        new UserDAO().sessionClose();
	}

    public boolean ChangePassword() {
        boolean result;
        String currentPassword = request.getParameter("currentpassword");
        String newPassword = request.getParameter("newpassword");
        String ConfirmNewPassword = request.getParameter("confirmpassword");
        
        login = new UserDAO().readPassword(currentPassword);
        
        if (login != null && newPassword.equals(ConfirmNewPassword)) {
             
            login.setId(1);
            login.setPassword(newPassword);  
            login = new UserDAO().update(login);
            System.out.println("The login value after updating the password is "+login);
            result = true;
        } else {
            
            System.out.println("Password update fails");
            result = false;
            
        }
        return result;
    }
}

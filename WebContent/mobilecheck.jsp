<%-- 
    Document   : mobilecheck
    Created on : Feb 7, 2013, 2:02:08 PM
    Author     : Musaib
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.model.user.dto.Login" %>
<%@page import="com.model.user.dao.UserDAO" %>
<%@page import="com.model.personal.dto.PersonalDetails" %>
<%@page import="com.model.personal.dao.PersonalDetailsDAO" %>
<%@page import="com.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            String name = request.getParameter("name");
            String mobile = request.getParameter("contactNO");
            
            PersonalDetails personaldetails;
            personaldetails = new PersonalDetailsDAO().readUniqueObjectM(mobile);

            if (personaldetails != null) {
                out.println("Mobile No. Exists");
            } else {
                
            }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
       
    </body>
</html>

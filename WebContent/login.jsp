
<%--
    Document   : login
    Created on : Dec 28, 2012, 11:47:36 AM
    Author     : Musaib
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/stylelogin.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/openWindow.js"></script>
        <style type="text/css">
            <!--
            .style6 {font-size: 12}
            .style8 {font-family: Tahoma; font-size: 12; color: #333333; }
            .status {font-family: Tahoma; font-size: 12px; color: red;  display: none}
            .style48 {font-family: Arial, Helvetica, sans-serif}
            -->
        </style>


        <script type="text/javascript">


            function redirect(){

                var form1=document.getElementById("form1");
                form1.action="Controller?process=UserProcess&action=authenticate";
                form1.submit();
            }
        </script>
    </head>
    <body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
        <script type="text/javascript">
            var flag1=<c:out default="" value="${param.login_success}"/>;
            var type='<c:out default="" value="${userType}"/>';
            

                if(flag1){
                    	/* window.open('index.jsp','_self'); */
                    	window.open('Controller?process=PersonalProcess&action=dashBoard','_self');
                }
                else if(!flag1){
                    
                	window.open('loginfail.jsp','_self');
                    
                }
        </script>
	<div id="header">
    	<div class="hdr_cont">
        </div>
    </div>
    <!-- header ends -->
    
    <div id="login_body">
    	<div class="login_bg_wrper">
        	<div class="login_wraper">
                    <form action="Controller?process=UserProcess&action=authenticateUser" method="post">
            	<div class="top_txt" style="color: black;">Username</div>
                <div class="input_area">
            	<input style="background:#ffffff; border: 1px solid #e0e0e0; border-radius:5px; height: 14px; width: 249px; padding:12px;" class="" type="text" name="loginName" />
                </div>
                
                <div class="top_txt" style="color: black;">Password</div>
                <div class="input_area">
            	<input style="background:#ffffff; border: 1px solid #e0e0e0; border-radius:5px; height: 14px; width: 249px; padding:12px;" class="" type="password" name="password" />
                </div>
                
                <div class="submt_btn">
                	<input style="background:url(images/sign_btn.png)no-repeat; height: 37px; width: 82px; padding:12px; text-indent:-999px; border:none; cursor:pointer;" class="" type="submit" name="login" />
                </div>
                
                
            </form>
            </div>
        </div>
    </div>
    <!-- login id ends -->
    
    <div id="main_ftr">
    	<div class="ftr_cont" style="text-align: right;">
        	Powered By <a href="https://www.ideoholic.com" target="_blank">Ideoholic</a>   
        </div>
    </div>
    <!-- footer ends -->
     
    </body>
</html>



<%-- 
    Document   : login
    Created on : Jun 13, 2013, 12:16:06 PM
    Author     : CPEDUR1P5
--%>

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


            function redirect() {

                var form1 = document.getElementById("form1");
                form1.action = "Controller?process=UserProcess&action=authenticate";
                form1.submit();
            }
        </script>
    </head>
    <body>
        <script type="text/javascript">
            var flag1 =<c:out default="" value="${param.login_success}"/>;
            var type = '<c:out default="" value="${userType}"/>';


            if (flag1) {
                if (type == 'admin') {
                    window.open('', '_self');
                    window.close();
                    openIndexPage('index.jsp', screen.width, screen.height);
                }
                else if (type == 'executive') {
                    window.open('', '_self');
                    window.close();
                    openIndexPage('index_executive.jsp', screen.width, screen.height);

                }
                else if (type == 'reception') {
                    window.open('', '_self');
                    window.close();
                    openIndexPage('index_reception1.jsp', screen.width, screen.height);

                }
                else if (type == 'pharmacy') {
                    window.open('', '_self');
                    window.close();
                    openIndexPage('index_pharmacy.jsp', screen.width, screen.height);

                }
            }
            else if (!flag1) {

                alert('Wrong Username and Password');

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
            	<div class="top_txt">Username</div>
                <div class="input_area">
            	<input style="background:#f2f2f2; border: 1px solid #e0e0e0; border-radius:5px; height: 14px; width: 249px; padding:12px;" class="" type="text" name="loginName" />
                </div>
                
                <div class="top_txt">Password</div>
                <div class="input_area">
            	<input style="background:#f2f2f2; border: 1px solid #e0e0e0; border-radius:5px; height: 14px; width: 249px; padding:12px;" class="" type="text" name="password" />
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
    	<div class="ftr_cont">
        	© 2013 creative clusters. 
        </div>
    </div>
    <!-- footer ends -->
     
</body>

</html>



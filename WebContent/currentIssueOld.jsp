<%-- 
    Document   : notSaved
    Created on : Jan 5, 2012, 1:11:53 PM
    Author     : Mayur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css" title="currentStyle">
            @import "css/dataTable/css/demo_page.css";
            @import "css/dataTable/css/jquery.dataTables.css";
        </style>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.17.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">
        <!--<script type="text/javascript" language="javascript" src="js/dataTable/jquery.js"></script>-->
        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" language="javascript" src="js/dataTable/jquery.dataTables.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>




        <style type="text/css">
            .styleCurrentIssue {
                font-family: Tahoma;
                font-weight: bold;
                color: #5E87B0;
                font-size: 18px;
            }
            <!--
            .divCSS {
                height: 40px;
                width: 200px;
                border: 1px solid #305876;

            }
            .tableCSS {
                background-position: center center;
                vertical-align: middle;
                height: 140px;
                width: 100%;
            }
            .style1 {
                font-family: Tahoma;
                font-weight: bold;
                color: #5E87B0;
                font-size: 12px;
            }
            .style2 {
                font-size: 12px;
                color: #000000;
            }
            -->
            .styleBack {
                font-family: Tahoma;
                font-weight: bold;
                color: red;
                font-size: 20px;
            }
        </style>

        <script type="text/javascript">
            $(function() {
                $("#ok").button()

                

                 $( "#cancel" )
                .button()
                .click(function() {
                    Cancel();


                });
            });
            
            function Cancel(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=PersonalProcess&action=ViewAll";
                form1.submit();
            }
            
             function validateIssue()
            {
                if( document.getElementById("issue").value.length==0)

                {
                    document.getElementById("issue").style.background='red';
                    alert("Enter The number of current issue");
                }

                
            }

            function cancel() {
                var form1 = document.getElementById("form1");
                form1.action = "Controller?process=PersonalProcess&action=viewAll";
                form1.submit();
            }
        </script>
    </head>
    <body background="images/bg.jpg" >
        <form id="form1" method="post" action="Controller?process=CurrentIssueProcess&action=addIssue">

            <table height="462" class="tableCSS"  >
                <tr>
                    <td height="250" align="center" valign="middle"><p class="styleCurrentIssue">Enter the current news paper issue </p>

                        <p class="style1">

                            <label>
                                <input name="issue" type="text" class="textField" id="issue" size="10" onblur="validateName();">
                            </label>
                        </p>
                        
                        <br/>

                        <p class="style1">

                            <input type="submit" id="ok" value="OK" onmouseover="validateIssue()" >&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" value="Cancel" id="cancel" >
                        </p></td>

                </tr>

            </table>

        </form>
    </body>
</html>

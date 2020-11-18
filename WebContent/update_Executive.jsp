<%-- 
    Document   : updatexecutive
    Created on : Jan 10, 2013, 3:25:59 PM
    Author     : Musaib
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html >
    <head >
     <%
            response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
        %>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Update Executive</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="css/styles.css" rel="stylesheet" />
        <!-- <link href="css/bootstrap.min.css" rel="stylesheet"  />-->
        <link href="css/dataTables.bootstrap4.min.css" rel="stylesheet" /> 
        <script src="js/all.min.js"></script>
         <script src="js/jquery.min.js"></script>
      <!--  <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script> -->

			<style type="text/css">
			
				.rowclass {
					text-align: right;
				}

        </style>
		
        <script type="text/javascript">
            
        	function getSubscriber() {
				var form2 = document.getElementById("form2");
				if(form2.checkValidity()) {
					form2.subscribersearch.disabled = true;
					form2.action = "Controller?process=PersonalProcess&action=getSubscribers";
					form2.submit();
				  }
			}
        	
        </script>
        
        
        <script type="text/javascript">

            $(function() {
            	$("#contactno").keypress(function (e) {
       		     //if the letter is not digit then display error and don't type anything
       		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
       		               return false;
       		    }
       		   });
            	
            	$("#cocontactnumber").keypress(function (e) {
       		     //if the letter is not digit then display error and don't type anything
       		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
       		               return false;
       		    }
       		   });
            });
        </script>
        
        <script>



            function validateFormNo()
            {
                if (document.getElementById("formNo").value.length == 0)

                {
                    document.getElementById("formNo").style.background = 'red';
                    alert("Enter The Form Number");
                }
            }



            function validateContact()
            {

                if (document.getElementById("contactNO").value.length == 0)
                {
                    document.getElementById("contactNO").style.background = 'red';

                    alert("Enter Contact number");

                }


            }

            function validateContactNum(obj) {

                document.getElementById("contactNO").style.background = 'white';

                reg = /[^0-9]/g;
                obj.value = obj.value.replace(reg, "");

            }




            function validateNameContact()
            {
                if (document.getElementById("name").value.length == 0)

                {
                    document.getElementById("name").style.background = 'red';
                    alert("Enter The Name ");
                }


            }

        </script>


        <script>
            function validateWhileSave()
            {
                if (document.getElementById("name").value.length == 0)

                {
                    document.getElementById("name").style.background = 'red';
                    alert("Enter The Name");
                }

                if (document.getElementById("contactNO").value.length == 0)

                {
                    document.getElementById("contactNO").style.background = 'red';
                    alert("Enter The Contact Number");
                }
            }



        </script>
        
    </head>
    <%
	//allow access only if session exists
	String user = null;
	if (session.getAttribute("userAuth") == null) {
		response.sendRedirect("Controller?process=UserProcess&action=sessionTimeOut");
	} else
		user = (String) session.getAttribute("userAuth");
	String userName = null;
	String sessionID = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("user"))
				userName = cookie.getValue();
			if (cookie.getName().equals("JSESSIONID"))
				sessionID = cookie.getValue();
		}
	}
%>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark border-bottom">
            <a class="navbar-brand" href="#"><img src="images/schoolcarelogoheader.png" height="60" width="200"></a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" id="form2" method="post">
                <div class="input-group">
                    <input class="form-control" type="text" name="subscribersname" placeholder="Search for Subscribers..." aria-label="Search" aria-describedby="basic-addon2" required/>
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button" name="subscribersearch" onclick="getSubscriber();"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
            <!-- Navbar-->
            <form id="form3" method="post">
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">Settings</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="Controller?process=UserProcess&action=logout">Logout</a>
                    </div>
                </li>
            </ul>
            </form>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        	<div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="Controller?process=PersonalProcess&action=dashBoard">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Subscribers</div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-address-book"></i></div>
                               		Paid Subscribers
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=viewAll">View All</a>
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=addSubscriber">Add New</a>
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=expire">Expiring</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayoutscomp" aria-expanded="false" aria-controls="collapseLayoutscomp">
                                <div class="sb-nav-link-icon"><i class="far fa-address-book"></i></div>
                               		Comp. Subscribers
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayoutscomp" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=viewAllComplementary">View All</a>
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=addSubscriberComp">Add New</a>
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=expirecomp">Expiring</a>
                                </nav>
                            </div>
                             <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayoutscredit" aria-expanded="false" aria-controls="collapseLayoutscredit">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                               		Credit Subscribers
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayoutscredit" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=viewAllCreditS">View All</a>
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=addSubscriberCredit">Add New</a>
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=expirecredit">Expiring</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                             <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayoutsprint" aria-expanded="false" aria-controls="collapseLayoutsprint">
                                <div class="sb-nav-link-icon"><i class="fas fa-print"></i></div>
                               		Print
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayoutsprint" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=print">Paid Subscribers</a>
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=printCompl">Comp. Subscribers</a>
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=printCredit">Credit Subscribers</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayoutsconfirmprint" aria-expanded="false" aria-controls="collapseLayoutsconfirmprint">
                                <div class="sb-nav-link-icon"><i class="fas fa-paper-plane"></i></div>
                               		Confirm Dispatch
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayoutsconfirmprint" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=viewAllconfirmPrintPaid">Paid Subscribers</a>
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=viewAllconfirmPrintComp">Comp. Subscribers</a>
                                    <a class="nav-link" href="Controller?process=PersonalProcess&action=viewAllconfirmPrintCredit">Credit Subscribers</a>
                                </nav>
                            </div>
                             <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayoutsextras" aria-expanded="false" aria-controls="collapseLayoutsextras">
                                <div class="sb-nav-link-icon"><i class="fab fa-affiliatetheme"></i></div>
                               		Extras
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayoutsextras" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="Backup&Restore.jsp">Backup</a>
                                    <a class="nav-link" href="currentIssue.jsp">Current Issue</a>
                                    <a class="nav-link" href="changePassword.jsp">Change Password</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="Controller?process=PersonalProcess&action=advanceSearch">
                                <div class="sb-nav-link-icon"><i class="fab fa-searchengin"></i></div>
                                Advance Search
                            </a>
                            <a class="nav-link" href="Controller?process=PersonalProcess&action=viewAllArchive">
                                <div class="sb-nav-link-icon"><i class="fas fa-archive"></i></div>
                                Archive
                            </a>
                            <div class="sb-sidenav-menu-heading">Executives</div>
                             <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayoutsexecutive" aria-expanded="false" aria-controls="collapseLayoutsexecutive">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-tie"></i></div>
                               		Executive
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayoutsexecutive" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="addExecutive.jsp">Add New</a>
                                    <a class="nav-link" href="Controller?process=ExecutiveProcess&action=viewAllExecutive">View All</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div> -->
                </nav>
            </div>
            <div id="layoutSidenav_content">
                
                <main>
                		<form id="form1" method="post"  >
								<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");%>
            <div>
                <div id="tabs">
                	<br>
                    	<ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Update Executive's Details</li>
                        </ol>

                    <div>
                        <table width="80%" border="0" align="center">
                            
                            <tr>
                                <td>
                                    <label>
	                                    <input type="hidden" name="id" id="id" value="<c:out value="${executiveDetails.eid}" />" />
                                    </label>
                                    <br/>
                                </td>
                            </tr>


                            <tr>
                                <td class="rowclass" >Name* &nbsp;</td>
								<td><input name="name" type="text" value="<c:out value="${executiveDetails.name}" />"  class="myclass" id="name" size="26" onblur="validateName();"  onkeyup="check(this.value);"></td>
                                <td class="rowclass" >Contact Number &nbsp;</td> 
                                    <td> <input name="contactNO" type="text" value="<c:out value="${executiveDetails.contactnumber}" />"  class="textField" id="contactno" size="26" minlength="10" maxlength="10" onblur="checkmobile(this.value);" onkeypress="return validateContactNum(this);" >
                                 </td>
                            </tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>

                            <tr>


                                <td class="rowclass" >E-mail &nbsp;   </td>
                                     <td>
                                     <input name="email" type="email" value="<c:out default="" value="${executiveDetails.email}" />" class="textField" id="email" size="26" onclick="validateNameContact();" >
                                </td>
                                
                                <td class="rowclass">Address&nbsp;  </td>

                                <td>
                                        <input name="address" type="text" value="<c:out default="" value="${executiveDetails.address}" />" class="textField" id="addressline1" size="30">

                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>

                            <tr>


                                <td class="rowclass" >Joining Date &nbsp;</td>
                                     <td>
                                    	 <input name="joiningdate" type="date" value="<c:out default="" value="${executiveDetails.joiningdate}" />" style="width:260px;"  data-validate="validate(required)" >
                                	</td>
                                
                                
                                <td>Remarks&nbsp;  </td>
                                <td>
                                      <input name="remarks" type="text"  value="<c:out default="" value="${executiveDetails.remarks}" />" id="remarks" size="30" data-validate="validate(required)" >
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            </table>
                            <div>
                                <table width="100%" >
                                    <tr>

                                        <td>
                                            <br/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <button id="set" class="btn btn-info" onmouseover="validateNameContact();" onclick="updatePersonal();">Update</button>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button id="cancel" class="btn btn btn-warning" onclick="cancelEdit();">Cancel</button>
                                        </td>
                                    </tr>
                                </table>
								<br>
                            </div>
                            </table>
                    </div>
                </div>
        </form>
                </main>
                
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted"></div>
                            <div>
                                <p>Powered By <a href="www.ideoholic.com">IDEOHOLIC</a></p>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        
         <script src="js/jquery-3.5.1.slim.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/scripts.js"></script>
		<script src="js/dataTable/jquery.dataTables.min.js"></script>
		<script src="js/dataTables.bootstrap4.min.js" ></script>
		<script src="assets/demo/datatables-demo.js"></script>
        <script type="text/javascript">


				        function cancelEdit(){
				           
				            var form1 = document.getElementById(form1);
				            form1.action="Controller?process=ExecutiveProcess&action=viewAllExecutive";
				            form1.submit();
				        }
				
				       
				        function updatePersonal(){
				                                      
				            var form1=document.getElementById("form1");
				            form1.action="Controller?process=ExecutiveProcess&action=update";
				            form1.submit();
				        }
		        
        </script>
    </body>
    
</html>


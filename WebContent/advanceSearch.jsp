<%-- 
    Document   : AdvanceSearch
    Created on : Dec 29, 2012, 1:57:17 PM
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
        <title>Advance Search</title>
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


                $("#save")
                        .button()
                        .click(function() {
                    searchBetweenDates();


                });
                $("#searchcredits")
                        .button()
                        .click(function() {
                    searchBetweenDatesCreditS();


                });
                $("#searchcompls")
                        .button()
                        .click(function() {
                    searchBetweenDatesComplS();


                });
                 $("#cancelcompls")
                        .button()
                        .click(function() {
                    Cancel();


                });
                $("#cancelcredits")
                        .button()
                        .click(function() {
                    Cancel();


                });

                $("#cancel")
                        .button()
                        .click(function() {
                    Cancel();


                });
            });


        </script>
        
               
        <script>
            $(function() {
                $("#datepickertodate").datepicker({changeYear: true, changeMonth: true});
                $("#anim").change(function() {
                    $("#datepickertodate").datepicker("option", "showAnim", $(this).val());
                });
            });
/* 
            function hide() { 
                document.getElementById('dist').disabled = true;
                document.getElementById('datepicker').disabled = true;
                document.getElementById('datepickertodate').disabled = true;
                document.getElementById('state').disabled = true;
                document.getElementById('subscribedby').disabled = true;
                
                document.getElementById('distcompls').disabled = true;
                document.getElementById('datepickercompls').disabled = true;
                document.getElementById('datepickertodatecompls').disabled = true;
                document.getElementById('statecompls').disabled = true;
                document.getElementById('subscribedbycompls').disabled = true;
                
                document.getElementById('distcredits').disabled = true;
                document.getElementById('datepickercredits').disabled = true;
                document.getElementById('datepickertodatecredits').disabled = true;
                document.getElementById('statecredits').disabled = true;
                document.getElementById('subscribedbycredits').disabled = true;
            } */
            
            function enabletext()
            {
                if (document.getElementById('checkDistrict').checked === true)
                {

                    document.getElementById('dist').disabled = false;
                    document.getElementById('datepicker').disabled = true;
                    document.getElementById('datepicker').value = "";
                    document.getElementById('datepickertodate').disabled = true;
                    document.getElementById('datepickertodate').value = "";
                    document.getElementById('checkdate').checked = false;
                    document.getElementById('subscribedby').disabled = true;
                    document.getElementById('subscribedby').value = "";
                    document.getElementById('checkSubscribedby').checked = false;
                    document.getElementById('state').disabled = true;
                    document.getElementById('state').value = "";
                    document.getElementById('checkState').checked = false;
                }
                else {
                    document.getElementById('dist').disabled = true;
                    document.getElementById('dist').value = "";
                }
            }

           
           function enabletextfordate()
            {
                if (document.getElementById('checkdate').checked === true)
                {
                    document.getElementById('datepicker').disabled = false;
                    document.getElementById('datepickertodate').disabled = false;
                    document.getElementById('dist').disabled = true;
                    document.getElementById('subscribedby').disabled = true;
                    document.getElementById('subscribedby').value = "";
                    document.getElementById('checkSubscribedby').checked = false;
                    document.getElementById('state').disabled = true;
                    document.getElementById('state').value = "";
                    document.getElementById('checkState').checked = false;
                    document.getElementById('checkDistrict').checked = false;
                    document.getElementById('dist').disabled = true;
                    document.getElementById('dist').value = "";
                }
                else {
                    document.getElementById('datepicker').disabled = true;
                    document.getElementById('datepicker').value = "";
                    document.getElementById('datepickertodate').disabled = true;
                    document.getElementById('datepickertodate').value = "";
                }
            }
           

            function enabletextforstate()
            {
                if (document.getElementById('checkState').checked === true)
                {

                    document.getElementById('state').disabled = false;
                    document.getElementById('dist').disabled = true;
                    document.getElementById('dist').value = "";
                    document.getElementById('datepicker').disabled = true;
                    document.getElementById('datepicker').value = "";
                    document.getElementById('datepickertodate').disabled = true;
                    document.getElementById('datepickertodate').value = "";
                    document.getElementById('checkDistrict').checked = false;
                    document.getElementById('checkdate').checked = false;
                    document.getElementById('subscribedby').disabled = true;
                    document.getElementById('subscribedby').value = "";
                    document.getElementById('checkSubscribedby').checked = false;
                }
                else {
                    document.getElementById('state').disabled = true;
                    document.getElementById('state').value = "";

                }
            }
            
           

            function enabletextforsubscribedby()
            {
                if (document.getElementById('checkSubscribedby').checked === true)
                {
                    document.getElementById('subscribedby').disabled = false;
                    document.getElementById('state').disabled = true;
                    document.getElementById('state').value = "";
                    document.getElementById('checkState').checked = false;
                    document.getElementById('dist').disabled = true;
                    document.getElementById('dist').value = "";
                    document.getElementById('datepicker').disabled = true;
                    document.getElementById('datepicker').value = "";
                    document.getElementById('datepickertodate').disabled = true;
                    document.getElementById('datepickertodate').value = "";
                    document.getElementById('checkDistrict').checked = false;
                    document.getElementById('checkdate').checked = false;
                }
                else {
                    document.getElementById('subscribedby').disabled = true;
                    document.getElementById('subscribedby').value = "";

                }
            }

            function dropdowndist() {

                var distlistitem = document.getElementById("dist");
                var district = distlistitem.options[distlistitem.selectedIndex].text;


                if (district === "") {
                    document.getElementById("dist").style.display = "none";

                } else {

                    var form1 = document.getElementById("form1");

                    form1.action = "Controller?process=Search&action=searchby&criteria=" + district;
                    form1.submit();
                }


            }
            
            function dropdowndistcompls() {

                var distlistitemcompls = document.getElementById("distComplS");
                var districtComplS = distlistitemcompls.options[distlistitemcompls.selectedIndex].text;


                if (districtComplS === "") {
                    document.getElementById("distComplS").style.display = "none";

                } else {

                    var form1 = document.getElementById("form1");

                    form1.action = "Controller?process=Search&action=searchforcompls&criteria=" + districtComplS;
                    form1.submit();
                }


            }
            
            function dropdowndistcredits() {

                var distlistitem = document.getElementById("distCreditS");
                var district = distlistitem.options[distlistitem.selectedIndex].text;


                if (district === "") {
                    document.getElementById("distCreditS").style.display = "none";

                } else {

                    var form1 = document.getElementById("form1");

                    form1.action = "Controller?process=Search&action=searchbycredits&criteria=" + district;
                    form1.submit();
                }


            }

            function dropdownstate() {

                var distlistitem = document.getElementById("state");
                var state = distlistitem.options[distlistitem.selectedIndex].text;


                if (state === "") {
                    document.getElementById("state").style.display = "none";

                } else {

                    var form1 = document.getElementById("form1");
                    form1.action = "Controller?process=Search&action=searchby&criteria=" + state;
                    form1.submit();
                }


            }
            
             function dropdownstatecredits() {

                var distlistitem = document.getElementById("stateCreditS");
                var state = distlistitem.options[distlistitem.selectedIndex].text;


                if (state === "") {
                    document.getElementById("stateCreditS").style.display = "none";

                } else {

                    var form1 = document.getElementById("form1");
                    form1.action = "Controller?process=Search&action=searchbycredits&criteria=" + state;
                    form1.submit();
                }


            }
            
            function dropdownstatecompls() {

                var distlistitem = document.getElementById("stateComplS");
                var state = distlistitem.options[distlistitem.selectedIndex].text;


                if (stateComplS === "") {
                    document.getElementById("state").style.display = "none";

                } else {

                    var form1 = document.getElementById("form1");
                    form1.action = "Controller?process=Search&action=searchforcomplsstate&criteria=" + state;
                    form1.submit();
                }


            }

            function dropdownsubscribedby() {

                var distlistitem = document.getElementById("subscribedby");
                var subscribedby = distlistitem.options[distlistitem.selectedIndex].text;


                if (subscribedby === "") {
                    document.getElementById("state").style.display = "none";

                } else {

                    var form1 = document.getElementById("form1");
                    form1.action = "Controller?process=Search&action=searchby&criteria=" + subscribedby;
                    form1.submit();
                }


            }
            
            function dropdownsubscribedbycredits() {

                var distlistitem = document.getElementById("subscribedbyCreditS");
                var subscribedby = distlistitem.options[distlistitem.selectedIndex].text;


                if (subscribedby === "") {
                    document.getElementById("state").style.display = "none";

                } else {

                    var form1 = document.getElementById("form1");
                    form1.action = "Controller?process=Search&action=searchbycredits&criteria=" + subscribedby;
                    form1.submit();
                }


            }


            function dropdownsubscribedbycompls() {

                var distlistitem = document.getElementById("subscribedbyComplS");
                var subscribedby = distlistitem.options[distlistitem.selectedIndex].text;


                if (subscribedbyComplS === "") {
                    document.getElementById("subscribedbyComplS").style.display = "none";

                } else {

                    var form1 = document.getElementById("form1");
                    form1.action = "Controller?process=Search&action=searchforcomplssubscribedby&criteria=" + subscribedby;
                    form1.submit();
                }
            }

        </script>
        
        <script type="text/javascript">

            function searchBetweenDates() {

                var form1 = document.getElementById("form1");
                form1.action = "Controller?process=Search&action=searchbydates";
                form1.submit();

            }
            
            function searchBetweenDatesCreditS() {

                var form1 = document.getElementById("form1");
                form1.action = "Controller?process=Search&action=searchbydatescredits";
                form1.submit();

            }
            function searchBetweenDatesComplS() {

                var form1 = document.getElementById("form1");
                form1.action = "Controller?process=Search&action=searchbydatescompls";
                form1.submit();

            }

            function searchBetweenDates1() {
                alert("In search between dates");
                var fromdate = document.getElementById("datepicker");
                var todate = document.getElementById("datepickertodate");
                var fromDate = fromdate.options[fromdate.selectedIndex].text;
                var toDate = todate.options[todate.selectedIndex].text;

                if (fromDate === "") {
                    document.getElementById("datepicker").style.display = "none";
                    document.getElementById("datepickertodate").style.display = "none";

                } else {
                    alert("In else of search between dates")
                    var form1 = document.getElementById("form1");

                    form1.action = "Controller?process=Search&action=searchbydates";
                    form1.submit();
                }
            }

            function Cancel() {
                var form1 = document.getElementById("form1");
                form1.action = "Controller?process=PersonalProcess&action=print";
                form1.submit();
            }

            function validateEmptyField(elementName) {

                var txtBox = document.getElementById(elementName);


                if (txtBox.value == "") {

                    txtBox.className = "emptyFieldSet";


                }
                else if (txtBox.value != "") {
                    txtBox.className = "textField";

                }


            }
            function notEmptyField(elementName) {
                alert(elementName);
                var txtBox = document.getElementById(elementName);
                if (txtBox.value != "") {
                    txtBox.className = "textField";

                }
                else if (txtBox.value == "") {
                    txtBox.className = "emptyFieldSet";

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
    <body class="sb-nav-fixed" onload="hide()">
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
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                		 <form id="form1"  method="post">
            					
            					<%java.text.DateFormat df = new java.text.SimpleDateFormat("MM/dd/yyyy");%>
            					
							<div class="container mt-3">
								  <br>
								  <!-- Nav tabs -->
								  <ul class="nav nav-tabs">
								    <li class="nav-item">
								      <a class="nav-link active" data-toggle="tab" href="#home">Advance Search For Subscribers</a>
								    </li>
								    <li class="nav-item">
								      <a class="nav-link" data-toggle="tab" href="#menu1">Advance Search For Comp.Subscribers</a>
								    </li>
								    <li class="nav-item">
								      <a class="nav-link" data-toggle="tab" href="#menu2">Advance Search For Credit Subscribers</a>
								    </li>
								  </ul>
								
								  <!-- Tab panes -->
								  <div class="tab-content">
								    
								    <div id="home" class="container tab-pane active"><br>
								     
                        <table width="100%" border="0" align="center"  id="table1">

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            

                            <tr>
                                <td width="16%"  class="alignRight" >
                                   <!--  <input type="checkbox" id="checkDistrict" onclick="enabletext()"> -->
                                    District &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>

                                <td width="28%">
                                    <label>
                                        <select name="dist" id="dist" style="width: 300px"  onchange="dropdowndist()">
                                            	<option selected></option>
	                                            <c:forEach items="${DistList}" var="dist">
	                                                <option><c:out value="${dist.name}"/></option>
	                                            </c:forEach>
                                        </select>
                                    </label>
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

                                <td  class="alignRight" > <!-- <input type="checkbox" id="checkdate" onclick="enabletextfordate()"> -->
                                    From Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td  >
                                    <label>
                                        <input name="fromdate" type="date" style="width: 300px" class="textField">
                                    </label>
                                </td>

                                <td width="10%" class="alignRight" >To Date &nbsp;
                                </td>
                                <td width="10%">
                                    <label>
                                        <input name="todate" type="date"  style="width: 300px" class="textField">
                                    </label>
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


                                <td width="16%"  class="alignRight" ><!-- <input type="checkbox" id="checkState" onclick="enabletextforstate()" > -->
                                    State &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>

                                <td>
                                    <label>

                                        <select name="state" id="state" style="width: 300px" onchange="dropdownstate()">
                                            <option selected></option>
                                            <option>Andaman and Nicobar Islands</option>
                                            <option>Andhra Pradesh</option>
                                            <option>Arunachal Pradesh</option>
                                            <option>Assam</option>
                                            <option>Bihar</option>
                                            <option>Chandigarh</option>
                                            <option>Chhattisgarh</option>
                                            <option>Dadra and Nagar Haveli</option>
                                            <option>Daman and Diu</option>
                                            <option>Delhi</option>
                                            <option>Goa</option>
                                            <option>Gujarat</option>
                                            <option>Haryana</option>
                                            <option>Himachal Pradesh</option>
                                            <option>Jammu and Kashmir</option>
                                            <option>Jharkhand</option>
                                            <option>Karnataka</option>
                                            <option>Kerala</option>
                                            <option>Lakshadweep</option>
                                            <option>Madhya Pradesh</option>
                                            <option>Maharashtra</option>
                                            <option>Manipur</option>
                                            <option>Meghalaya</option>
                                            <option>Mizoram</option>
                                            <option>Nagaland</option>
                                            <option>Odisha</option>
                                            <option>Puducherry</option>
                                            <option>Punjab</option>
                                            <option>Rajasthan</option>
                                            <option>Sikkim</option>
                                            <option>Tamil Nadu</option>
                                            <option>Tripura</option>
                                            <option>Uttar Pradesh</option>
                                            <option>Uttarakhand</option>
                                            <option>West Bengal</option>

                                        </select>

                                    </label>
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


                                <td width="16%"   
                                    class="alignRight" ><!-- <input type="checkbox" id="checkSubscribedby" onclick="enabletextforsubscribedby()" > -->
                                    Subscribed By &nbsp;  </td>

                                <td>
                                    <label>

                                        <select name="subscribedby" id="subscribedby" style="width: 300px" onchange="dropdownsubscribedby()">
                                            <option selected></option>

                                            <c:forEach items="${ExecutiveListAll}" var="executiveName">

                                                <option><c:out value="${executiveName.name}"/></option>


                                            </c:forEach>

                                        </select>

                                    </label>
                                </td>

                            </tr>

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
						</table>

                            <div >
                                <table width="100%" >
                                    <tr>

                                        <td>
                                            <br/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">

                                            <button id="save" class="btn btn-success">Search</button>

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button id="cancel" class="btn btn-warning">Cancel</button>

                                        </td>


                                    </tr>
                                </table>

                            </div>
								    </div>
								    
								    <div id="menu1" class="container tab-pane fade"><br>
					                        
					                        <table width="100%" border="0" align="center"  id="table2">
					
					                            <tr>
					                                <td>
					                                    <br/>
					                                </td>
					                            </tr>
					
					                            <tr>
					
					                               <td width="16%"  class="alignRight" >
					                                  <!-- <input type="checkbox" id="checkDistrictComplS" onclick="enabletextcompls()"  > -->
					                                    District &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td> 
					
					                                <td width="28%"  >
					                                    <label>
					
					                                        <select name="dist" id="distComplS" style="width: 300px"  onchange="dropdowndistcompls()">
					                                            <option selected></option>
					
					                                            <c:forEach items="${DistList}" var="dist">
					
					                                                <option><c:out value="${dist.name}"/></option>
					
					
					                                            </c:forEach>
					
					                                        </select>
					
					                                    </label>
					
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
					
					                                <td  class="alignRight" > 
					                                	<!-- <input type="checkbox" id="checkdateComplS" onclick="enabletextfordate()"  > -->
					                                    From Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                                </td>
					                                <td  >
					                                    <label>
					                                    	<input name="fromdatecompls" type="date" style="width: 300px" class="textField">
					                                    </label>
					                                </td>
					
					                                <td width="10%" class="alignRight" >To Date &nbsp;
					                                </td>
					                                <td width="10%"  >
					                                    <label>
					                                    	<input name="todatecompls" type="date" style="width: 300px" class="textField">
					                                    </label>
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
					
					
					                                <td width="16%"  class="alignRight" >
					                                	<!-- <input type="checkbox" id="checkStateComplS" onclick="enabletextforstatecompls()" > -->   
					                                    State &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>
					
					                                <td>
					                                    <label>
					
					                                        <select name="stateComplS" id="stateComplS" style="width: 300px" onchange="dropdownstatecompls()">
					                                            <option selected></option>
					                                            <option>Andaman and Nicobar Islands</option>
					                                            <option>Andhra Pradesh</option>
					                                            <option>Arunachal Pradesh</option>
					                                            <option>Assam</option>
					                                            <option>Bihar</option>
					                                            <option>Chandigarh</option>
					                                            <option>Chhattisgarh</option>
					                                            <option>Dadra and Nagar Haveli</option>
					                                            <option>Daman and Diu</option>
					                                            <option>Delhi</option>
					                                            <option>Goa</option>
					                                            <option>Gujarat</option>
					                                            <option>Haryana</option>
					                                            <option>Himachal Pradesh</option>
					                                            <option>Jammu and Kashmir</option>
					                                            <option>Jharkhand</option>
					                                            <option>Karnataka</option>
					                                            <option>Kerala</option>
					                                            <option>Lakshadweep</option>
					                                            <option>Madhya Pradesh</option>
					                                            <option>Maharashtra</option>
					                                            <option>Manipur</option>
					                                            <option>Meghalaya</option>
					                                            <option>Mizoram</option>
					                                            <option>Nagaland</option>
					                                            <option>Odisha</option>
					                                            <option>Puducherry</option>
					                                            <option>Punjab</option>
					                                            <option>Rajasthan</option>
					                                            <option>Sikkim</option>
					                                            <option>Tamil Nadu</option>
					                                            <option>Tripura</option>
					                                            <option>Uttar Pradesh</option>
					                                            <option>Uttarakhand</option>
					                                            <option>West Bengal</option>
					
					                                        </select>
					
					                                    </label>
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
					
					
					                                <td width="16%" class="alignRight" >
					                                    <!-- <input type="checkbox" id="checkSubscribedbyComplS" onclick="enabletextforsubscribedby()" > -->
					                                    Subscribed By &nbsp;  </td>
					
					                                <td>
					                                    <label>
					
					                                        <select name="subscribedby" id="subscribedbyComplS" style="width: 300px"  onchange="dropdownsubscribedbycompls()">
					                                            <option selected></option>
					
					                                            <c:forEach items="${ExecutiveListAll}" var="executiveName">
					
					                                                <option><c:out value="${executiveName.name}"/></option>
					
					
					                                            </c:forEach>
					
					                                        </select>
					
					                                    </label>
					                                </td>
					
					                            </tr>
					
					                            <tr>
					                                <td>
					                                    <br/>
					                                </td>
					                            </tr>
											</table>
					
					                            <div >
					                                <table width="100%" >
					                                    <tr>
					
					                                        <td>
					                                            <br/>
					                                        </td>
					                                    </tr>
					                                    <tr>
					                                        <td align="center">
					                                            <button id="searchcompls" class="btn btn-success">Search</button>
					                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                                            <button id="cancelcompls" class="btn btn-warning">Cancel</button>
					                                        </td>
					                                    </tr>
					                                </table>
					                            </div>
								   </div>
								    
							<div id="menu2" class="container tab-pane fade"><br>
							
			                        <table width="100%" border="0" align="center"  id="table3">
			
			                            <tr>
			                                <td>
			                                    <br/>
			                                </td>
			                            </tr>
			
			
			                            <tr>
			                               <td width="16%"  class="alignRight" >
			                                  <!-- <input type="checkbox" id="checkDistrictComplS" onclick="enabletextcompls()"  > -->
			                                    District &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td> 
			
			                                <td width="28%"  >
			                                    <label>
			
			                                        <select name="distcredit" id="distCreditS" style="width: 300px"  onchange="dropdowndistcredits()">
			                                            <option selected></option>
			
			                                            <c:forEach items="${DistList}" var="dist">
			
			                                                <option><c:out value="${dist.name}"/></option>
			
			
			                                            </c:forEach>
			
			                                        </select>
			
			                                    </label>
			
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
			
			                                <td  class="alignRight" > 
			                                	<!-- <input type="checkbox" id="checkdateComplS" onclick="enabletextfordate()"> -->
			                                    From Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                                </td>
			                                <td  >
			                                    <label>
			                                    	<input name="fromdatecredits" type="date" style="width: 300px" class="textField">
			                                    </label>
			                                </td>
			
			                                <td width="10%" class="alignRight" >To Date &nbsp;
			                                </td>
			                                <td width="10%"  >
			                                    <label>
			                                    	<input name="todatecredits" type="date" style="width: 300px" class="textField">
			                                    </label>
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
			
			
			                                <td width="16%"  class="alignRight" >
			                                	<!-- <input type="checkbox" id="checkStateComplS" onclick="enabletextforstatecompls()" > -->   
			                                    State &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>
			
			                                <td>
			                                    <label>
			
			                                        <select name="stateCreditS" id="stateCreditS" style="width: 300px" onchange="dropdownstatecredits()">
			                                            <option selected></option>
			                                            <option>Andaman and Nicobar Islands</option>
			                                            <option>Andhra Pradesh</option>
			                                            <option>Arunachal Pradesh</option>
			                                            <option>Assam</option>
			                                            <option>Bihar</option>
			                                            <option>Chandigarh</option>
			                                            <option>Chhattisgarh</option>
			                                            <option>Dadra and Nagar Haveli</option>
			                                            <option>Daman and Diu</option>
			                                            <option>Delhi</option>
			                                            <option>Goa</option>
			                                            <option>Gujarat</option>
			                                            <option>Haryana</option>
			                                            <option>Himachal Pradesh</option>
			                                            <option>Jammu and Kashmir</option>
			                                            <option>Jharkhand</option>
			                                            <option>Karnataka</option>
			                                            <option>Kerala</option>
			                                            <option>Lakshadweep</option>
			                                            <option>Madhya Pradesh</option>
			                                            <option>Maharashtra</option>
			                                            <option>Manipur</option>
			                                            <option>Meghalaya</option>
			                                            <option>Mizoram</option>
			                                            <option>Nagaland</option>
			                                            <option>Odisha</option>
			                                            <option>Puducherry</option>
			                                            <option>Punjab</option>
			                                            <option>Rajasthan</option>
			                                            <option>Sikkim</option>
			                                            <option>Tamil Nadu</option>
			                                            <option>Tripura</option>
			                                            <option>Uttar Pradesh</option>
			                                            <option>Uttarakhand</option>
			                                            <option>West Bengal</option>
			
			                                        </select>
			
			                                    </label>
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
			
			
			                                <td width="16%"   
			                                    class="alignRight" >
			                                    <!-- <input type="checkbox" id="checkSubscribedbyComplS" onclick="enabletextforsubscribedby()" > -->
			                                    Subscribed By &nbsp;  </td>
			
			                                <td>
			                                    <label>
			
			                                        <select name="subscribedby" id="subscribedbyCreditS" style="width: 300px"  onchange="dropdownsubscribedbycredits()">
			                                            <option selected></option>
			
			                                            <c:forEach items="${ExecutiveListAll}" var="executiveName">
			
			                                                <option><c:out value="${executiveName.name}"/></option>
			
			
			                                            </c:forEach>
			
			                                        </select>
			
			                                    </label>
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

                                            <button id="searchcredits" class="btn btn-success">Search</button>

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button id="cancelcredits" class="btn btn-warning">Cancel</button>

                                        </td>
                                    </tr>
                                </table>
                            </div>
								    </div>
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
        
        
    </body>
    
</html>


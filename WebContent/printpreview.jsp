<%-- 
    Document   : printpreview
    Created on : Jan 4, 2013, 4:39:24 PM
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
        <title>Print Preview</title>
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
        
        <style type="text/css">

        @media print {
            .fontsize { font-size: 12px ;
                        font-weight: bold;
                        font-family: 'Times New Roman';
                        
                        
            }
            .header,.hide { visibility: hidden }
            .bodymargin{
                margin-left: 0px ;
                margin-right: 0px;
            }
            
        }
        
        @page {
              
             margin-left:  7mm;
             margin-right: 7mm;
             margin-bottom: 14mm;
             margin-top: 14mm;
        }

        @media screen {
            .fontsize { font-size: 12px;
                        font-weight: bold;
                        font-family: 'Times New Roman'
            }
            .bodymargin{
                margin-left: 0px ;
                margin-right: 0px;
            }
        }
    </style>
    
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
            <a class="navbar-brand" href="#"><img src="images/dawat.jpg" height="50" width="200"></a>
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
                <form action="Controller?process=PersonalProcess&action=printAddress" method="post" id="form1" class="bodymargin" target="_blank">

           
            <div>

                <table border="0">
                        <c:set var="iInitial" value="${iInitial}"/>
                        <c:set var="limit" value="1"/>
                        
                    <c:forEach begin="1" end="${endValue}">
                        <%!                        
                            int i = 1;
                        %>

                        <tr>
                            <c:if test="${limit < iInitial}">
                            <td class="fontsize" ><textarea class="fontsize"  style="width:240px;height:115px;padding: 12px 20px;padding: 12px 20px;">To,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out default="" value="${currentissue.currentissue}" />-<%= request.getSession().getAttribute("personaltoissueno"+i+"") %>/<%= request.getSession().getAttribute("personalpid"+i+"") %>&#13;&#10;<%= request.getSession().getAttribute("personalName" + i + "")%>&#13;&#10;<%= request.getSession().getAttribute("personaladdressline1" + i + "")%></textarea> </td>
                            </c:if>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <c:set var="limit" value="${limit+1}"/>
                            <% i = i + 1;%>
                            <c:if test="${limit < iInitial}">
                            <td  class="fontsize"><textarea class="fontsize"   style="width:240px;height:115px;padding: 12px 20px;">To,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out default="" value="${currentissue.currentissue}" />-<%= request.getSession().getAttribute("personaltoissueno"+i+"") %>/<%= request.getSession().getAttribute("personalpid"+i+"") %>&#13;&#10;<%= request.getSession().getAttribute("personalName" + i + "")%>&#13;&#10;<%= request.getSession().getAttribute("personaladdressline1" + i + "")%></textarea> </td>
                            </c:if>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <c:set var="limit" value="${limit+1}"/>
                            <% i = i + 1;%>
                            <c:if test="${limit < iInitial}">
                            <td  class="fontsize"><textarea class="fontsize"   style="width:240px;height:115px;padding: 12px 20px;">To,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out default="" value="${currentissue.currentissue}" />-<%= request.getSession().getAttribute("personaltoissueno"+i+"") %>/<%= request.getSession().getAttribute("personalpid"+i+"") %>&#13;&#10;<%= request.getSession().getAttribute("personalName" + i + "")%>&#13;&#10;<%= request.getSession().getAttribute("personaladdressline1" + i + "")%></textarea> </td>
                            </c:if>
                        </tr>
                        <% i = i + 1;%>
                        <c:set var="limit" value="${limit+1}"/>
                        
                    </c:forEach>
                    <% i = 1;%>
                    <c:set var="iInitial" value="1"/>
                        <c:set var="limit" value="1"/>
                </table>

                <table  width="70%"  id="table11" align="left">
                    <tr>
                        	  <td width="30%"> 

                        	</td>
                      		  <td>
                      		  
                      		  			<button id="print" class="btn btn-success" type="submit"><i class="fas fa-print"></i>&nbsp;Print</button>
                      		  		<!-- <button id="print" type="submit"  onclick="window.print();
                                    this.style.visibility = 'hidden', loading.style.visibility = 'visible'" class="hide">
                                    
                                    <i class="fas fa-print"></i>&nbsp;Print
                                    </button>  -->
                      		     <!-- <button value="print" class="btn btn-success hide-me" onclick="window.print();this.style.visibility = 'hidden', loading.style.visibility = 'visible'" class="hide" type="submit" id="print"><i class="fas fa-print"></i>&nbsp;Print</button> --> 
                  		      </td>

                		    </tr>

             			   </table>

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
        
        <script>
			    $(function(){
			
			        //button select all or cancel
			        $("#select-all").click(function () {
			            var all = $("input.select-all")[0];
			            all.checked = !all.checked
			            var checked = all.checked;
			            $("input.select-item").each(function (index,item) {
			                item.checked = checked;
			            });
			        });
			
			        //button select invert
			        $("#select-invert").click(function () {
			            $("input.select-item").each(function (index,item) {
			                item.checked = !item.checked;
			            });
			            checkSelected();
			        });
			
			        //button get selected info
			        $("#selected").click(function () {
			            var items=[];
			            $("input.select-item:checked:checked").each(function (index,item) {
			                items[index] = item.value;
			            });
			            if (items.length < 1) {
			                alert("no selected items!!!");
			            }else {
			                var values = items.join(',');
			                console.log(values);
			                var html = $("<div></div>");
			                html.html("selected:"+values);
			                html.appendTo("body");
			            }
			        });
			
			        //column checkbox select all or cancel
			        $("input.select-all").click(function () {
			            var checked = this.checked;
			            $("input.select-item").each(function (index,item) {
			                item.checked = checked;
			            });
			        });
			
			        //check selected items
			        $("input.select-item").click(function () {
			            var checked = this.checked;
			            console.log(checked);
			            checkSelected();
			        });
			
			        //check is all selected
			        function checkSelected() {
			            var all = $("input.select-all")[0];
			            var total = $("input.select-item").length;
			            var len = $("input.select-item:checked:checked").length;
			            console.log("total:"+total);
			            console.log("len:"+len);
			            all.checked = len===total;
			        }
			    });
		</script>
    </body>
    
</html>


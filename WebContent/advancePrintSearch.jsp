<%-- 
    Document   : addcontact
    Created on : Jun 17, 2013, 4:17:40 PM
    Author     : CPEDUR1P5
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%@page import="java.util.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advance Search for print</title>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/validation/jquery.ketchup.css">

        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script src="js/datePicker/jquery-1.7.1.js"></script>
        <script src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script src="js/datePicker/ui/jquery.ui.tabs.js"></script>
        <script src="js/datePicker/ui/sliderAccess.js"></script>
        <script src="js/datePicker/ui/jquery-ui-timepicker-addon.js"></script>
        <script src="js/validation/jquery.ketchup.all.min.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        <link rel="stylesheet" href="css/datePicker/demos.css">





        <style type="text/css">

            .headerSearch{
                font-size: 18px;
                font-weight: bold;

            }

            .myclass{
                border-top-style: solid;
                border-right-style: solid;
                border-bottom-style: solid;
                border-left-style: solid;
                border-top-color: #5d7e9b;
                border-right-color: #5d7e9b;
                border-bottom-color: #5d7e9b;
                border-left-color: #5d7e9b;
                border-top-width: 1px;
                border-right-width: 1px;
                border-bottom-width: 1px;
                border-left-width: 1px;
                width: auto;
                height: auto;
                color: black;
                text-transform:capitalize;
            }
            <!--
            .divCSS{
                overflow:  scroll;
                height: 100%;
                width: 100%;
            }

            .fiedlSet {
                border-top-width: 1px;
                border-right-width: 1px;
                border-bottom-width: 1px;
                border-left-width: 1px;
                border-top-style: solid;
                border-right-style: solid;
                border-bottom-style: solid;
                border-left-style: solid;
                border-width: 1;
                width: 100%;
                color: #000000;
                font-size: 16px;
                font-weight: bold;
                font-variant: normal;
                font-stretch: wider;
                background-color: #e2ebf3;
                border-top-color: #5d7e9b;
                border-right-color: #5d7e9b;
                border-bottom-color: #5d7e9b;
                border-left-color: #5d7e9b;
            }
            .legendCSS {
                color: #666666;
            }
            .tableCSS {
                width: 100%;
                height: 100%;
                position: absolute;
                left: 0px;
                top: 0px;
            }
            .textAreaCSS {
                height: auto;
                width: auto;
            }
            .textField {
                border-top-style: solid;
                border-right-style: solid;
                border-bottom-style: solid;
                border-left-style: solid;
                border-top-color: #5d7e9b;
                border-right-color: #5d7e9b;
                border-bottom-color: #5d7e9b;
                border-left-color: #5d7e9b;
                border-top-width: 1px;
                border-right-width: 1px;
                border-bottom-width: 1px;
                border-left-width: 1px;


            }
            .alignRight {
                font-family: Tahoma;
                font-size: 12px;
                font-style: normal;
                text-transform: capitalize;
                color: #325F6D;
                text-align: right;
                vertical-align: middle;
                font-weight: bold;
            }

            .alignRightHead {
                font-family: Tahoma;
                font-size: 12px;
                font-style: normal;
                text-transform: capitalize;
                color: #325F6D;


                font-weight: bold;
            }



            .alignRightMultiple {
                font-family: Tahoma;
                font-size: 11px;
                font-weight: bolder;
                text-align: right;
                vertical-align: middle;
                font-style: normal;
                color: #325F6D;
            }
            .alignCentreMultiple {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                font-weight: bolder;
                text-align: center;
                vertical-align: middle;
                font-style: normal;
                color: #000000;
            }
            .autoAdjust {
                height: auto;
                width: auto;
            }
            .radioSpanCSS {
                font-size: 12px;
                font-family: Arial, Helvetica, sans-serif;
                text-align: left;
                vertical-align: middle;
            }
            .radioCSS {
                background-position: left center;
            }
            .spanText {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                font-weight: bold;
                color: #000000;
            }
            .emptyFieldSet {
                border-top-color: #FA7676;
                border-right-color: #FA7676;
                border-bottom-color: #FA7676;
                border-left-color: #FA7676;
                border-top-style: solid;
                border-right-style: solid;
                border-bottom-style: solid;
                border-left-style: solid;
                border-top-width: thin;
                border-right-width: thin;
                border-bottom-width: thin;
                border-left-width: thin;
                background-image: url(images/close.JPG);
                background-repeat: repeat-y;
                background-attachment: scroll;
                background-position: right;
                width: auto;
                height: auto;
                display: inline;
            }
            .style1 {
                font-family: Tahoma;
                font-size: 14px;
            }
            .style2 {
                color: #666666;
                font-family: Tahoma;
                font-size: 14px;
            }
            .style4 {
                font-size: 12px;
                font-family: Tahoma;
                text-align: left;
                vertical-align: middle;
                color: #325f6d;
            }



            -->

            .alignRight1 {
                font-family: Tahoma;
                font-size: 15px;
                font-style: normal;
                text-transform: capitalize;
                color: #325F6D;
                text-align: right;
                vertical-align: middle;
                font-weight: bold;
            }
        </style>


        <script type="text/javascript" src="js/datetimepicker_css.js"></script>
        <script src="JavaScript/actb.js"></script>
        <script src="JavaScript/common.js"></script>




        <script>
            $(function() {
                $("#datepicker").datepicker({changeYear: true, changeMonth: true});
                $("#anim").change(function() {
                    $("#datepicker").datepicker("option", "showAnim", $(this).val());
                });
                 $("#datepickercredits").datepicker({changeYear: true, changeMonth: true});
                $("#anim").change(function() {
                    $("#datepickercredits").datepicker("option", "showAnim", $(this).val());
                });
                 $("#datepickercredittodate").datepicker({changeYear: true, changeMonth: true});
                $("#anim").change(function() {
                    $("#datepickercredittodate").datepicker("option", "showAnim", $(this).val());
                });
                $("#datepickercompls").datepicker({changeYear: true, changeMonth: true});
                $("#anim").change(function() {
                    $("#datepickercompls").datepicker("option", "showAnim", $(this).val());
                });
                 $("#datepickercomplstodate").datepicker({changeYear: true, changeMonth: true});
                $("#anim").change(function() {
                    $("#datepickercomplstodate").datepicker("option", "showAnim", $(this).val());
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



            function validateFormNum(obj)
            {
                document.getElementById("formNo").style.background = 'white';

                reg = /[^0-9]/g;
                obj.value = obj.value.replace(reg, "");
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
                $("#tabs").tabs();

            });
        </script>

        <script type="text/javascript">
            function check(value) {

                xmlHttp = GetXmlHttpObject()
                var url = "check.jsp";
                url = url + "?name=" + value;
                xmlHttp.onreadystatechange = stateChanged
                xmlHttp.open("GET", url, true)
                xmlHttp.send(null)
            }
            function stateChanged() {
                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                    var showdata = xmlHttp.responseText;
                    document.getElementById("mydiv").innerHTML = showdata;
                }
            }
            function GetXmlHttpObject() {
                var xmlHttp = null;
                try {
                    xmlHttp = new XMLHttpRequest();
                }
                catch (e) {
                    try {
                        xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                    }
                    catch (e) {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                }
                return xmlHttp;
            }
        </script>

        <script type="text/javascript">
            function checkmobile(value) {

                xmlHttp = GetXmlHttpObject()
                var url = "mobilecheck.jsp";
                url = url + "?contactNO=" + value;
                xmlHttp.onreadystatechange = stateChangedmobile
                xmlHttp.open("GET", url, true)
                xmlHttp.send(null)
            }
            function stateChangedmobile() {

                if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                    var showdata = xmlHttp.responseText;
                    document.getElementById("mydivmobile").innerHTML = showdata;
                }
            }
            function GetXmlHttpObject() {
                var xmlHttp = null;
                try {
                    xmlHttp = new XMLHttpRequest();
                }
                catch (e) {
                    try {
                        xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                    }
                    catch (e) {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                }
                return xmlHttp;
            }
        </script>
        <script>
            $(function() {
                $("#datepickertodate").datepicker({changeYear: true, changeMonth: true});
                $("#anim").change(function() {
                    $("#datepickertodate").datepicker("option", "showAnim", $(this).val());
                });
            });

            function hide() {
                
                document.getElementById('dist').disabled = true;
                document.getElementById('datepicker').disabled = true;
                document.getElementById('datepickertodate').disabled = true;
                document.getElementById('state').disabled = true;
                document.getElementById('subscribedby').disabled = true;
                
                

            }
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
    </head>
    <body onload="hide()" ><form id="form1"  action="Controller?process=PersonalProcess&action=add" method="post"  >
            <%java.text.DateFormat df = new java.text.SimpleDateFormat("MM/dd/yyyy");%>

            <div >
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">Advance Search For Subscribers</a></li>
                        <li><a href="#tabs-2" >Advance Search For compl.Subscribers</a></li>
                        <li><a href="#tabs-3" >Advance Search For Credit Subscribers</a></li>
                    </ul>



                    <div id="tabs-1">
                        <table width="100%" border="0" align="center"  id="table1">

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>





                            <tr>
                                <td width="30%"  class="alignRight1" >Search for Subscribers By: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>



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
                                    <input type="checkbox" id="checkDistrict" onclick="enabletext()"  >
                                    District &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>

                                <td width="28%"  >
                                    <label>

                                        <select name="dist" id="dist" style="width: 230px"  onchange="dropdowndist()">
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

                                <td  class="alignRight" > <input type="checkbox" id="checkdate" onclick="enabletextfordate()"  >
                                    From Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td  >
                                    <label>
                                        <input name="fromdate" type="text"  class="textField" id="datepicker"  size="36" onblur="CalculateAge(this)" data-validate="validate(required)" >
                                    </label>
                                </td>

                                <td width="10%" class="alignRight" >To Date &nbsp;
                                </td>
                                <td width="10%"  >
                                    <label>
                                        <input name="todate" type="text" class="textField" id="datepickertodate"  size="36" onblur="CalculateAge(this)" data-validate="validate(required)" >
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


                                <td width="16%"  class="alignRight" ><input type="checkbox" id="checkState" onclick="enabletextforstate()" >
                                    State &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>

                                <td>
                                    <label>

                                        <select name="state" id="state" style="width: 230px" onchange="dropdownstate()">
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
                                    class="alignRight" ><input type="checkbox" id="checkSubscribedby" onclick="enabletextforsubscribedby()" >
                                    Subscribed By &nbsp;  </td>

                                <td>
                                    <label>

                                        <select name="subscribedby" id="subscribedby" style="width: 230px"  onchange="dropdownsubscribedby()">
                                            <option selected></option>

                                            <c:forEach items="${ExecutiveList}" var="executiveName">

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


                            <div >
                                <table width="100%" >
                                    <tr>

                                        <td>
                                            <br/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">

                                            <button id="save" >Search</button>

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button id="cancel" >Cancel</button>

                                        </td>


                                    </tr>
                                </table>

                            </div>
                            
                         



                            <div id="tabs-2" >
                        <table width="100%" border="0" align="center"  id="table2">

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>





                            <tr>
                                <td width="30%"  class="alignRight1" >Search for Compl.Subscribers By: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>



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
                                  <!--   <input type="checkbox" id="checkDistrictComplS" onclick="enabletextcompls()"  > -->
                                    District &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td> 

                                <td width="28%"  >
                                    <label>

                                        <select name="dist" id="distComplS" style="width: 230px"  onchange="dropdowndistcompls()">
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

                                <td  class="alignRight" > <!--<input type="checkbox" id="checkdateComplS" onclick="enabletextfordate()"  > -->
                                    From Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td  >
                                    <label>
                                        <input name="fromdatecompls" type="text"  class="textField"  id="datepickercompls"  size="36"  data-validate="validate(required)" >
                                    </label>
                                </td>

                                <td width="10%" class="alignRight" >To Date &nbsp;
                                </td>
                                <td width="10%"  >
                                    <label>
                                        <input name="todatecompls" type="text" class="textField" id="datepickercomplstodate"  size="36"  data-validate="validate(required)" >
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


                                <td width="16%"  class="alignRight" ><!--<input type="checkbox" id="checkStateComplS" onclick="enabletextforstatecompls()" > --->   
                                    State &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>

                                <td>
                                    <label>

                                        <select name="stateComplS" id="stateComplS" style="width: 230px" onchange="dropdownstatecompls()">
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
                                    class="alignRight" ><!--<input type="checkbox" id="checkSubscribedbyComplS" onclick="enabletextforsubscribedby()" > -->
                                    Subscribed By &nbsp;  </td>

                                <td>
                                    <label>

                                        <select name="subscribedby" id="subscribedbyComplS" style="width: 230px"  onchange="dropdownsubscribedbycompls()">
                                            <option selected></option>

                                            <c:forEach items="${ExecutiveList}" var="executiveName">

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


                            <div >
                                <table width="100%" >
                                    <tr>

                                        <td>
                                            <br/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">

                                            <button id="searchcompls" >Search</button>

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button id="cancelcompls" >Cancel</button>

                                        </td>


                                    </tr>
                                </table>

                            </div>
                            
                            <div id="tabs-3" >
                        <table width="100%" border="0" align="center"  id="table3">

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>





                            <tr>
                                <td width="30%"  class="alignRight1" >Search for Credit Subscribers By: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>



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
                                  <!--   <input type="checkbox" id="checkDistrictComplS" onclick="enabletextcompls()"  > -->
                                    District &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td> 

                                <td width="28%"  >
                                    <label>

                                        <select name="distcredit" id="distCreditS" style="width: 230px"  onchange="dropdowndistcredits()">
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

                                <td  class="alignRight" > <!--<input type="checkbox" id="checkdateComplS" onclick="enabletextfordate()"  > -->
                                    From Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td  >
                                    <label>
                                        <input name="fromdatecredits" type="text"  class="textField"  id="datepickercredits"  size="36"  data-validate="validate(required)" >
                                    </label>
                                </td>

                                <td width="10%" class="alignRight" >To Date &nbsp;
                                </td>
                                <td width="10%"  >
                                    <label>
                                        <input name="todatecredits" type="text" class="textField" id="datepickercredittodate"  size="36"  data-validate="validate(required)" >
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


                                <td width="16%"  class="alignRight" ><!--<input type="checkbox" id="checkStateComplS" onclick="enabletextforstatecompls()" > --->   
                                    State &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>

                                <td>
                                    <label>

                                        <select name="stateCreditS" id="stateCreditS" style="width: 230px" onchange="dropdownstatecredits()">
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
                                    class="alignRight" ><!--<input type="checkbox" id="checkSubscribedbyComplS" onclick="enabletextforsubscribedby()" > -->
                                    Subscribed By &nbsp;  </td>

                                <td>
                                    <label>

                                        <select name="subscribedby" id="subscribedbyCreditS" style="width: 230px"  onchange="dropdownsubscribedbycredits()">
                                            <option selected></option>

                                            <c:forEach items="${ExecutiveList}" var="executiveName">

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


                            <div >
                                <table width="100%" >
                                    <tr>

                                        <td>
                                            <br/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">

                                            <button id="searchcredits" >Search</button>

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button id="cancelcredits" >Cancel</button>

                                        </td>


                                    </tr>
                                </table>

                            </div>
                    </div>
                </div>


        </form>
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
    </body>
</html>



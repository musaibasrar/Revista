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
        <title>Add contact Page</title>
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

        </style>

        <script type="text/javascript">

            function dropdown() {
                var listitem = document.getElementById("city");
                var listitemtext = listitem.options[listitem.selectedIndex].text;


                if (listitemtext == "Add New") {
                    document.getElementById("city").style.display = "none";
                    document.getElementById("addcity").style.display = '';
                }
            }


            function dropdowndist() {

                var distlistitem = document.getElementById("dist");
                var distlistitemtext = distlistitem.options[distlistitem.selectedIndex].text;


                if (distlistitemtext == "Add New") {
                    document.getElementById("dist").style.display = "none";
                    document.getElementById("adddist").style.display = '';
                }


            }

            function issues() {

                var distlistitem = document.getElementById("subscriptionfor");
                var distlistitemtext = distlistitem.options[distlistitem.selectedIndex].text;


                if (distlistitemtext == "1 year") {
                    document.getElementById("noofissues").value = "12";
                } else if (distlistitemtext == "3 years") {
                    document.getElementById("noofissues").value = "36";
                } 

            }

            function  calculateIssues() {

                var totalissues = document.getElementById("noofissues").value;
                var fromissues = document.getElementById("fromkmissueno").value;

                var toissues = parseInt(totalissues, 10) + parseInt(fromissues, 10) - 1;
                document.getElementById("tokmissueno").value = toissues;


            }

        </script>




        <script type="text/javascript" src="js/datetimepicker_css.js"></script>

        <script src="JavaScript/actb.js"></script>
        <script src="JavaScript/common.js"></script>




        <script>
            $(function() {
                $("#datepicker").datepicker({changeYear: true, changeMonth: true});
                $("#anim").change(function() {
                    $("#datepicker").datepicker("option", "showAnim", $(this).val());
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


            function validateName()
            {

                if (document.getElementById("name").value.length == 0)

                {
                    document.getElementById("name").style.background = 'red';
                    alert("Enter The Name");
                }



            }


            function validateNameAlpha(obj) {


                document.getElementById("name").style.background = 'white';

                reg = /[^a-z]/g;
                obj.value = obj.value.replace(reg, "");
            }


            function noofissues() {
                var issues = document.getElementById("noofissues");
                var issuestext = issues.options[issues.selectedIndex].text;

                if (issuestext == "1 year") {

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






        <script type="text/javascript">
            $(function() {

                $("#set")
                        .button()
                        .click(function() {
                    addPatientWithAppointment();

                });
                $("#saveAndSetToday")
                        .button()
                        .click(function() {
                    addPatientWithTodaysAppointment();

                });
                $("#save")
                        .button()
                        .click(function() {
                    addContact();


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
    </head>
    <body ><form id="form1"  action="Controller?process=PersonalProcess&action=add" method="post"  >
            <%java.text.DateFormat df = new java.text.SimpleDateFormat("MM/dd/yyyy");%>

            <div >
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">Subscriber's Contact Details</a></li>

                    </ul>



                    <div id="tabs-1">
                        <table width="100%" border="0" align="center"  id="table1">
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
                                    <label>
                                        <input name="subscriber" type="hidden" value="1" class="textField" id="subscriber" size="36"  >
                                    </label>
                                    <br/>
                                </td>
                            </tr>
                            <tr>

                                <td width="30%"  class="alignRight" >
                                    <label>
                                        <font color="red" ><div id="mydiv"></div></font>
                                    </label>    
                                </td>
                                <td width="20%"  class="alignRight"> </td>
                                <td class="alignRight" >

                                    <font color="red"><div id="mydivmobile"></div></font>

                                </td>    
                            </tr>



                            <tr>
                                <td width="30%"  class="alignRight" >Name* &nbsp;  </td>
                                <td width="12%" align="left">
                                    <label>
                                        <input name="name" type="text" class="myclass" id="name" size="36" onblur="validateName();"  onkeyup="check(this.value);">
                                    </label>
                                </td>

                                <td class="alignRight">Contact Number &nbsp;  </td>
                                <td>
                                    <label>
                                        <input name="contactNO" type="text" class="textField" id="contactNO" size="36" onblur="checkmobile(this.value);" onkeypress="return validateContactNum(this);" >
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


                                <td width="16%"  class="alignRight" >Co-Contact No. &nbsp;  </td>

                                <td>
                                    <label>

                                        <input name="cocontactnumber" type="text" class="textField" id="cocontactnumber" size="36" onclick="validateNameContact();" >

                                    </label>
                                </td>



                                <td width="20%" class="alignRight" >E-mail &nbsp;
                                </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="email" type="email" class="textField" id="email" size="36" onclick="validateNameContact();" >
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


                                <td width="16%"  class="alignRight" >Postal Address &nbsp;  </td>

                                <td>
                                    
                                    <label>
                                        <textarea name="addressline1" class="myclass" id="addressline1" cols="35" rows="6" maxlength="220" onclick="validateNameContact();"></textarea> 
                                        <!-- <input name="addressline1" type="text" class="myclass" id="addressline1" size="36"  onclick="validateNameContact();" maxlength="60" > -->

                                    </label>
                                </td>



                                <td width="20%" class="alignRight" >Created Date &nbsp;
                                </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="createddate" type="text" value="<%= df.format(new java.util.Date())%>" class="textField" id="datepicker"  size="36" onblur="CalculateAge(this)" data-validate="validate(required)" >
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


                               <!-- <td width="16%"  class="alignRight" >City &nbsp;  </td>

                                <td>
                                    <label>

                                        <select name="city" id="city" style="width: 200px"  onchange="dropdown()">
                                            <option selected></option>

                                            <%-- <c:forEach items="${CityList}" var="city"> --%>

                                                <option><%--<c:out value="${city.name}"/>--%></option>


                                           <%-- </c:forEach> --%>
                                            <option>Add New</option>
                                        </select>

                                    </label>
                                    <label>
                                        <input name="addcity" type="text" style="display: none;" class="myclass" id="addcity" size="36" maxlength="20"  >
                                    </label>
                                </td> -->



                                <td width="20%" class="alignRight" >District &nbsp;
                                </td>
                                <td width="28%"  >
                                    <label>

                                        <select name="dist" id="dist" style="width: 200px"  onchange="dropdowndist()">
                                            <option selected></option>

                                            <c:forEach items="${DistList}" var="dist">

                                                <option><c:out value="${dist.name}"/></option>


                                            </c:forEach>
                                            <option>Add New</option>
                                        </select>

                                    </label>
                                    <label>
                                        <input name="adddist" type="text" style="display: none;" class="myclass" id="adddist" size="36"  >
                                    </label>
                                </td>
                                
                                <td width="20%" class="alignRight" >Pincode &nbsp;
                                </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="pincode" type="text" class="textField" id="pincode" size="36" onblur="validateNameContact();" onkeypress="return validateContactNum(this);" >

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


                                <td width="16%"  class="alignRight" >State &nbsp;  </td>

                                <td>
                                    <label>

                                        <select name="state" id="state" style="width: 200px" onchange="dropdown()">
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

                                
                                <td width="16%"  class="alignRight" >Subscribed By &nbsp;  </td>

                                <td>
                                    <label>

                                        <select name="subscribedby" id="subscribedby" style="width: 200px"  onchange="dropdown()">
                                            <option selected></option>

                                            <c:forEach items="${ExecutiveList}" var="executiveName">

                                                <option><c:out value="${executiveName.name}"/></option>


                                            </c:forEach>

                                        </select>

                                    </label>
                                </td>

                                
                            </tr>

                            

                           <!-- <tr>


                                <td width="16%"  class="alignRight" >Landmark &nbsp;  </td>

                                <td>
                                    <label>
                                        <input name="landmark" type="text" class="myclass" id="landmark" size="36" onclick="validateNameContact();" >


                                    </label>
                                </td>



                                <td width="20%" class="alignRight" >Created Date &nbsp;
                                </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="createddate" type="text" value="" class="textField" id="datepicker"  size="36" onblur="CalculateAge(this)" data-validate="validate(required)" >
                                    </label>
                                </td>
                            </tr> -->

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


                                <td width="16%"  class="alignRight" >Subscription For &nbsp;  </td>

                                <td>
                                    <label>
                                        <select name="subscriptionfor" id="subscriptionfor" style="width: 200px"  data-validate="validate(required)" onchange="issues()">
                                            <option selected></option>

                                            <option>1 year</option>
                                            <option>2 years</option>
                                            <option>3 years</option>
                                            <option>5 years</option>
                                            <option>Life Time</option>
                                        </select>
                                    </label>
                                </td>



                                <td width="20%" class="alignRight" >Total no. Of Issues &nbsp;
                                </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="noofissues" type="text" class="textField" id="noofissues" size="36" onblur="noofissues();" onkeypress="return validateContactNum(this);" >

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


                                <td width="16%"  class="alignRight" >From KM issue no. &nbsp;  </td>

                                <td width="28%"  >
                                    <label>
                                        <input name="fromkmissueno" type="text" class="textField" id="fromkmissueno" size="36" onblur="noofissues();" onkeyup="return calculateIssues()" >

                                    </label>
                                </td>



                                <td width="20%" class="alignRight" >To KM issues no. &nbsp;
                                </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="tokmissueno" type="text" class="textField" id="tokmissueno" size="36" onblur="noofissues();" onfocus="return calculateIssues()"  >

                                    </label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                        <!--    <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <td width="20%" class="alignRight" >Remarks &nbsp;
                                </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="remarks" type="text" class="textField" id="remarks" size="36" onclick="validateNameContact();" >
                                    </label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>  -->







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

                                            <button id="save" onmouseover="validateNameContact();">Save</button>

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button id="cancel" >Cancel</button>

                                        </td>


                                    </tr>
                                </table>

                            </div>





                    </div>





                </div>


        </form>
        <script type="text/javascript">

            function addContact() {
                var form1 = document.getElementById("form1");
                form1.action = "Controller?process=PersonalProcess&action=AddContact";
                form1.submit();
            }

            function Cancel() {
                var form1 = document.getElementById("form1");
                form1.action = "Controller?process=PersonalProcess&action=ViewAll";
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



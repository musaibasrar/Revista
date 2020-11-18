<%-- 
    Document   : updatemember_1
    Created on : Jan 10, 2013, 3:25:59 PM
    Author     : Musaib
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                width: auto;
                height: auto;
            }
            .alignRight {
                font-family: Tahoma;
                font-size: 11px;
                font-style: normal;
                text-transform: capitalize;
                color: #325F6D;
                text-align: right;
                vertical-align: middle;
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
        <script type="text/javascript" src="js/datetimepicker_css.js"></script>

        <script type="text/javascript">

           
                
                
            document.getElementById("UpdateExecutive").style.display='none';
            

           
        </script>



        <script type="text/javascript">
            
           
            $(function() {

                

                $( "#set" )
                .button()
                .click(function() {

                    updatePersonal();

                });

                $( "#cancel" )
                .button()
                .click(function() {
                    cancel();


                });
            });


        </script>
        <script>
            function reformatDate() {
 
                if(document.getElementById("entryDate").value!='')
                {

                   
                    var dateF=document.getElementById("entryDate");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }

               



                if(document.getElementById("datepicker").value!='')
                {
                    var dateF=document.getElementById("datepicker");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }
               




                if(document.getElementById("datepicker1").value!='')
                {
                    var dateF=document.getElementById("datepicker1");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }
               


              
                if(document.getElementById("datepicker2").value!='')
                {
                    var dateF=document.getElementById("datepicker2");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }

               



                if(document.getElementById("datepicker3").value!='')
                {
                    var dateF=document.getElementById("datepicker3");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }
               




                if(document.getElementById("datepicker4").value!='')
                {
                    var dateF=document.getElementById("datepicker4");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }

               





                if(document.getElementById("datepicker5"))
                {
                    var dateF=document.getElementById("datepicker5");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }

               


                if(document.getElementById("datepicker6"))
                {
                    var dateF=document.getElementById("datepicker6");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }

              



                if(document.getElementById("datepicker7"))
                {
                    var dateF=document.getElementById("datepicker7");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }
              


                if(document.getElementById("datepicker8"))
                {
                    var dateF=document.getElementById("datepicker8");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }

                else
                {
                    var dateF=document.getElementById("datepicker8");
                    dateF.value='';

                }


                if(document.getElementById("datepickerChild1"))
                {
                    var dateF=document.getElementById("datepickerChild1");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }

                else
                {
                    var dateF=document.getElementById("datepickerChild1");
                    dateF.value='';

                }




                if(document.getElementById("datepickerChild2"))
                {
                    var dateF=document.getElementById("datepickerChild2");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }

                else
                {
                    var dateF=document.getElementById("datepickerChild2");
                    dateF.value='';

                }



                if(document.getElementById("datepickerChild3"))
                {
                    var dateF=document.getElementById("datepickerChild3");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }

                else
                {
                    var dateF=document.getElementById("datepickerChild3");
                    dateF.value='';

                }




                if(document.getElementById("datepickerChild4"))
                {
                    var dateF=document.getElementById("datepickerChild4");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }

                else
                {
                    var dateF=document.getElementById("datepickerChild4");
                    dateF.value='';

                }
            }
            
            function issues(){
                
                var distlistitem = document.getElementById("subscriptionfor");
                var distlistitemtext = distlistitem.options[distlistitem.selectedIndex].text;
                
                
                if(distlistitemtext=="1 year"){
                    document.getElementById("noofissues").value="24";
                }else if(distlistitemtext=="2 years"){
                    document.getElementById("noofissues").value="48";
                }else if(distlistitemtext=="3 years"){
                    document.getElementById("noofissues").value="72";
                }else if(distlistitemtext=="5 years"){
                    document.getElementById("noofissues").value="120";
                }else if(distlistitemtext=="Life Time"){
                    document.getElementById("noofissues").value="240";
                }
                
                
            }









        </script>






        <script>
            $(function() {
                $( "#tabs" ).tabs();

            });
        </script>
    </head>
    <body onload="reformatDate();" >
        <form action="Controller?process=PersonalProcess&action=viewAll" id="form1"    method="POST">
            <div >
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">Contact Details</a></li>

                    </ul>



                    <div id="tabs-1">
                        <table width="70%" border="0" align="center"  id="table1">
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

                            <tr>
                                <td width="16%"  class="alignRight" >Name &nbsp;  </td>
                                <td width="28%"  >
                                    <input type="hidden" name="id" id="id" value="<c:out value="${executiveDetails.eid}" />" />
                                    
                                    <label>
                                        <input name="name" type="text" value="<c:out value="${executiveDetails.name}" />" class="textField" id="name" size="30" data-validate="validate(required)"  >
                                    </label>
                                </td>

                                <td width="16%"  class="alignRight" >Contact No &nbsp;  </td>

                                <td>
                                    <label>

                                        <input name="contactNO" type="text" value="<c:out value="${executiveDetails.contactnumber}" />" class="textField" id="contactNO" size="30" data-validate="validate(required)" >

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
                                 <td width="16%"  class="alignRight" >E-Mail&nbsp;  </td>

                                <td align="left">
                                    <label>

                                        <input name="email" type="text" class="textField" value="<c:out default="" value="${executiveDetails.email}" />" id="email" size="30"  >

                                    </label>
                                </td>
                                
                                <td width="16%"  class="alignRight" >Address&nbsp;  </td>

                                <td>
                                    <label>

                                        <input name="address" type="text" class="textField"  value="<c:out default="" value="${executiveDetails.address}" />" id="addressline1" size="30">

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
                                  <td width="20%" class="alignRight" >Joining Date &nbsp;
                                </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="cocontactnumber" type="text" value="<c:out value="${executiveDetails.joiningdate}" />" class="textField" id="cocontactnumber" size="30" data-validate="validate(required)"  >
                                    </label>
                                </td>
                                
                                <td width="16%"  class="alignRight" >Remarks&nbsp;  </td>
                                <td align="left">
                                    <label>

                                        <input name="remarks" type="text"  class="textField" value="<c:out default="" value="${executiveDetails.remarks}" />" id="remarks" size="30" data-validate="validate(required)" >

                                    </label>
                                </td>
                                
                          

                            <tr>

                                <td>
                                    
                                </td>

                            </tr>
                             <tr>

                                <td>
                                    
                                </td>

                            </tr>

                            <tr>


                                
                        </table>


                        <table id="table2" width="30%" border="0" align="center">
                            
                            
                            <tr>
                                <td align="center">

                                    <button id="set" >Update</button>
                                    
                                </td>
                                <td><button type="submit" id="cancel">Cancel</button></td>
                            </tr>


                        </table>
                    </div>





                </div>



            </div>




        </form>
        <script>
            $(function() {
                $( "#datepicker" ).datepicker({changeYear: true, changeMonth: true});
                $( "#anim" ).change(function() {
                    $( "#datepicker" ).datepicker( "option", "showAnim", $( this ).val() );
                });
                $( "#entryDate" ).datepicker({changeYear: true, changeMonth: true});
                $( "#anim" ).change(function() {
                    $( "#datepicker" ).datepicker( "option", "showAnim", $( this ).val() );
                });
            });
        </script>

        <script type="text/javascript">

            function cancel(){
               
                var form1 = document.getElementById(form1);
                form1.action="Controller?process=PersonalProcess&action=viewAll";
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


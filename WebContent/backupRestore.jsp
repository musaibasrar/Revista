<%--
    Document   : backupRestore
    Created on : Jan 15, 2013, 3:24:58 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
 <%@page import="java.util.Date"%>
 <%@page import="java.util.Comparator"%>
 <%@page import="java.util.Arrays"%>
  <%@page import="java.io.IOException"%>

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
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.dialog.js"></script>
        <link rel="stylesheet" href="css/datePicker/demos.css">

        <script type="text/javascript">

            function restore()
            {
                var form12=document.getElementById("form12");
                form12.action="Restore?backupRestore=restore";
                form12.submit();
            }

            function restore1()

            {

                 var cnt=0;
                for(var i=0; i< form12.fileName.length; i++ ){
                    var cid="c"+i;
                    var obj=document.getElementById(cid);
                    if(obj.checked==true){
                        cnt++;
                         var form1=document.getElementById("form12");
                form12.action="Restore?backupRestore=restore";
                form12.submit();
                    }
                    else if(obj.checked==false){

                    }
                }
                if(cnt>0){
                    return true;
                }
                else {
                    alert("Please select file to restore");
                    return false;
                }

            //alert(form1.fileName[0].value);


            }



            function backUp()
            {
                
                var form12=document.getElementById("form12");
                form12.action="Restore?backupRestore=backup";
                form12.submit();
            }


            function showBackupDiv()
            {

                 document.getElementById("hideBackupRestore").style.display='none';
                document.getElementById("hideBackupDiv").style.display="";


            }

            function showReStoreDiv()
            {
                 document.getElementById("hideBackupRestore").style.display='none';
              document.getElementById("hideReStoreDiv").style.display="";
            }


function hideRestore()
{
  document.getElementById("hideReStoreDiv").style.display='none';
   document.getElementById("hideBackupRestore").style.display="";

}


function CancelbackUp()
{
  document.getElementById("hideBackupDiv").style.display='none';
   document.getElementById("hideBackupRestore").style.display="";
}

        </script>

        <style>

            .rating {
                padding: 14px;
            }

            .rating-btn {
                display: inline-block;
                margin-top: 24px;
                padding: 4px;
                position: relative;
                font-family: 'Open Sans',sans-serif;
                font-size: 12px;
                text-decoration: none;
                color: white;
                cursor: pointer;
                background-image: -o-linear-gradient(bottom,#2CA0CA 0,#08C 100%);
                background-image: -moz-linear-gradient(bottom,#2CA0CA 0,#08C 100%);
                background-image: -webkit-linear-gradient(bottom,#2CA0CA 0,#08C 100%);
                background-image: -ms-linear-gradient(bottom,#2CA0CA 0,#08C 100%);
                background-image: linear-gradient(bottom,#2CA0CA 0,#08C 100%);
                -webkit-box-shadow: inset 0 1px 0 #7fd2f1,0px 6px 0 #156785;
                -moz-box-shadow: inset 0 1px 0 #7fd2f1,0px 6px 0 #156785;
                box-shadow: inset 0 1px 0 #7fd2f1,0px 6px 0 #156785;
                border-radius: 5px;
            }

            .rating-btn:before {
                background-color: #072239;
                content: "";
                display: block;
                position: absolute;
                width: 100%;
                height: 100%;
                padding-left: 2px;
                padding-right: 2px;

                left: -2px;
                top: 5px;
                z-index: -1;
                border-radius: 6px;
                -webkit-box-shadow: 0 1px 0 #fff;
                -moz-box-shadow: 0 1px 0 #fff;
                box-shadow: 0 1px 0 #fff;
            }

            .active {
                background: #2CA0CA;
                -webkit-box-shadow: inset 0 1px 0 #7fd2f1,inset 0 -1px 0 #156785;
                -moz-box-shadow: inset 0 1px 0 #7fd2f1,inset 0 -1px 0 #156785;
                box-shadow: inset 0 1px 0 #7fd2f1,inset 0 -1px 0 #156785;
                top: 7px;
                cursor: default;
            }

            .imdb {
                margin-right: 5px;
            }
        </style>
    </head>
    <body bgcolor="#E6EEF4">

        <form action="Restore" method="post" id="form12" >
            
            <div  id="hideBackupRestore" align="center" width="40%">
                <table width="40%" frame="box" style="background-image: url(images/ui-bg_diagonals-small_50_466580_40x40.png)">
                    <tr>
                        <td align="center" style="font-weight: bold;color: blue">BACK-UP AND RESTORE</td>
                    </tr>
                </table>
                <table  width="40%" frame="box">
                    <tr>
                        <td align="center">


                            <span class="rating-btn imdb active" onclick="showBackupDiv();">Back-Up</span>

                        </td>

                        <td >

                            <span class="rating-btn imdb active" onclick="showReStoreDiv();">ReStore</span>

                        </td>
                    </tr>

                    <tr>
                        <td>
                            <br/>
                        </td>
                    </tr>



                   

                  
                </table>

            </div>

            <div  id="hideBackupDiv" align="center" width="40%" style="display: none;height: 300px">
                <table width="40%" frame="box" style="background-image: url(images/ui-bg_diagonals-small_50_466580_40x40.png)">
                    <tr>
                        <td align="center" style="font-weight: bold;color: blue">BACK-UP</td>
                    </tr>


                </table>
                <table  width="40%" frame="box">

                   

                   
                    <tr>
                        <td>
                            <label style="font-size: 13px">
                                Enter Back-Up File Name:
                            </label>
                        </td>

                        <td>
                            <input type="text" name="backupFilename" id="backupFilename" >
                        </td>


                    </tr>

                    <tr>
                        <td align="center">


                            <span class="rating-btn imdb active" onclick="backUp();">Back-Up</span>

                        </td>

                         <td align="center">


                            <span class="rating-btn imdb active" onclick="CancelbackUp();">Cancel</span>

                        </td>

                    </tr>

                   <tr>
                        <td>

                            <br/>
                        </td>
                    </tr>




                </table>
            </div>






             <div id="hideReStoreDiv" align="center" width="30%" style="display: none">


                <table width="30%" frame="box" style="background-image: url(images/ui-bg_diagonals-small_50_466580_40x40.png)">
                    <tr>
                        <td align="center" style="font-weight: bold;color: white">RESTORE</td>
                    </tr>
                </table>
                
            </div>


        </form>

    </body>
</html>

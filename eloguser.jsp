<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>ELogistics</title>
    <link rel="icon" type="image/ico" href="./images/imageicon.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <style>
        #overlay {
            position: fixed;
            /* Sit on top of the page content */
            display: block;
            /* Hidden by default */
            width: 100%;
            /* Full width (cover the whole page) */
            height: 100%;
            /* Full height (cover the whole page) */
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            filter:none;
            background-color: rgba(102, 255, 255, 0.7);
            /* Black background with opacity */
            z-index: 2;
            /* Specify a stack order in case you're using a different order for other elements */
            cursor: pointer;
            /* Add a pointer on hover */
        }

        #overlayhelp {
            position: fixed;
            /* Sit on top of the page content */
            display: none;
            /* Hidden by default */
            width: 100%;
            /* Full width (cover the whole page) */
            height: 100%;
            /* Full height (cover the whole page) */
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            /* Black background with opacity */
            z-index: 2;
            /* Specify a stack order in case you're using a different order for other elements */
            cursor: pointer;
            /* Add a pointer on hover */
        }



        #closereg:hover,
        #closelog:hover {
            color: red;
        }

        #regForm {
            background-color: #ffffff;
            margin: 100px auto;
            font-family: Raleway;
            padding: 40px;
            width: 60%;
            min-width: 200px;
        }

        h1 {
            text-align: center;
        }

        input {
            padding: 10px;
            width: 100%;
            font-size: 17px;
            font-family: Raleway;
            border: 1px solid #aaaaaa;
        }

        /* Mark input boxes that gets an error on validation: */
        input.invalid {
            background-color: #ffdddd;
        }

        /* Hide all steps by default: */
        .tab {
            display: none;
        }

        button {
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 17px;
            font-family: Raleway;
            cursor: pointer;
        }

        button:hover {
            opacity: 0.8;
        }

        #prevBtn {
            background-color: #bbbbbb;
        }

        /* Make circles that indicate the steps of the form: */
        .step {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbbbbb;
            border: none;
            border-radius: 50%;
            display: inline-block;
            opacity: 0.5;
        }

        .step.active {
            opacity: 1;
        }

        /* Mark the steps that are finished and valid: */
        .step.finish {
            background-color: #4CAF50;
        }
    </style>
    <style>
        select,
        option {
            border-radius: 5px;
            background-color: lightgray;
        }

        .table-borderless>tbody>tr>td,
        .table-borderless>tbody>tr>th,
        .table-borderless>tfoot>tr>td,
        .table-borderless>tfoot>tr>th,
        .table-borderless>thead>tr>td,
        .table-borderless>thead>tr>th {
            border: none;
            font-size: 16px;
        }


        #inputes {
            width: 55px;
        }

        #btn {
            width: 100px;
        }

        #footer {
            margin: 0 auto;
            width: 100%;
            height: auto;
            overflow: hidden;
            position: relative;
            bottom: 0px;
        }
    </style>
    <style>
    #body{
        background-color:rgba(0,0,0,0);
    }
        .icon-bar {
            position: fixed;
            top: 50%;
            -webkit-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            transform: translateY(-50%);
        }

        .icon-bar a {
            display: block;
            text-align: center;
            padding: 10px;
            transition: all 0.3s ease;
            color: white;
            font-size: 15px;
        }

        .icon-bar a:hover {

            background-color: #000;
        }

        .facebook {
            background: #3B5998;
            color: white;
        }

        .twitter {
            background: #55ACEE;
            color: white;
        }

        .google {
            background: #dd4b39;
            color: white;
        }

        .linkedin {
            background: #007bb5;
            color: white;
        }

        .youtube {
            background: #bb0000;
            color: white;
        }

        .content {
            margin-left: 75px;
            font-size: 30px;
        }
    </style>
    <script>
        function changed(x) {
            x.classList.toggle("glyphicon-minus");
        }
      
        function onhelp() {
            document.getElementById("overlayhelp").style.display = "block";
        }
        function offhelp() {
            document.getElementById("overlayhelp").style.display = "none";
        }

        function bluring()
        {document.getElementById("body").style.background = "rgba(0,0,0,0.5)";}
    </script>

</head>

<body id="body">

  <%!
      Connection conn;
      String username,user;
      Statement stmtfill,stmtfill1,stmtfill2;
      ResultSet rsshow,rsshow1,rsshow2;
      int i,n;
      public void doConnect()
      {
       try
        {
          Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        }
        catch(ClassNotFoundException e)
        {
          System.out.println("A error"+e);
        }
        try
        {
          conn=DriverManager.getConnection("jdbc:odbc:LocalServer","sa","root");
        }
        catch(SQLException e)
        {
          System.out.println("B error");
        }
      }
      %>


<%
     session=request.getSession();
     username=(String)session.getAttribute("ssun");

     if(username!=null)
     {
     doConnect();
        try{
            stmtfill2=conn.createStatement();
            rsshow2=stmtfill2.executeQuery("select * from tblretailerinfo where username='"+username+"' ");
            while(rsshow2.next())
            {
                user=rsshow2.getString("retname");
            }
        }
        catch(SQLException e)
        {
            System.out.println("error");
        }
     }
     else
     {
         %>
         <div id="overlay">
         <h1 style="color:black; font-size:50px; font-weight:800; margin-top:300px; text-align:center;">Sorry!!!</h1>
         <h1 style="color:black; font-size:50px; font-weight:800;  text-align:center;">You can not Access without Login.</h1>
        </div>
         <script> 
         setTimeout(() => { window.open("index.html","_SELF");
             
         }, 10000);</script>
         <%

     }
         %>

    <div class="jumbotron" style="background-color:lightblue; margin-bottom:0px;">
        <center>
            <h1>e-Logistics Solutions</h1>
            <small>Your need Our Priority!</small>
        </center>
    </div>






    <!-- <nav class="navbar navbar-inverse" style="margin-top:0; border-radius:0px;" > -->
    <nav class="navbar navbar-inverse fixed-top" style="margin-top:0; border-radius:0px;">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" style="margin-right:20px;" href="#">E Logistics</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="eloguser.html">Home</a></li>
                <li><a href="about1.html">About Us</a></li>
                <li><a href="contact1.html">Contact Us</a></li>
                <li><a href="privacy1.html">Privacy Policy</a></li>

          
                <li><a href="#" onclick="onhelp()">Help</a></li>
            </ul>

            <form class="nav navbar-form navbar-left" action="search.jsp">
                <div class="input-group">
                    <input type="text" style="margin-left:10px;" class="form-control" placeholder="Search"
                        name="search">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </form>
             <div class="col-sm-4" align="center"> <h4 style="padding-top:6px; color:#ffffff;">Welcome M/s. <%= user %></h4></div>
           <ul>
           <div class="nav navbar-nav navbar-right">
                
                <li><a href="index.html"  onclick="onlog()"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
                </li>
            </ul>
        </div>
    </nav>


    <div class="icon-bar">
        <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
        <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
        <a href="#" class="google"><i class="fa fa-google"></i></a>
        <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
    </div>


    <div class="col-sm-4" align="left" style="margin-left:60px;">
        <h2 style="margin-left:20px; margin-top:50px; ">Project Manager</h2>



        <div class="container" >
        <h4 style="margin:30px;"> <a href="orderinfoc.jsp">Post Order<span style="padding:5px;"
                        class="glyphicon glyphicon-link"></span></a></h4>

            <h4 style="padding-top:10px; margin-top:-5px; margin-left:30px;">Summery Report<button type="button"
                    style="margin-left:20px;" class="btn btn-info btn-xs glyphicon glyphicon-plus"
                    data-toggle="collapse" onclick="changed(this)" data-target="#demo2"></button></h4>
            <div id="demo2" class="collapse" style="margin:30px;">
                <a href="rptvendor.jsp">Vendor information Report <span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
                <br><br>
                <a href="rptretailer.jsp">Retailer information Report <span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
                <br>
                <br>
                <a href="rptproductcat.jsp">Product Category Report <span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
                <br><br>
                <a href="rptproduct.jsp">Product information Report <span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
                <br>
                <br>
                <a href="rptorder.jsp">Order To Vendor Report <span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
                <br><br>
                <a href="rptpurchase.jsp">Purchases Of Goods Report <span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
                <br>
                <br>
                <a href="rptorderretail.jsp">Order From Retailer Report <span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
                <br><br>
                <a href="rptissueofgoods.jsp">Sales Of Goods Report<span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
                <br>
                <br>
                <a href="rptpayment.jsp">Payment Voucher Report <span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
                <br>
                <br>
                <a href="rptreceipt.jsp">Receipt Voucher Report <span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
            </div>
        </div>

        <div class="container" >
            <h4 style="padding-top:10px; margin-left:30px;">Detail Report<button type="button" style="margin-left:20px;"
                    class="btn btn-info btn-xs glyphicon glyphicon-plus" data-toggle="collapse" onclick="changed(this)"
                    data-target="#demo3"></button></h4>
            <div id="demo3" class="collapse" style="margin:30px;">
                <a href="rptinvoicec.jsp">GST Invoice Report <span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
                <br><br>
                <a href="rptproductcompanybynamec.jsp">Product Information [Vendor] Report<span
                        style="padding-left:5px;" class="glyphicon glyphicon-link"></span></a>
                      
                <br>
                <br>
                <a href="rptproductcompanybycodec.jsp">Product Inforamation [Produt Code] Report <span
                        style="padding-left:5px;" class="glyphicon glyphicon-link"></span></a>
                <br>
                <br>
                <a href="rptordertovendorbynamec.jsp">Order To Vendor [Vendor] Report <span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
                <br>
                <br>
                <a href="rptordertovendorbycodec.jsp">Order To Vendor [Produt Code] Report <span
                        style="padding-left:5px;" class="glyphicon glyphicon-link"></span></a>
                <br>
                <br>
                <a href="rptordertovendorbyorderc.jsp">Order To Vendor [Order No] Report <span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
                <br>
                <br>
                <a href="rptpurchasebynamec.jsp">Purchases Of Goods [Vendor] Report <span style="padding-left:5px;"
                        class="glyphicon glyphicon-link"></span></a>
                <br>
                <br>
                <a href="rptpurchasebyproductc.jsp">Purchases Of Goods [Produt Code] Report <span
                        style="padding-left:5px;" class="glyphicon glyphicon-link"></span></a>
                <br>
                <br>
                <a href="rptpurchasebypurchasec.jsp">Purchases Of Goods [Invoice No] Report <span
                        style="padding-left:5px;" class="glyphicon glyphicon-link"></span></a>
                <br>
                <br>
                <a href="rptpurchasebyproductc.jsp">Purchases Of Goods [Produt Code] Report <span
                        style="padding-left:5px;" class="glyphicon glyphicon-link"></span></a>
             <br><br>
                <a href="rptissuetoname.jsp">Issue Information [Retailer] Report<span
                        style="padding-left:5px;" class="glyphicon glyphicon-link"></span></a>
            </div>
        </div>
    </div>


    <div align="right" style="margin:50px;">
        <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:60%; ">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
                <li data-target="#myCarousel" data-slide-to="5"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" style=" width:100%; border-radius:5px;  ">
                <div class="item active">
                    <img src="./images/crousel8.jpg" alt=" logistics"
                        style=" background-size:cover; height:auto; width:100%; ">
                </div>

                <div class="item">
                    <img src="./images/crousel3.png" alt=" logistics"
                        style=" background-size:cover; height:auto; width:100%; ">
                </div>

                <div class="item">
                    <img src="./images/crousel1.jpg" alt=" logistics"
                        style=" background-size:cover; height:auto; width:100%;">
                </div>

                <div class="item">
                    <img src="./images/crousel2.png" alt=" logistics"
                        style=" background-size:cover; height:auto; width:100%;">
                </div>

                <div class="item">
                    <img src="./images/crousel5.jpg" alt=" logistics"
                        style=" background-size:cover; height:auto; width:100%;">
                </div>

                <div class="item">
                    <img src="./images/crousel9.jpg" alt=" logistics"
                        style=" background-size:cover; height:auto; width:100%;">
                </div>

            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>




    <div class="jumbotron" id="footer" style="margin-bottom:0;  background-color:lightblue;">


        <div class="wrapper">

            <ul class="foot-menu box-flex" style="list-style-type:none; ">
                <table>
                    <tr>
                        <td>
                            <li class="ft-item" style=" font-size:17px; margin-left:30px;">
                                <h4>Quick Links</h4>
                                <ul style="list-style-type:none; " class="ft-tabs">
                                    <li><a href="#">Home</a></li>
                                    <li><a href="about.html">About Us</a></li>
                                    <li><a href="contact.html">Contact Us</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                </ul>
                            </li>
                        </td>
                        <td>
                            <li class="ft-item" style="font-size:17px; margin-left:30px;">
                                <h4>Quick Access</h4>
                                <ul style="list-style-type:none;" class="ft-tabs">
                                    <li><a href="#">Master</a></li>
                                    <li><a href="#">Management</a></li>
                                    <li><a href="#">Summery Report</a></li>
                                    <li><a href="#">Detailed Report</a></li>
                                </ul>
                            </li>
                        </td>

                        <td>
                            <li class="ft-item" style="font-size:17px; margin-top:-65px; margin-left:30px;">
                                <h4> Follow</h4>
                                <ul style="list-style-type:none;" class="ft-tabs">
                                    <a href="#" class="fa fa-facebook "></a>
                                    <a href="#" class="fa fa-twitter" style="margin-left:20px;"></a>
                                    <a href="#" class="fa fa-google" style="margin-left:20px;"></a>
                                    <a href="#" class="fa fa-linkedin" style="margin-left:20px;"></a>
                                    <a href="#" class="fa fa-instagram" style="margin-left:20px;"></a>
                                    <a href="#" class="fa fa-pinterest" style="margin-left:20px;"></a>
                                </ul>
                            </li>
                        </td>
                    </tr>
            </ul>
            </table>
        </div>

        <div id="overlayhelp">
            <form id="regForm" style="scroll-behavior: smooth;">
                <p align="right" onclick="offhelp()"><span id="closereg" class="	glyphicon glyphicon-remove"></span></p>
                <h2 align="center" class="display-1">Help</h2>
                <br><br><br>
                <dl>
                    <DT>How To Search your Data?</DT>
                    <DD> You can search your data by entering text on search button on navigation bar.</DD>
                    <br>
                    <dt>How to Login or signup?</dt>
                    <dd>You can see a signup button and a login button on the navigation bar, just click on it and fill
                        your data, and here you go.</dd>
                    <br>
                    <dt>How to Find a Particular Form [ for eg: vendor information ] ?</dt>
                    <dd>So, you can find each and every form in Project Manager section, Where we categorized all the
                        Forms accordingly. click on Add Button and choose you form.</dd>
                    <br>
                    <dt>How can I connect with your social media pages?</dt>
                    <dd>So In our website, There is a social media slider on left, and also you can find more options on
                        bottom footer bar, so go through those links and you can easily follow us.</dd>
                </dl>
            </form>


        </div>



        <div>
            <p class="text-muted" style="text-align:center; font-size:16px;">&copy; 2019 Project Group All rights
                reserved</p>
        </div>

    </div>

</body>

</html>
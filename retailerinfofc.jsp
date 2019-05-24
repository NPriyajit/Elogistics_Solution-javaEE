<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%
 i=0;
 retname=new String[80];
 contactper=new String[80];
 locality=new String[80];
 city=new String[80];
 state=new String[80];
 ccode=new String[80];
 phoneno=new String[80];
 fax=new String[80];
 gstno=new String[80];
 rdate=new String[80];
 website=new String[80];
 emailid=new String[80];
 username=new String[80];
 password=new String[80];


 doConnect();
 try{
     stmtshow=conn.createStatement();
     rsshow=stmtshow.executeQuery("select * from tblretailerinfo");
     while(rsshow.next())
     {
         retname[i]=rsshow.getString("retname");
         contactper[i]=rsshow.getString("contper");
         locality[i]=rsshow.getString("locality");
         city[i]=rsshow.getString("city");
         state[i]=rsshow.getString("state");
         ccode[i]=rsshow.getString("ccode");
         phoneno[i]=rsshow.getString("phoneno");
         fax[i]=rsshow.getString("fax");
         gstno[i]=rsshow.getString("gstno");
         emailid[i]=rsshow.getString("emailid");
         website[i]=rsshow.getString("website");
         rdate[i]=rsshow.getString("datedetails");
         username[i]=rsshow.getString("username");
         password[i]=rsshow.getString("password");

         i++;
     }
 }
 catch(SQLException s)
 {
     System.out.println("error");
  }
  %>

  <html>
  <head>
      <title>Find Information</title>
      <%@ include file="header.jsp" %>
      <script language="javascript">
        function showRetail()
        {
        var jretname=new Array();
        var jcontactper=new Array();
        var jlocality=new Array();
        var jcity=new Array();
        var jstate=new Array();
        var jccode=new Array();
        var jphoneno=new Array();
        var jfax=new Array();
        var jdate=new Array();
        var jgstno=new Array();
        var jemailid=new Array();
        var jusername=new Array();
        var jpassword=new Array();

            var j,k;
            j=0;
            <%
            i=0;
            while(i<retname.length)
            {
            %>
            jretname[j]="<%=retname[i]%>";
            jcontactper[j]="<%=contactper[i] %>";
            jlocality[j]="<%=locality[i] %>";
            jcity[j]="<%=city[i] %>";
            jstate[j]="<%=state[i] %>";
            jccode[j]="<%=ccode[i] %>";
            jphoneno[j]="<%=phoneno[i] %>";
            jfax[j]="<%=fax[i] %>";
            jgstno[j]="<%=gstno[i] %>";
            jdate[j]="<%=rdate %>"
            jemailid[j]="<%=emailid[i] %>";
            jusername[j]="<%=username[i] %>";
            jpassword[j]="<%=password[i] %>";
            j=j+1;
            <%
            i=i+1;
            }
            %>
            k=document.f1.cmbretcode.selectedIndex;
            document.f1.txtretname.value=jretname[k-1];
            document.f1.txtcontper.value=jcontactper[k-1];
            document.f1.txtlocality.value=jlocality[k-1];
            document.f1.txtcity.value=jcity[k-1];
		        document.f1.txtstate.value=jstate[k-1];
            document.f1.countrycode.value=jccode[k-1];
            document.f1.numphno.value=jphoneno[k-1];
            document.f1.txtfax.value=jfax[k-1];
            document.f1.txtgst.value=jgstno[k-1];
            document.f1.rdate.value=jdate[k-1];
            document.f1.email.value=jemailid[k-1];
            document.f1.txtuname.value=jusername[k-1];
            document.f1.pass.value=jpassword[k-1];



        }


            </script>
            <script>
            function showPass(y)
            {
              var x = document.getElementById("pass");
               if (x.type === "password") {
                  y.classList.toggle("glyphicon-eye-close");
                 x.type = "text";
               } else {
                 y.classList.toggle("glyphicon-eye-close");
                 x.type = "password";

               }
            }
            </script>
  </head>
  <body>
    
      <%!
      Connection conn;
      Statement stmtfill,stmtshow;
      ResultSet rsfill,rsshow;
      int i;
      String   retailcode, retname[],contactper[],locality[],city[],state[],phoneno[],fax[],rdate[],gstno[],ccode[],emailid[],website[],username[],password[];
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
      

<div class="col-sm-4" style="margin-top:-10px;">
  <p style="margin-left:15px; float:left; font-size:14px; "><a href="elog.html"><span style="padding:10px;  "
        class="glyphicon glyphicon-home"></span>Home</a></p>

  <p style="font-size:14px; margin-left:15px; float:left;"> <a href="about.html"><span style="padding:10px;  "
        class="glyphicon glyphicon-list-alt"></span>About Us</a></p>

  <p style="font-size:14px; margin-left:15px; float:left;"> <a href="contact.html"><span style="padding:10px;  "
        class="glyphicon glyphicon-earphone"></span>Contact Us</a></p>

</div>
<div class="col-sm-4">

  <h3 style="text-align:center;  margin-top: -7px; ">Retailer Information &nbsp;<sup><small>Edit Information</small></sup></h3>
</div>

<div class="well" style="border-top: solid black;border-bottom: solid black ; margin-top:70px;">
      <div class="container">

    <form name="f1" id="myForm" action="retailerinfos.jsp">
        <table  class="table table-borderless ">
            <tr>
                <td>
                    Retailer Code:
                </td>
                <td>
                  <div class="col-xs-8">
                        <select name="cmbretcode" id="inputs" class="form-control input-sm" text-align: center;" onchange="showRetail()">
                                <option value="">-Select-</option>
                                 <%
                                     doConnect();
                                     try{
                                         stmtfill=conn.createStatement();
                                         rsfill=stmtfill.executeQuery("select * from tblretailerinfo");
                                         while(rsfill.next()){
                                            retailcode=rsfill.getString("retno");
                                             %>
                                             <option value="<%=retailcode %>"><%=retailcode %></option>
                                             <%
                                         }
                                     }
                                     catch(SQLException se){
                                         out.println("Error 2");
                                     }
                                 %>
                            </select>
                            </div>
                </td>
            </tr>
            <tr>
                <td>
                    Retailer Name:
                </td>
                <td>
                  <div class="col-xs-8">
                    <input type="text" id="inputs" class="form-control input-sm" title="Enter your company Name" name="txtretname" required>
                  </div>
                </td>
            </tr>
            <tr>
                <td>
                    Contact Person:
                </td>
                <td>
                  <div class="col-xs-8">
                    <input type="text" id="inputs" class="form-control input-sm" name="txtcontper"  autocomplete="on">
                  </div>
                </td>
            </tr>
            <tr>
                <td>
                    Locality:
                </td>
                <td>
                  <div class="col-xs-8">
                    <input type="text" id="inputs" class="form-control input-sm" name="txtlocality"  list="cities">
                  </div>
                </td>
            </tr>
            <tr>
                <td>
                    City:
                </td>
                <td>
                  <div class="col-xs-8">
                    <input type="text" id="inputs" class="form-control input-sm" name="txtcity" list="cities">
                  </div>
                </td>
            </tr>
            <tr>
                <td>
                    State:
                </td>
                <td>
                  <div class="col-xs-8">
                    <input type="text" id="inputs" class="form-control input-sm" name="txtstate" list="states"  >
                  </div>
                </td>
            </tr>
            <tr>
                <td>
                    Phone no:
                </td>
                <td>
                  <div class="col-xs-3">
                    <select name="countrycode" id="inputes" class="form-control input-sm" >
                        <option>-CODE-</option>
                        <option>+91</option>
                    </select>
                  </div>
                  <div class="col-xs-5">
                    <input type="number"  id="inputs" class="form-control input-sm" name="numphno" title="enter your phone no" min="0"required>
                  </div>
                </td>


                <td>
                    Fax:
                </td>
                <td>
                  <div class="col-xs-8">
                    <input type="text" min="0" name="txtfax" id="inputs" class="form-control input-sm"  title="enter fax number" required autocomplete="off">
                  </div>
                </td>
            </tr>
            <tr>

            <td>
                GST no:
            </td>

            <td>
              <div class="col-xs-8">
                <input type="text" id="inputs" class="form-control input-sm" name="txtgst" required autocomplete="off">
              </div>
            </td>

                <td>
                    Date:
                </td>
                <td>
                  <div class="col-xs-8">
                    <input type="date" id="inputs" class="form-control input-sm" name="rdate" required>
                  </div>
                </td>



            </tr>
            <tr>
                <td>
                    Email-ID:
                </td>
                <td>
                  <div class="col-xs-8">
                    <input type="email" name="email" id="inputs" class="form-control input-sm" required title="enter a valid email">
                  </div>
                </td>

                <td>
                    Website:
                </td>
                <td>
                  <div class="col-xs-3">
                    <select name="cmbssl" id="combossl"id="inputs" class="form-control input-sm" onchange="changessl()">
                        <option>-SSL-</option>
                        <option>HTTP</option>
                        <option>HTTPS</option>
                    </select>
                  </div>
                  <div class="col-xs-5">
                    <input type="url" id="websitebar" id="inputs" class="form-control input-sm" name="urlvend" onfocus="getfocus()">
                  </div>
                </td>

            </tr>
            <tr>
            <td>UserName:</td>

            <td>
              <div class="col-xs-8">
              <input type="text" name="txtuname" id="inputs" class="form-control input-sm" required autocomplete="off">
            </div>
            </td>

            <td>
            Password:</td>
            <td>
              <div class="col-xs-6">
            <input type="password" name="pass" id="pass" class="form-control input-sm" required autocomplete="off">
            </div>
            <div class="col-xs-2">
            <button class="btn btn-default btn-sm reveal glyphicon glyphicon-eye-open" type="button" onclick="showPass(this)"></button>
          </div>
            </td>
            </tr>
        </table>
        <div class="btn">
            <input id="btn" class="btn btn-primary" type="submit" name="btnsub" value="Update">
            <input id="btn" class="btn btn-danger" type="reset" name="btnres" value="Reset">
            <input id="btn" class="btn btn-info" type="button" name="btnfind" value="Back" onclick="window.open('retailerinfoc.html','_self')">
        </div>

    </form>
<%@ include file="footer.jsp" %>
</div>
  </div>
  </body>

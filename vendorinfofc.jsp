
<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%
 i=0;
 vendname=new String[30];
 contactper=new String[30];
 locality=new String[30];
 city=new String[30];
 state=new String[30];
 ccode=new String[30];
 phoneno=new String[30];
 fax=new String[30];
 gstno=new String[30];
 emailid=new String[30];
 website=new String[30];
 gdate=new String[30];
 doConnect();
 try{
     stmtshow=conn.createStatement();
     rsshow=stmtshow.executeQuery("select * from tblvendorinfo");
     while(rsshow.next())
     {
         vendname[i]=rsshow.getString("vendname");
         contactper[i]=rsshow.getString("contactper");
         locality[i]=rsshow.getString("locality");
         city[i]=rsshow.getString("city");
         state[i]=rsshow.getString("state");
         ccode[i]=rsshow.getString("ccode");
         phoneno[i]=rsshow.getString("phoneno");
         fax[i]=rsshow.getString("fax");
         gstno[i]=rsshow.getString("gstno");
         emailid[i]=rsshow.getString("emailid");
         website[i]=rsshow.getString("website");
         gdate[i]=rsshow.getString("datedetails");
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
      <script lang="javascript">
      function showVendor()
      {
        var jvendname=new Array();
        var jcontactper=new Array();
        var jlocality=new Array();
        var jcity=new Array();
        var jstate=new Array();
        var jccode=new Array();
		   var jphoneno=new Array();
		   var jfax=new Array();
		   var jgstno=new Array();
		   var jemailid=new Array();
       var jwebsite=new Array();
       var jdate =new Array();
       var j,k;
          j=0;
          <%
          i=0;
          while(i<vendname.length)
          {
          %>
          jvendname[j]="<%=vendname[i]%>";
          jcontactper[j]="<%=contactper[i] %>";
          jlocality[j]="<%=locality[i] %>";
          jcity[j]="<%=city[i] %>";
          jstate[j]="<%=state[i] %>";
          jccode[j]="<%=ccode[i] %>";
        jphoneno[j]="<%=phoneno[i] %>";
        jfax[j]="<%=fax[i] %>";
        jgstno[j]="<%=gstno[i] %>";
        jemailid[j]="<%=emailid[i] %>";
        jwebsite[j]="<%=website[i] %>";
        jdate[j]="<%=gdate[i] %>";
          j=j+1;
          <%
          i=i+1;
          }
          %>
          k=document.f1.cmbvendcode.selectedIndex;
          document.f1.txtvendname.value=jvendname[k-1];
          document.f1.txtcontper.value=jcontactper[k-1];
          document.f1.txtlocality.value=jlocality[k-1];
          document.f1.txtcity.value=jcity[k-1];
		  document.f1.txtstate.value=jstate[k-1];
          document.f1.countrycode.value=jccode[k-1];
		  document.f1.numphno.value=jphoneno[k-1];
		  document.f1.txtfax.value=jfax[k-1];
      document.f1.txtgst.value=jgstno[k-1];
          document.f1.txtdate.value=jdate[k-1];
          document.f1.email.value=jemailid[k-1];

          if(jwebsite[k-1].includes("https"))
            {
                document.f1.cmbssl.value="HTTPS";
            }
          else
            {
                document.f1.cmbssl.value="HTTP";
            }
          document.f1.urlvend.value=jwebsite[k-1];

      }

          </script>

          <script>
              function choose()
              {
                  var ch;
                  ch=confirm("Do You Really Want to Delete This Data?");
                  if(ch==true)
                  {
                      document.getElementById("myForm").submit();
                  }
                  else
                  {
                      document.getElementById("myForm").reset();
                  }
              }
          function visit()
          {
              var url;
              url=document.f1.urlvend.value;
              window.open(url);
          }
          function changessl()
          {
              var i;
              i=document.f1.cmbssl.selectedIndex;
              if(i==0)
              {
                  document.f1.urlvend.value=" ";
              }
              else if(i==1)
              {
                  document.f1.urlvend.value="http://" ;
              }
              else{
                  document.f1.urlvend.value="https://";
              }
          }
          function getfocus()
          {
              if(document.f1.urlvend.value=="")//!(document.f1.urlvend.value=='http:\\\\'|| document.f1.urlvend.value=='https:\\\\')
              {
              document.f1.cmbssl.focus();
              }
          }

          </script>
  </head>
  <body>
      <%!
      Connection conn;
      Statement stmtfill,stmtshow;
      ResultSet rsfill,rsshow;
      String  vendorcode,vendname[],contactper[],locality[],city[],state[],phoneno[],fax[],gdate[],gstno[],ccode[],emailid[],website[];
      int i;
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
  <p style="margin-left:15px; float:left; font-size:14px; "><a href="elgo.html"><span style="padding:10px;  "
        class="glyphicon glyphicon-home"></span>Home</a></p>

  <p style="font-size:14px; margin-left:15px; float:left;"> <a href="about.html"><span style="padding:10px;  "
        class="glyphicon glyphicon-list-alt"></span>About Us</a></p>

  <p style="font-size:14px; margin-left:15px; float:left;"> <a href="contact.html"><span style="padding:10px;  "
        class="glyphicon glyphicon-earphone"></span>Contact Us</a></p>

</div>
<div class="col-sm-4">

  <h3 style="text-align:center;  margin-top:-6px; ">Vendor Information<sup><small>Edit Details</small></sup></h3>
</div>


<div class="well" style="border-top: solid black;border-bottom: solid black ; margin-top:70px;">

        <div class="container">

            <form name="f1" id="myForm" action="vendorinfofs.jsp" >
                  <table  class="table table-borderless ">
                          <tr>
                              <td>
                                  Vendor Code:
                              </td>
                              <td>
                                <div class="col-xs-8">
                                  <select name="cmbvendcode" class="form-control input-sm" onchange="showVendor()">
                                      <option value="">-Select-</option>
                                       <%
                                           doConnect();
                                           try{
                                               stmtfill=conn.createStatement();
                                               rsfill=stmtfill.executeQuery("select * from tblvendorinfo");
                                               while(rsfill.next()){
                                                   vendorcode=rsfill.getString("vendno");
                                                   %>
                                                   <option value="<%=vendorcode%>"><%=vendorcode%></option>
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
                                  Vendor Name:
                              </td>
                              <td>
                                <div class="col-xs-8">
                                  <input type="text" title="Enter your company Name"  id="inputs" class="form-control input-sm"  name="txtvendname" required>
                                </div>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  Contact Person:
                              </td>
                              <td>
                                <div class="col-xs-8">
                                  <input type="text" name="txtcontper"  id="inputs" class="form-control input-sm"  autocomplete="on">
                                </div>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  Locality:
                              </td>
                              <td>
                                <div class="col-xs-8">
                                  <input type="text" name="txtlocality"  id="inputs" class="form-control input-sm"  list="cities">
                                </div>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  City:
                              </td>
                              <td>
                                <div class="col-xs-8">
                                  <input type="text" name="txtcity" id="inputs" class="form-control input-sm"  list="cities">
                                </div>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  State:
                              </td>
                              <td>
                                <div class="col-xs-8">
                                  <input type="text" name="txtstate" list="states"  id="inputs" class="form-control input-sm"  >
                                </div>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  Phone no:
                              </td>
                              <td>
                                <div class="col-sm-3">
                                  <select name="countrycode" id="inputs" class="form-control input-sm">
                                      <option>-CODE-</option>
                                      <option>+91</option>
                                  </select></div>
                                  <div class="col-sm-5">
                                  <input type="number"   id="inputs" class="form-control input-sm" name="numphno" title="enter your phone no" min="0"required>
                                </div>
                              </td>

                              <td>
                                  Fax:
                              </td>
                              <td>
                              </td>
                              <td>
                                <div class="col-sm-10">
                                  <input type="text" min="0" name="txtfax"  id="inputs" class="form-control input-sm"  required autocomplete="off">
                                 </div>
                              </td>
                          </tr>
                          <tr>
                            <td>
                                GST no:
                            </td>

                            <td>
                              <div class="col-xs-8">
                                <input type="text"  id="inputs" class="form-control input-sm" name="txtgst" required autocomplete="off">
                              </div>
                            </td>
                              <td>
                                  Date:
                              </td>
                              <td>
                              </td>
                              <td>
                                <div class="col-xs-10">
                                  <input type="date"  id="inputs" class="form-control input-sm" name="txtdate" required>
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
                              </td>
                              <td>
                                  <div class="col-xs-4">
                                  <select name="cmbssl" id="combossl"  id="inputs" class="form-control input-sm" style="border-radius: 5px;"  onchange="changessl()">
                                      <option>-SSL-</option>
                                      <option>HTTP</option>
                                      <option>HTTPS</option>
                                  </select>
                                </div>
                                  <div class="col-xs-6">
                                  <input type="url" id="inputs" class="form-control input-sm" name="urlvend" onfocus="getfocus()">
                                </div>
                              </td>

                          </tr>
                      </table>
                      <div class="btn" >
                          <input class="btn btn-primary" type="submit" name="btnup" value="Update"  id="btn">
                          <input class="btn btn-danger" type="reset" name="btndel" value="Delete" id="btn" onclick="choose()">
                          <input class="btn btn-info" type="button" name="btnback" value="Back" id="btn" onclick="window.open('vendorinfoc.html','_self')">
                      </div>

                  </form>
                      <%@ include file="footer.jsp" %>
    </div>
    </div>

  </body>

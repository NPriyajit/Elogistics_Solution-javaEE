
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
      <link rel="stylesheet" href="./css/style.css">
      <style>
      #bar
        {
        width: 310px;
        }
      </style>
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
		  document.f1.numfax.value=jfax[k-1];
          document.f1.txtdate.value=jdate[k-1];
		  document.f1.numgst.value=jgstno[k-1];
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
          </script>
  </head>
  <body>
    <div class="backgroundpic">
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



      <header class="header">
          <h1 id="headertext">e-Logistics<sub id="subtext"> Solutions</sub></h1>
      </header>
      <fieldset>
            <legend>Vendor Information <sup>Edit details</sup></legend>
            <form name="f1" id="myForm" action="vendorinfofs.jsp" >
                  <table>
                          <tr>
                              <td>
                                  Vendor Code:
                              </td>
                              <td>
                                  <select name="cmbvendcode" style="width: 250px; height:30px; text-align: center;" onchange="showVendor()">
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
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  Vendor Name:
                              </td>
                              <td>
                                  <input type="text" title="Enter your company Name" name="txtvendname" required>
                                  <font color="red">*</font>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  Contact Person:
                              </td>
                              <td>
                                  <input type="text" name="txtcontper"  autocomplete="on">
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  Locality:
                              </td>
                              <td>
                                  <input type="text" name="txtlocality"  list="cities">
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  City:
                              </td>
                              <td>
                                  <input type="text" name="txtcity" list="cities">
                                  <font color="red">*</font>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  State:
                              </td>
                              <td>
                                  <input type="text" name="txtstate" list="states"  >
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  Phone no:
                              </td>
                              <td>
                                  <select name="countrycode" id="ccode" onchange="unfocus()">
                                      <option>-CODE-</option>
                                      <option>+91</option>
                                  </select>
                                  <input type="number" maxlength="10" id="phno" style="width:167px;" name="numphno" title="enter your phone no" min="0"  required>
                                  <font color="red">*</font>
                              </td>
                              <td>
                                  &nbsp; &nbsp; &nbsp; &nbsp;
                              </td>

                              <td>
                                  Fax:
                              </td>
                              <td>
                                  <input type="number" min="0" name="numfax" id="bar"  title="enter fax number" required autocomplete="off">
                                  <font color="red">*</font>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  Date:
                              </td>
                              <td>
                                  <input type="text" name="txtdate" required>
                                  <font color="red">*</font>
                              </td>
                              <td>
                                  &nbsp; &nbsp; &nbsp; &nbsp;
                              </td>

                              <td>
                                  GST no:
                              </td>

                              <td>
                                  <input type="number" id="bar" name="numgst" required autocomplete="off">
                                  <font color="red">*</font>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  Email-ID:
                              </td>
                              <td>
                                  <input type="email" name="email" required title="enter a valid email">
                                  <font color="red">*</font>
                              </td>
                              <td>
                                   &nbsp; &nbsp; &nbsp; &nbsp;
                              </td>
                              <td>
                                  Website:
                              </td>
                              <td>
                                  <select name="cmbssl" id="combossl" onchange="changessl()">
                                      <option>-SSL-</option>
                                      <option>HTTP</option>
                                      <option>HTTPS</option>
                                  </select>
                                  <input type="url" id="websitebar " style="width:180px;" name="urlvend" onfocus="getfocus()"> <input type="button" id="btnsmall" style="width:30px; height30px;" onclick="visit()">
                              </td>


                          </tr>
                      </table>
                      <div class="button">
                          <input id="btn1" type="submit" name="btnup" value="Update">
                          <input id="btn2" type="submit" name="btndel" value="Delete" onclick="choose()">
                          <input id="btn3" type="button" name="btnback" value="Back" onclick="window.open('vendorinfoc.html','_self')">
                      </div>   
                  </fieldset>
                  </form>

              <div class="footer">
                  <p id="footertext">&copy;Project group</p>
              </div>

          </div>
  </body>

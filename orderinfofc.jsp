
<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%
 i=0;
datedet=new String[50];
vendname=new String[50];
locality=new String[50];
city=new String[50];
state=new String[50];
slno=new String[50];
prodcode=new String[50];
prodcat=new String[50];
prodname=new String[50];
price=new String[50];
quant=new String[50];
amt=new String[50];
 doConnect();
 try{
     stmtshow=conn.createStatement();
     rsshow=stmtshow.executeQuery("select * from tblorderinfo");
     while(rsshow.next())
     {
    	 datedet[i]=rsshow.getString("datedet");
    	 vendname[i]=rsshow.getString("vendname");
    	 locality[i]=rsshow.getString("locality");
         city[i]=rsshow.getString("city");
         state[i]=rsshow.getString("state");
         slno[i]=rsshow.getString("slno");
         prodcode[i]=rsshow.getString("prodcode");
         prodname[i]=rsshow.getString("prodname");
         prodcat[i]=rsshow.getString("prodcat");
         price[i]=rsshow.getString("price");
         quant[i]=rsshow.getString("quant");
         amt[i]=rsshow.getString("amt");
         i++;
     }
 }
 catch(SQLException s)
 {
     System.out.println("error");
  }
  %>

  <%
  n=0;
  locality1=new String[60];
  city1=new String[60];
  state1=new String[60];
  doConnect();
  try{
    stmtshow1=conn.createStatement();
    rsshow1=stmtshow1.executeQuery("select * from tblvendorinfo ");
    while(rsshow1.next())
    {
        locality1[n]=rsshow1.getString("locality");
        city1[n]=rsshow1.getString("city");
        state1[n]=rsshow1.getString("state");
        n++;
    }
 }
 catch(SQLException ses)
 {
    System.out.println("Error"+ses);
 }

 %>

 <%
prodcat1=new String[60];
prodname1=new String[60];
price1=new String[60];
m=0;
doConnect();
try{
	 stmtshow2=conn.createStatement();
	 rsshow2=stmtshow2.executeQuery("select * from tblproductdetails");
	 while(rsshow2.next())
	 {
		   prodcat1[m]=rsshow2.getString("prodcat");
           prodname1[m]=rsshow2.getString("prodname");
           price1[m]=rsshow2.getString("salesprice");
           m++;
	 }
}
 catch(SQLException ses)
{
   System.out.println("Error1"+ses);
}


%>
  <html>
  <head>
      <title>Find Information</title>
    <%@ include file="header.jsp" %>
      <script lang="javascript">
      function showOrder()
      {
  		    var jdate=new Array();
  		    var jvendname=new Array();``
    	    var jlocality=new Array();
          var jcity=new Array();
          var jstate=new Array();
          var jslno=new Array();
          var jprodcode=new Array();
          var jprodname=new Array();
    	 	  var jprodcat=new Array();
    		  var jprice=new Array();
    		  var jquant=new Array();
    		  var jamt=new Array();
          var j,k;
          j=0;
          <%
          i=0;
          while(i<vendname.length)
          {
          %>
          jdate[j]="<%=datedet[i] %>";
          jvendname[j]="<%=vendname[i]%>";
          jlocality[j]="<%=locality[i] %>";
          jcity[j]="<%=city[i] %>";
          jstate[j]="<%=state[i] %>";
          jslno[j]="<%=slno[i] %>";
          jprodcode[j]="<%= prodcode[i] %>";
          jprodcat[j]="<%=prodcat[i] %>";
    		  jprodname[j]="<%=prodname[i] %>";
    		  jprice[j]="<%=price[i] %>";
    		  jquant[j]="<%=quant[i] %>";
    		  jamt[j]="<%=amt[i] %>";


          j=j+1;
          <%
          i=i+1;
          }
          %>
          k=document.f1.cmborderno.selectedIndex;
          document.f1.date.value=jdate[k-1];
          document.f1.cmbvendname.value=jvendname[k-1];
          document.f1.txtlocality.value=jlocality[k-1];
          document.f1.txtcity.value=jcity[k-1];
            document.f1.txtstate.value=jstate[k-1];
            document.f1.slno.value=jslno[k-1];
            document.f1.cmbprodcode.value=jprodcode[k-1];
            document.f1.txtprodname.value=jprodname[k-1];
            document.f1.txtprodcat.value=jprodcat[k-1];
            document.f1.price.value=jprice[k-1];
            document.f1.quant.value=jquant[k-1];
            document.f1.amt.value=jamt[k-1];


      }
      function showVendor(){
         var jlocality1=new Array();
         var jcity1=new Array();
         var jstate1=new Array();
         var m,n;
          m=0;
          <%
          n=0;
          while(n<locality1.length)
          {
          %>
          jlocality1[m]="<%=locality1[n] %>";
          jcity1[m]="<%=city1[n] %>";
          jstate1[m]="<%=state1[n] %>";
          m=m+1;
          <%
          n=n+1;
          }
          %>
          n=document.f1.cmbvendname.selectedIndex;
          document.f1.txtlocality.value=jlocality1[n-1];
          document.f1.txtcity.value=jcity1[n-1];
		      document.f1.txtstate.value=jstate1[n-1];


      }

      function showProduct()
      {
        var jprodcat1=new Array();
		    var jprodname1=new Array();
		    var jprice1=new Array();
		  	var p,q;
		  	q=0;
	  	<%
           m=0;
           while(m < prodcat1.length)
           {
       %>
	    	jprodcat1[q]="<%=prodcat1[m] %>";
	    	jprodname1[q]="<%=prodname1[m] %>";
        jprice1[q]="<%=price1[m] %>";
		    q=q+1;
       <%
           m=m+1;
			}
       %>
		      p=document.f1.cmbprodcode.selectedIndex;
          document.f1.txtprodcat.value=jprodcat1[p-1];
    			document.f1.txtprodname.value=jprodname1[p-1];
    			document.f1.price.value=jprice1[p-1];
          setAmt();

      }
      function setAmt()
      {
    	  var price,quant,amt;
    	  price=document.f1.price.value;
    	  quant=document.f1.quant.value;
    	  amt=price*quant;
    	  document.f1.amt.value=amt;
      }

          </script>

          <script>
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
      Statement stmtfill,stmtshow,stmtshow1,stmtshow2;
      ResultSet rsfill,rsshow,rsshow1,rsshow2;
      String  orderno,vendname[],vendorname,prodcode[],productcode,locality[],city[],state[],slno[],prodcat[],prodname[],price[],amt[],quant[],datedet[];
      String locality1[],city1[],state1[],prodcat1[],prodname1[],price1[];
      int i,n,m;
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

  <h3 style="text-align:center;  margin-top: -17px; ">Order To Vendor Information &nbsp;<sup><small>Edit Information</small></sup></h3>
</div>

<div class="well" style="border-top: solid black;border-bottom: solid black ; margin-top:70px;">

            <div class="container">

           <form name="f1" id="myForm" action="orderinfofs.jsp" >
                <table  class="table table-borderless ">
                  <tr>
                  <td>Order NO:</td>
                  <td>   <div class="col-xs-8">
                     <select name="cmborderno" id="inputs" class="form-control input-sm" onchange="showOrder()">
                                      <option value="">-Select-</option>
                                       <%
                                           doConnect();
                                           try{
                                               stmtfill=conn.createStatement();
                                               rsfill=stmtfill.executeQuery("select * from tblorderinfo");
                                               while(rsfill.next()){
                                                   orderno=rsfill.getString("orderno");
                                                   %>
                                                   <option value="<%=orderno%>"><%=orderno%></option>
                                                   <%
                                               }
                                           }
                                           catch(SQLException se){
                                               out.println("Error 2");
                                           }
                                       %>
                                  </select></div></td>

                  <td>Date:</td>
                  <td><input type="date"  id="inputs" class="form-control input-sm" name="date"></td>
                          <tr>
                              <td>
                                  Vendor Name:
                              </td>
                              <td>
                                <div class="col-xs-8">
                                  <select name="cmbvendname"  id="inputs" class="form-control input-sm" onchange="showVendor()">
                                      <option value="">-Select-</option>
                                       <%
                                           doConnect();
                                           try{
                                               stmtfill=conn.createStatement();
                                               rsfill=stmtfill.executeQuery("select * from tblvendorinfo");
                                               while(rsfill.next()){
                                                   vendorname=rsfill.getString("vendname");
                                                   %>
                                                   <option value="<%=vendorname%>"><%= vendorname %></option>
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
                                  Locality:
                              </td>
                              <td>  <div class="col-xs-8">
                                  <input type="text"  id="inputs" class="form-control input-sm" name="txtlocality"  list="cities">
                                  </div>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  City:
                              </td>
                              <td>
                                <div class="col-xs-8">
                                  <input type="text"  id="inputs" class="form-control input-sm" name="txtcity" list="cities">
                                  </div>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  State:
                              </td>
                              <td>
                                <div class="col-xs-8">
                                  <input type="text"  id="inputs" class="form-control input-sm" name="txtstate" list="states"  >
                                  </div>
                              </td>
                          </tr>
                      </table>
                      <table  class="table table-borderless ">
                          <tr>
                              <td>Sl.no</td>
                              <td>Product Code</td>
                              <td>Product Name</td>
                              <td>Product Category</td>
                              <td>Price</td>
                              <td>Order Qty</td>
                              <td>Amount</td>
                          </tr>
                          <tr>
                          </tr>
                          <tr>
                              <td>

                                  <input type="number"  id="inputes" class="form-control input-sm" name="slno">

                              </td>
                              <td>

                              <select name="cmbprodcode" id="inputs" class="form-control input-sm" onchange="showProduct()">
                                    <option value="">-Select-</option>
                                     <%
                                         doConnect();
                                         try{
                                             stmtfill=conn.createStatement();
                                             rsfill=stmtfill.executeQuery("select * from tblproductdetails");
                                             while(rsfill.next()){
                                                 productcode=rsfill.getString("prodcode");
                                                 %>
                                                 <option value="<%=productcode%>"><%=productcode%></option>
                                                 <%
                                             }
                                         }
                                         catch(SQLException se){
                                             out.println("Error 2");
                                         }
                                     %>
                                </select>

                                </td>
                          <td>

                              <input type="text"  id="inputs" class="form-control input-sm" name="txtprodname">

                          </td>
                          <td>

                              <input type="text"  id="inputs" class="form-control input-sm"  name="txtprodcat">

                          </td>
                          <td>

                              <input type="text"  id="inputs" class="form-control input-sm"  name="price">

                          </td>
                          <td>

                              <input type="text" id="inputs" class="form-control input-sm"  name="quant" onchange="setAmt()">

                          </td>
                          <td>

                              <input type="text" id="inputs" class="form-control input-sm"  name="amt">

                          </td>

                            </tr>

                      </table>
                      <div class="button">
                          <input id="btn" class="btn btn-primary" type="submit" name="btnup" value="Update">
                          <input id="btn" class="btn btn-danger" type="submit" name="btndel" value="Delete" >
                          <input id="btn" class="btn btn-info" type="button" name="btnback" value="Back" onclick="window.open('orderinfoc.jsp','_self')">
                      </div>

                  </form>
                  <%@ include file="footer.jsp" %>
          </div>
          </div>
  </body>

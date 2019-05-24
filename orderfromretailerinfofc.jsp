
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%
 i=0;
odate=new String[30];
retname=new String[30];
locality=new String[30];
city=new String[30];
state=new String[30];
slno=new String[30];
prodcode=new String[30];
prodcat=new String[30];
prodname=new String[30];
price=new String[30];
quant=new String[30];
amt=new String[30];
 doConnect();
 try{
     stmtshow=conn.createStatement();
     rsshow=stmtshow.executeQuery("select * from tblorderretailinfo");
     while(rsshow.next())
     {
    	 odate[i]=rsshow.getString("odate");
    	 retname[i]=rsshow.getString("retname");
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
         System.out.println(amt[i]);
         i++;
     }
 }
 catch(SQLException s)
 {
     System.out.println("error");
  }
  %>


 <%
prodcat1=new String[30];
prodname1=new String[30];
price1=new String[30];
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


<%
n=0;
locality1=new String[30];
city1=new String[30];
state1=new String[30];
doConnect();
try{
  stmtshow1=conn.createStatement();
  rsshow1=stmtshow1.executeQuery("select * from tblretailerinfo ");
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

<html>
  <head>
    <title>Find Information</title>
  <%@ include file="header.jsp" %>
    <script lang="text/javascript">

    function showOrder()
    {
       var jdate1=new Array();
       var jretname1=new Array();
       var jlocality1=new Array();
        var jcity1=new Array();
        var jstate1=new Array();
        var jslno1=new Array();
        var jprodcode1=new Array();
        var jprodname1=new Array();
        var jprodcat1=new Array();
        var jprice1=new Array();
        var jquant1=new Array();
        var jamt1=new Array();
        var j,k;
        j=0;
        <%
        i=0;
        while(i<odate.length)
        {
        %>
        jdate1[j]="<%=odate[i] %>";
        jretname1[j]="<%=retname[i]%>";
        jlocality1[j]="<%=locality[i] %>";
        jcity1[j]="<%=city[i] %>";
        jstate1[j]="<%=state[i] %>";
        jslno1[j]="<%=slno[i] %>";
        jprodcode1[j]="<%= prodcode[i] %>";
        jprodcat1[j]="<%=prodcat[i] %>";
        jprodname1[j]="<%=prodname[i] %>";
        jprice1[j]="<%=price[i] %>";
        jquant1[j]="<%=quant[i] %>";
        jamt1[j]="<%=amt[i] %>";

        j=j+1;

        <%
        i=i+1;
        }
        %>

        k=document.f1.cmborderno.selectedIndex;
        document.f1.odate.value=jdate1[k-1];
        document.f1.cmbretailname.value=jretname1[k-1];
        document.f1.txtlocality.value=jlocality1[k-1];
        document.f1.txtcity.value=jcity1[k-1];
        document.f1.txtstate.value=jstate1[k-1];
        document.f1.slno.value=jslno1[k-1];
        document.f1.cmbprodcode.value=jprodcode1[k-1];
        document.f1.txtprodname.value=jprodname1[k-1];
        document.f1.txtprodcat.value=jprodcat1[k-1];
        document.f1.price.value=jprice1[k-1];
        document.f1.quant.value=jquant1[k-1];
        document.f1.amt.value=jamt1[k-1];


    }


    function showProduct(){
             var jprodcat=new Array();
             var jprodname=new Array();
             var jprice=new Array();
             var m,n;
        m=0;
      <%
             l=0;
             while(l < prodname1.length)
             {
         %>
      jprodcat[m]="<%=prodcat1[l] %>";
      jprodname[m]="<%=prodname1[l] %>";
      jprice[m]="<%=price1[l] %>";
      m=m+1;

         <%
             l=l+1;
        }
         %>
             n=document.f1.cmbprodcode.selectedIndex;
             document.f1.txtprodcat.value=jprodcat[n-1];
              document.f1.txtprodname.value=jprodname[n-1];
              document.f1.price.value=jprice[n-1];
      }

    function showRetail()
    {

    var jlocality=new Array();
    var jcity=new Array();
    var jstate=new Array();


        var j,k;
        j=0;
        <%
        i=0;
        while(i<locality1.length)
        {
        %>
        jlocality[j]="<%=locality1[i] %>";
        jcity[j]="<%=city1[i] %>";
        jstate[j]="<%=state1[i] %>";

        j=j+1;
        <%
        i=i+1;
        }
        %>
        k=document.f1.cmbretailname.selectedIndex;
        document.f1.txtlocality.value=jlocality[k-1];
        document.f1.txtcity.value=jcity[k-1];
        document.f1.txtstate.value=jstate[k-1];
          }
          </script>

  </head>
  <body>
    <%!
    Connection conn;
    Statement stmtfill,stmtshow,stmtshow1,stmtshow2;
    ResultSet rsfill,rsshow,rsshow1,rsshow2;
    String  orderno,retname[],vendorname,prodcode[],productcode,locality[],city[],state[],slno[],prodcat[],prodname[],price[],amt[],quant[],odate[];
    String retailname,locality1[],city1[],state1[],prodcat1[],prodname1[],price1[];
    int i,n,m,l;
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

    <h3   style="text-align:center;padding-bottom:15px;">Order From Retailer<sup><small>Edit Information</small></sup></h3>

    <div class="well" style="border-top: solid black;border-bottom: solid black ;" >
          <div class="container">
           <form name="f1" id="myForm" action="orderfromretailerinfofs.jsp" >
                  <table  class="table table-borderless ">
                  <tr>
                  <td>Order No:</td>

                  <td>    <div class="col-xs-8"> <select name="cmborderno"  id="inputs" class="form-control input-sm" onchange="showOrder()">
                                      <option value="">-Select-</option>
                                       <%
                                           doConnect();
                                           try{
                                               stmtfill=conn.createStatement();
                                               rsfill=stmtfill.executeQuery("select * from tblorderretailinfo");
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
                                  </select></div> </td>
                                  <td>
                                  </td>
                                  <td>
                                    Order Date:
                                  </td>
                                  <td>
                                    <div class="col-xs-8">
                                    <input type="date" id="inputs" class="form-control input-sm" name="odate">
                                    </div>
                                  </td>
                              </tr>
                              <td>
                                  Retailer Name:
                              </td>
                              <td>
                                <div class="col-xs-8">
                              <select name="cmbretailname" id="inputs" class="form-control input-sm" onchange="showRetail()">
                                      <option value="">-Select-</option>
                                       <%
                                           doConnect();
                                           try{
                                               stmtfill=conn.createStatement();
                                               rsfill=stmtfill.executeQuery("select * from tblretailerinfo");
                                               while(rsfill.next()){
                                                  retailname=rsfill.getString("retname");
                                                   %>
                                                   <option value="<%=retailname %>"><%=retailname %></option>
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

                                  </table>

                                  <table  class="table table-borderless ">
                          <tr>
                              <td>Sl. No:</td>
                              <td>Product Code:</td>
                              <td>Product Name:</td>
                              <td>Product Category:</td>
                              <td>Price:</td>
                              <td>Order Qty:</td>
                              <td>Amount:</td>
                          </tr>
                          <tr>
                          </tr>
                          <tr>
                              <td>
                                  <input type="number" id=" inputes" class="form-control input-sm"  name="slno">
                              </td>
                              <td><select name="cmbprodcode"id=" inputs" class="form-control input-sm"  onchange="showProduct()">
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
                                </select></td>
                                <td>

                                    <input type="text" id=" inputs" class="form-control input-sm" name="txtprodname">

                                </td>
                                <td>

                                    <input type="text" id=" inputs" class="form-control input-sm"  name="txtprodcat">

                                </td>
                                <td>

                                    <input type="text" id=" inputs" class="form-control input-sm"  name="price">

                                </td>
                                <td>

                                    <input type="text" id=" inputs" class="form-control input-sm" name="quant" onchange="setAmt()">

                                </td>
                                <td>

                                    <input type="text" id=" inputs" class="form-control input-sm"  name="amt">

                                </td>
                                </tr>
                                </table>
                      </table>
                      <div class="btn">
                          <input id="btn" class="btn btn-primary" type="submit" name="btnup" value="Update">
                          <input id="btn" class="btn btn-danger" type="submit" name="btndel" value="Delete" >
                          <input id="btn" class="btn btn-info" type="button" name="btnback" value="Back" onclick="window.open('orderfromretailerinfoc.jsp','_self')">
                      </div>

                  </form>
    <%@ include file="footer.jsp" %>
          </div>
          </div>
  </body>
</html>

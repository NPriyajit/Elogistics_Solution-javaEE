
<%@ page language="java" contentType="text/html" import="java.sql.*" %>


<%
     i=0;
     locality=new String[50];
     city=new String[50];
     state=new String[50];

	 doConnect();
	 try{
        stmtshow=conn.createStatement();
        rsshow=stmtshow.executeQuery("select * from tblvendorinfo ");
        while(rsshow.next())
        {
        	locality[i]=rsshow.getString("locality");
            city[i]=rsshow.getString("city");
            state[i]=rsshow.getString("state");

            i++;
        }
     }
     catch(SQLException ses)
     {
        System.out.println("Error"+ses);
     }


	%>

<%
prodcat=new String[50];
prodname=new String[50];
price=new String[50];
n=0;
doConnect();
try{
	 stmtshow1=conn.createStatement();
	 rsshow1=stmtshow1.executeQuery("select * from tblproductdetails");
	 while(rsshow1.next())
	 {
		   prodcat[n]=rsshow1.getString("prodcat");
           prodname[n]=rsshow1.getString("prodname");
           price[n]=rsshow1.getString("salesprice");
           n++;
	 }
}
 catch(SQLException ses)
{
   System.out.println("Error1"+ses);
}


%>



  <html>
  <head>
      <title>Order Information</title>
    <%@ include file="header.jsp" %>
      <script>

      function showVendor()
      {
        var jlocality=new Array();
        var jcity=new Array();
        var jstate=new Array();
          var j,k;
          j=0;
          <%
          i=0;
          while(i<locality.length)
          {
          %>
          jlocality[j]="<%=locality[i] %>";
          jcity[j]="<%=city[i] %>";
          jstate[j]="<%=state[i] %>";
          j=j+1;
          <%
          i=i+1;
          }
          %>
          k=document.f1.cmbvendname.selectedIndex;
          document.f1.txtlocality.value=jlocality[k-1];
          document.f1.txtcity.value=jcity[k-1];
		    document.f1.txtstate.value=jstate[k-1];


      }

      function showProduct(){
		   var jprodcat=new Array();
		   var jprodname=new Array();
		   var jprice=new Array();
			var j,k;
			j=0;
		<%
           i=0;
           while(i < prodcat.length)
           {
       %>
		jprodcat[j]="<%=prodcat[i] %>";
		jprodname[j]="<%=prodname[i] %>";
		jprice[j]="<%=price[i] %>";
		j=j+1;
       <%
           i=i+1;
			}
       %>
		    k=document.f1.cmbprodcode.selectedIndex;
           document.f1.txtprodcat.value=jprodcat[k-1];
			document.f1.txtprodname.value=jprodname[k-1];
			document.f1.price.value=jprice[k-1];
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



  </head>
  <body>
  
      <%!
      Connection conn;
      String locality[],city[],state[],prodname[],prodcat[],price[];
      Statement stmtfill,stmtshow,stmtshow1;
      ResultSet rsfill,rsshow,rsshow1;
      String vendname,prodcode;
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

      <div class="col-sm-4" style="margin-top:-10px;">
  <p style="margin-left:15px; float:left; font-size:14px; "><a href="elgo.html"><span style="padding:10px;  "
        class="glyphicon glyphicon-home"></span>Home</a></p>

  <p style="font-size:14px; margin-left:15px; float:left;"> <a href="about.html"><span style="padding:10px;  "
        class="glyphicon glyphicon-list-alt"></span>About Us</a></p>

  <p style="font-size:14px; margin-left:15px; float:left;"> <a href="contact.html"><span style="padding:10px;  "
        class="glyphicon glyphicon-earphone"></span>Contact Us</a></p>

</div>
<div class="col-sm-4">

  <h3 style="text-align:center;  margin-top: -7px; ">Order To Vendor Information</h3>
</div>

<div class="well" style="border-top: solid black;border-bottom: solid black ; margin-top:70px;">


            <div class="container">


            <form name="f1" id="myForm" action="orderinfos.jsp" >
                    <table  class="table table-borderless ">
                  <tr>
                  <td>Order NO:</td>
                  <td><div class="col-xs-8"><input type="text"  id="inputs" class="form-control input-sm" name="txtorderno"></div></td>
                  <td> </td>
                  <td>Date:</td>
                  <td><div class="col-xs-8"><input type="date"  id="inputs" class="form-control input-sm" style="width:150px;"  name="date"></div></td>
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
                                                   vendname=rsfill.getString("vendname");
                                                   %>
                                                   <option value="<%=vendname%>"><%=vendname%></option>
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
                                  <input type="text" name="txtlocality"  id="inputs" class="form-control input-sm" list="cities">
                              </div>

                              </td>
                          </tr>
                          <tr>
                              <td>
                                  City:
                              </td>
                              <td>
                              <div class="col-xs-8">
                                  <input type="text" name="txtcity"  id="inputs" class="form-control input-sm" list="cities">
                              </div>
                              </td>
                          </tr>
                          <tr>
                              <td>
                                  State:
                              </td>
                              <td>
                              <div class="col-xs-8">
                                  <input type="text" name="txtstate"  id="inputs" class="form-control input-sm" list="states"  >
                              </div>
                              </td>
                          </tr>
                      </table>
                      <table class="table table-borderless " >
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

                                  <input type="number" id="inputes" class="form-control input-sm" name="slno">
                              </div>
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
                                                 prodcode=rsfill.getString("prodcode");
                                                 %>
                                                 <option value="<%=prodcode%>"><%=prodcode%></option>
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

                              <input type="text"  id="inputs" class="form-control input-sm" name="txtprodcat">

                          </td>

                          <td>

                              <input type="text"  id="inputs" class="form-control input-sm"  name="price">

                          </td>

                          <td>


                              <input type="text"  id="inputs" class="form-control input-sm"  name="quant" onchange="setAmt()">

                          </td>

                          <td>

                              <input type="text" id="inputs" class="form-control input-sm"  name="amt">

                          </td>

                            </tr>

                      </table>
                      <div class="btn">
                          <input id="btn" class="btn btn-primary" type="submit" name="btnsub" value="Submit">
                          <input id="btn" class="btn btn-danger" type="submit" name="btnres" value="Reset" onclick="choose()">
                          <input id="btn" class="btn btn-info" type="button" name="btnfind" value="Find" onclick="window.open('orderinfofc.jsp','_self')">
                      </div>

                  </form>
              <%@ include file="footer.jsp" %>
              </div>
          </div>
  </body>

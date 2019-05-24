<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%
     i=0;
     vendname=new String[50];
     prodcat=new String[50];
     prodname=new String[50];
  	 hsn=new String[50];
  	 gst=new String[50];
  	 purchase=new String[50];
  	 sales=new String[50];
  	 opening=new String[50];
	 doConnect();
	 try{
        stmtshow=conn.createStatement();
        rsshow=stmtshow.executeQuery("select * from tblproductdetails ");
        while(rsshow.next())
        {
            vendname[i]=rsshow.getString("vendname");
            prodcat[i]=rsshow.getString("prodcat");
            prodname[i]=rsshow.getString("prodname");
            hsn[i]=rsshow.getString("hsn");
            gst[i]=rsshow.getString("gst");
            purchase[i]=rsshow.getString("purchaseprice");
            sales[i]=rsshow.getString("salesprice");
	        opening[i]=rsshow.getString("openingstock");
            i++;
        }
     }
     catch(SQLException ses)
     {
        System.out.println("Error"+ses);
     }

	%>
<html>
<head>
    <title>
        Find Information
    </title>
    <%@ include file="header.jsp" %>
    <script lang="javascript">
	   function showProduct(){
		   var jvendname=new Array();
		   var jprodcat=new Array();
		   var jprodname=new Array();
		   var jhsn=new Array();
		   var jgst=new Array();
		   var jpurchase=new Array();
		   var jsales=new Array();
		   var jopening=new Array();
		   var j,k;
			j=0;
		<%
            k=0;
            while(k < vendname.length)
            {
        %>
        jvendname[j]="<%=vendname[k] %>";
    		jprodcat[j]="<%=prodcat[k] %>";
    		jprodname[j]="<%=prodname[k] %>";
    		jhsn[j]="<%=hsn[k] %>";
    		jgst[j]="<%=gst[k] %>";
    		jpurchase[j]="<%=purchase[k] %>";
    		jsales[j]="<%=sales[k] %>";
    		jopening[j]="<%=opening[k] %>";
    		j=j+1;
        <%
            k=k+1;
			}
        %>
		    k=document.f1.cmbprodcode.selectedIndex;
            document.f1.cmbvendname.value=jvendname[k-1];
            document.f1.cmbproductcat.value=jprodcat[k-1];
  			document.f1.txtprodname.value=jprodname[k-1];
            document.f1.txthsn.value=jhsn[k-1];
  			document.f1.cmbgst.value=jgst[k-1];
  			document.f1.txtpurchase.value=jpurchase[k-1];
  			document.f1.txtsales.value=jsales[k-1];
  			document.f1.txtopeningstock.value=jopening[k-1];
     }

    </script>
</head>
<body>

    <%!
    Connection conn;
    Statement stmtfill,stmtshow,stmtfill1,stmtshow1,stmtshow2,stmtfill2;
    ResultSet rsfill,rsshow,rsfill1,rsshow1,rsshow2,rsfill2;
    String  vendorname,prodcode,productcat,vendname[],prodcat[],prodname[],hsn[],gst[],purchase[],sales[],opening[] ;
    int i,k;
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
      
        <h3 style="text-align:center;  margin-top: -7px; ">Product Information<sup><small>Edit Information</small></sup></h3>
      </div>
      
      <div class="well" style="border-top: solid black;border-bottom: solid black ; margin-top:70px;">

          <div class="container">

                  <form name="f1" id="myForm" action="productfs.jsp" >
                    <table  class="table table-borderless ">

                      <tr>
                        <td>
                             Product Code:
                         </td>
                         <td>
                           <div class="col-xs-8">
                                 <select name="cmbprodcode"  id="inputs" class="form-control input-sm" onchange="showProduct()">
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
                                     </select></div>
                         </td>
                     </tr>


                            <tr>
                                <td>
                                    Vendor Name:
                                </td>
                                <td>
                                    <div class="col-xs-8">
                                    <select name="cmbvendname"  id="inputs" class="form-control input-sm" >
                                        <option value="">-Select-</option>
                       <%
                           doConnect();
                           try{
                           stmtfill1=conn.createStatement();
                           rsfill1=stmtfill1.executeQuery("select * from tblvendorinfo");
                           while(rsfill1.next()){
                             vendorname=rsfill1.getString("vendname");
                             %>
                             <option value="<%=vendorname%>"><%=vendorname%></option>
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
                                    Product Category:
                                </td>
                                <td>
                                <div class="col-xs-8">
                                    <select name="cmbproductcat"  id="inputs" class="form-control input-sm" >
                                        <option value="">-Select-</option>
                       <%
                           doConnect();
                           try{
                           stmtfill2=conn.createStatement();
                           rsfill2=stmtfill2.executeQuery("select * from tblproductinfo");
                           while(rsfill2.next()){
                             productcat=rsfill2.getString("prodcatname");
                             %>
                             <option value="<%=productcat%>"><%=productcat%></option>
                             <%
                           }
                         }
                         catch(SQLException se){
                           out.println("Error 2");
                         }
                       %>
                                    </select></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   Product Name:
                                </td>
                                <td>
                                <div class="col-xs-8">
                                    <input type="text" name="txtprodname"   id="inputs" class="form-control input-sm" autocomplete="on">
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    HSN Code:
                                </td>
                                <td>
                                <div class="col-xs-8">
                                    <input type="text"  id="inputs" class="form-control input-sm" name="txthsn" >
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    GST Slab:
                                </td>
                                <td>
                                <div class="col-xs-8">
                                    <select name="cmbgst"    id="inputs" class="form-control input-sm" required>
                                    <option>-Select-</option>
                                    <option>5.00</option>
                                    <option>12.00</option>
                                    <option>18.00</option>
                                    <option>28.00</option>
                                    </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Purchase Price:
                                </td>
                                <td>
                                <div class="col-xs-8">
                                    <input type="text"  id="inputs" class="form-control input-sm" name="txtpurchase" >
                                    </div>
                                </td>
                                <td>
                                    Sales Price:
                                </td>
                                <td>
                                </td>
                                <td>
                                <div class="col-xs-8">
                                    <input type="text"  id="inputs" class="form-control input-sm" name="txtsales">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Opening Stock:
                                </td>
                                <td>
                                <div class="col-xs-8">
                                    <input type="text"  id="inputs" class="form-control input-sm" name="txtopeningstock">
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="btn">
                            <input id="btn" class="btn btn-primary" type="submit" name="btnup" value="Update">
                            <input id="btn" class="btn btn-danger" type="submit" name="btndel" value="Delete" onclick="choose()">
                            <input id="btn" class="btn btn-info" type="button" name="btnback" value="Back" onclick="window.open('productfc.jsp','_self')">
                        </div>
                </form>

      <%@ include file="footer.jsp" %>
        </div>
</body>
</html>

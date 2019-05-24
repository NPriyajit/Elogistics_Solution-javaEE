<%@ page language="java" import="java.sql.*" contentType="text/html"%>

<html>
<head>
    <title>
        Product Information
    </title>
  <%@ include file="header.jsp"%>

</head>
<body>



      <div class="col-sm-4" style="margin-top:-10px;">
        <p style="margin-left:15px; float:left; font-size:14px; "><a href="elog.html"><span style="padding:10px;  "
              class="glyphicon glyphicon-home"></span>Home</a></p>
      
        <p style="font-size:14px; margin-left:15px; float:left;"> <a href="about.html"><span style="padding:10px;  "
              class="glyphicon glyphicon-list-alt"></span>About Us</a></p>
      
        <p style="font-size:14px; margin-left:15px; float:left;"> <a href="contact.html"><span style="padding:10px;  "
              class="glyphicon glyphicon-earphone"></span>Contact Us</a></p>
      
      </div>
      <div class="col-sm-4">
      
        <h3 style="text-align:center;  margin-top: -7px; ">Product Information</h3>
      </div>
      
      <div class="well" style="border-top: solid black;border-bottom: solid black ; margin-top:70px;">
      
        <div class="container">

    <%!
    Connection conn;
    Statement stmtfill1,stmtfill2;
    ResultSet rsfill1,rsfill2;
    String vendorname,productcat;
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


          <form name="f1" id="myForm" action="products.jsp" >
                <table  class="table table-borderless ">
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
                                </div>
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
                                Product Code:
                            </td>
                            <td>
                            <div class="col-xs-8">
                                <input type="text" name="txtprodcode"  id="inputs" class="form-control input-sm" required>
                               </div>
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
                        <input id="btn" class="btn btn-primary" type="submit" name="btnsub" value="Submit">
                        <input id="btn" class="btn btn-danger" type="submit" name="btnres" value="Reset" >
                        <input id="btn" class="btn btn-info" type="button" name="btnfind" value="Find" onclick="window.open('productfc.jsp','_self')">
                    </div>
                </form>

                      <%@ include file="footer.jsp" %>

                    </div>
                </div>
</body>
</html>

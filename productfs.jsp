<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<head>
  <link rel="icon" type="image/ico" href="./images/imageicon.png" />
<title>User Regd</title>

</head>

<body>

 
 <%!
 Statement stmtUpdate,stmtDelete;
 String  vendname,prodcat,prodcode,prodname,hsn,gst,purchase,sales,opening,update,delete; 
 Connection conn;
 public void doConnect()
    {
      try
      {
        Class.forName("sun.jdbc.odbc.JdbcodbcDriver");
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
 prodname=request.getParameter("cmbprodname");
 vendname=request.getParameter("cmbvendname");
 prodcat=request.getParameter("cmbproductcat");
 prodcode=request.getParameter("txtprodcode");
 hsn=request.getParameter("txthsn");
 gst=request.getParameter("cmbgst");
 purchase=request.getParameter("txtpurchase");
 sales=request.getParameter("txtsales");
 opening=request.getParameter("txtopeningstock");  
 update =request.getParameter("btnup");
 delete= request.getParameter("btndel");


if(update!=null)
		{
		
			try
			{
				doConnect();
				stmtUpdate=conn.createStatement();
				stmtUpdate.executeUpdate("update tblproductdetails set vendname='"+vendname+"',prodcat='"+prodcat+"', prodcode='"+prodcode+"', hsn='"+hsn+"',  gst='"+gst+"', purchaseprice='"+purchase+"', salesprice='"+sales+"', openingstock='"+opening+"' where prodname='"+prodname+"'");
				out.println("<table style=' align:center; padding:60px; margin-left:70px;\'>");
						out.println("  <tr><td></td><td ><img src='./images/added.gif' style='width:522px; left:50px;  height:400px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-90px;'>Data Updated successfully</p></td></tr>");
						 out.println("<tr><td></td><td></td><td></td>");
						  out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"productc.jsp\",\"_SELF\")'>Back</button></td>");
						  out.println("</tr> </table>");

			}
			catch(SQLException sc)
			{
					out.println("<div style='background-color:black; width:100%; height:100%;\'> <hr style='padding:100px; border: 1px solid white;\'> <h1 style='padding:50px; color:white; font-weight: 800; font-size:50px; text-align: center;\'>ERROR</h1> <hr style=' border: 1px solid white;\'> <p style='padding:50px; color:white; text-align:center; font-weight: 400; font-size:20px;\'>Sorry Error Happens!! Go Back</p></div>");
			}
		}
		else if(delete!=null){
		
			try
			{
				doConnect();
				stmtDelete=conn.createStatement();
				stmtDelete.executeUpdate("delete from tblproductdetails where prodname='"+prodname+"'");
				out.println("<table style=' align:center; padding:60px; margin-left:70px;\'>");
						out.println("  <tr><td ><img src='./images/delete.gif' style='width:582px; left:50px;  height:470px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-60px;'>Data Deleted successfully</p></td></tr>");
						 out.println("<tr><td></td><td></td><td></td>");
						  out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"productc.jsp\",\"_SELF\")'>Back</button></td>");
						  out.println("</tr> </table>");
			}
			catch(SQLException sq)
			{
				out.println("Unable to Delete");
			}
		}
		
	%>

</body>
</html>
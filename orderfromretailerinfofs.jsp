<%@ page language="java" contentType="text/html" import="java.sql.*" %>


<html>
<head>
<title>Order Retailer Info</title>
<link rel="icon" type="image/ico" href="./images/imageicon.png" />
</head>

<body>


 <%!
 Statement stmtSave,stmtdel;
 String  orderno,odate,retname,locality,city,state,slno,prodcode,prodname,prodcat,price,quant,amt,btnup,btndel;
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
 orderno=request.getParameter("cmborderno");
 odate=request.getParameter("odate");
 retname=request.getParameter("cmbretailname");
 locality=request.getParameter("txtlocality");
 city=request.getParameter("txtcity");
 state=request.getParameter("txtstate");
 slno=request.getParameter("slno");
 prodcode=request.getParameter("cmbprodcode");
 prodname=request.getParameter("txtprodname");
 prodcat=request.getParameter("txtprodcat");
 price=request.getParameter("price");
 quant=request.getParameter("quant");
 amt=request.getParameter("amt");
 btnup=request.getParameter("btnup");
 btndel=request.getParameter("btndel");


 if(btnup !=null)
	{
 doConnect();
 try{
	 stmtSave=conn.createStatement();
	 stmtSave.executeUpdate("update tblorderretailinfo set odate='"+odate+"',retname='"+retname+"',locality='"+locality+"',city='"+city+"',state='"+state+"',slno='"+slno+"',prodcode='"+prodcode+"',prodname='"+prodname+"',prodcat='"+prodcat+"',price='"+price+"',quant='"+quant+"',amt='"+amt+"' where orderno='"+orderno+"'");
	 out.println("<table style=' align:center; padding:60px; margin-left:70px;\'>");
		out.println("  <tr><td ><img src='./images/added.gif' style='width:482px; left:50px;  height:400px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-60px;'>Data Updated successfully</p></td></tr>");
		 out.println("<tr><td></td><td></td><td></td>");
		  out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"orderfromretailerinfofc.jsp\",\"_SELF\")'>Back</button></td>");
		  out.println("</tr> </table>");

 }
 catch(SQLException e)
 {
	 System.out.println("error"+e);
 }
}


else if(btndel != null)
{
	doConnect();

	try
	{
		stmtdel=conn.createStatement();
		stmtdel.executeUpdate("delete from tblorderretailinfo where orderno='"+orderno+"' ");
		out.println("<table style=' align:center; padding:60px; margin-left:70px;\'>");
				out.println("  <tr><td ><img src='./images/delete.gif' style='width:582px; left:50px;  height:470px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-60px;'>Data Deleted successfully</p></td></tr>");
				 out.println("<tr><td></td><td></td><td></td>");
				  out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"orderfromretailerinfofc.jsp\",\"_SELF\")'>Back</button></td>");
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

<%@ page language="java" contentType="text/html" import="java.sql.*" %>


<html>
<head>
<title>Receipt Information</title>
</head>

<body>


 <%!
 Statement stmtSave,stmtdel;
 String  vouchno,vdate,retname,locality,city,state,recmode,refno,refdate,bankname,amt,btndel,btnup;
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
 vouchno=request.getParameter("cmbvouchno");
vdate=request.getParameter("vdate");
 retname=request.getParameter("cmbretname");
 locality=request.getParameter("txtlocality");
 city=request.getParameter("txtcity");
 state=request.getParameter("txtstate");
 recmode=request.getParameter("recmode");
 refno=request.getParameter("refno");
 refdate=request.getParameter("refdate");
 bankname=request.getParameter("bankname");
 amt=request.getParameter("amt");
 btnup=request.getParameter("btnup");
 btndel=request.getParameter("btndel");



 if(btnup !=null)
	{
 doConnect();
 try{
	 stmtSave=conn.createStatement();
	 stmtSave.executeUpdate("update tblreceiptinfo  set vdate='"+vdate+"',retname='"+retname+"',locality='"+locality+"',city='"+city+"',state='"+state+"',recmode='"+recmode+"',refno='"+refno+"',refdate='"+refdate+"',bankname='"+bankname+"',amt='"+amt+"' where vouchno='"+vouchno+"'");
   out.println("<table style=' align:center; padding:60px; margin-left:70px;\'>");
		out.println("  <tr><td ><img src='./images/added.gif' style='width:482px; left:50px;  height:400px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-60px;'>Data Updated successfully</p></td></tr>");
		 out.println("<tr><td></td><td></td><td></td>");
		  out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"receiptvoucherinfofc.jsp\",\"_SELF\")'>Back</button></td>");
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
		stmtdel.executeUpdate("delete from tblreceiptinfo where vouchno='"+vouchno+"' ");
		out.println("<table style=' align:center; padding:60px; margin-left:70px;\'>");
				out.println("  <tr><td ><img src='./images/delete.gif' style='width:582px; left:50px;  height:470px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-60px;'>Data Deleted successfully</p></td></tr>");
				 out.println("<tr><td></td><td></td><td></td>");
				  out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"receiptvoucherinfofc.jsp\",\"_SELF\")'>Back</button></td>");
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

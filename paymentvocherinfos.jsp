<%@ page language="java" contentType="text/html" import="java.sql.*" %>


<html>
<head>
<title>Payment Information</title>
<link rel="icon" type="image/ico" href="./images/imageicon.png" />
</head>

<body>


 <%!
 Statement stmtSave;
 String  vouchno,vdate,vendname,locality,city,state,paymode,refno,refdate,bankname,amt;
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
 vouchno=request.getParameter("txtvouchno");
vdate=request.getParameter("vdate");
 vendname=request.getParameter("cmbvendname");
 locality=request.getParameter("txtlocality");
 city=request.getParameter("txtcity");
 state=request.getParameter("txtstate");
 paymode=request.getParameter("paymode");
 refno=request.getParameter("refno");
 refdate=request.getParameter("refdate");
 bankname=request.getParameter("bankname");
 amt=request.getParameter("amt");

 doConnect();
 try{
	 stmtSave=conn.createStatement();
	 stmtSave.executeUpdate("insert into tblpaymentinfo values('"+vouchno+"','"+vdate+"','"+vendname+"','"+locality+"','"+city+"','"+state+"','"+paymode+"','"+refno+"','"+refdate+"','"+bankname+"','"+amt+"')");
   out.println("<table style='align:center; padding:60px; margin-left:70px;\'>");
    out.println("  <tr><td ><img src='./images/submit.gif' style='width:582px; left:50px;  height:470px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-60px;'>Data Added successfully</p></td></tr>");
     out.println("<tr><td></td><td></td><td></td>");
      out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"paymentvoucherinfoc.jsp\",\"_SELF\")'>Back</button></td>");
      out.println("</tr> </table>");
 }
 catch(SQLException e)
 {
	 System.out.println("error"+e);
 }
%>

</body>
</html>

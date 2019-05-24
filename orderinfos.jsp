<%@ page language="java" contentType="text/html" import="java.sql.*" %>


<html>
<head>
<title>Order Info</title>
<link rel="icon" type="image/ico" href="./images/imageicon.png" />
</head>

<body>

 
 <%!
 Statement stmtSave;
 String  orderno,datedet,vendname,locality,city,state,slno,prodcode,prodname,prodcat,price,quant,amt;
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
 orderno=request.getParameter("txtorderno");
datedet=request.getParameter("date");
 vendname=request.getParameter("cmbvendname");
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

 doConnect();
 try{
	 stmtSave=conn.createStatement();
	 stmtSave.executeUpdate("insert into tblorderinfo values('"+orderno+"','"+datedet+"','"+vendname+"','"+locality+"','"+city+"','"+state+"','"+slno+"','"+prodcode+"','"+prodname+"','"+prodcat+"','"+price+"','"+quant+"','"+amt+"')");
  out.println("<table style=' align:center; padding:60px; margin-left:70px;\'>");
    out.println("  <tr><td ><img src='./images/submit.gif' style='width:582px; left:50px;  height:470px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-60px;'>Data Added successfully</p></td></tr>");
     out.println("<tr><td></td><td></td><td></td>");
      out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"orderinfoc.jsp\",\"_SELF\")'>Back</button></td>");
      out.println("</tr> </table>");
 }
 catch(SQLException e)
 {
	 System.out.println("error"+e);
 }
%>

</body>
</html>
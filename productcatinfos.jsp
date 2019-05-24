<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<head>
<title>Product category</title>
<link rel="icon" type="image/ico" href="./images/imageicon.png" />
</head>

<body>


 <%!
 Statement stmtSave;
 String  prodno,prodname;
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
 prodno=request.getParameter("txtprodcatcode");
 prodname=request.getParameter("txtprodcatname");

 doConnect();
 try{
	 stmtSave=conn.createStatement();
	 stmtSave.executeUpdate("insert into tblproductinfo values('"+prodno+"','"+prodname+"')");
  out.println("<table style=' align:center; padding:60px; margin-left:70px;\'>");
    out.println("  <tr><td ><img src='./images/submit.gif' style='width:582px; left:50px;  height:470px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-60px;'>Data Added successfully</p></td></tr>");
     out.println("<tr><td></td><td></td><td></td>");
      out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"productcatinfoc.html\",\"_SELF\")'>Back</button></td>");
      out.println("</tr> </table>");
 }
 catch(SQLException e)
 {
	 System.out.println("error"+e);
 }
%>

</body>
</html>

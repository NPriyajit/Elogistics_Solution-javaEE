<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<head>
  <link rel="icon" type="image/ico" href="./images/imageicon.png" />
<title>Product Info</title>

</head>

<body>


 <%!
 Statement stmtSave;
 String  vendname,prodcat,prodcode,prodname,hsn,gst,purchase,sales,opening ;
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
 vendname=request.getParameter("cmbvendname");
 prodcat=request.getParameter("cmbproductcat");
 prodcode=request.getParameter("txtprodcode");
 prodname=request.getParameter("txtprodname");
 hsn=request.getParameter("txthsn");
 gst=request.getParameter("cmbgst");
 purchase=request.getParameter("txtpurchase");
 sales=request.getParameter("txtsales");
 opening=request.getParameter("txtopeningstock");

 doConnect();
 try{
	 stmtSave=conn.createStatement();
	 stmtSave.executeUpdate("insert into tblproductdetails values('"+vendname+"','"+prodcat+"','"+prodcode+"','"+prodname+"','"+hsn+"','"+gst+"','"+purchase+"','"+sales+"','"+opening+"')");
  out.println("<table style=' align:center; padding:60px; margin-left:70px;\'>");
    out.println("  <tr><td ><img src='./images/submit.gif' style='width:582px; left:50px;  height:470px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-60px;'>Data Added successfully</p></td></tr>");
     out.println("<tr><td></td><td></td><td></td>");
      out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"productc.jsp\",\"_SELF\")'>Back</button></td>");
      out.println("</tr> </table>");
 }
 catch(SQLException e)
 {
	 System.out.println("error"+e);
 }
%>

</body>
</html>

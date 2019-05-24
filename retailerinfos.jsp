<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<head>
<title>Retailer Info</title>
<link rel="icon" type="image/ico" href="./images/imageicon.png" />
</head>

<body>


 <%!
 Statement stmtSave;
 String   retailno, retailname,contactper,locality,city,state,phoneno,fax,datedet,gstno,ccode,emailid,website,username,password;
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
 retailno=request.getParameter("txtretno");
 retailname=request.getParameter("txtretname");
 contactper=request.getParameter("txtcontper");
 locality=request.getParameter("txtlocality");
 city=request.getParameter("txtcity");
 state=request.getParameter("txtstate");
 ccode=request.getParameter("countrycode");
 phoneno=request.getParameter("numphno");
 fax=request.getParameter("txtfax");
datedet=request.getParameter("date");
 gstno=request.getParameter("txtgst");
 emailid=request.getParameter("email");
 website=request.getParameter("urlvend");
 username=request.getParameter("txtuname");
 password=request.getParameter("pass");

 doConnect();
 try{
	 stmtSave=conn.createStatement();
	 stmtSave.executeUpdate("insert into tblretailerinfo values('"+ retailno+"','"+ retailname+"','"+contactper+"','"+locality+"','"+city+"','"+state+"','"+ccode+"','"+phoneno+"','"+fax+"','"+gstno+"','"+emailid+"','"+website+"','"+datedet+"','"+username+"','"+password+"')");
  out.println("<table style=' align:center; padding:60px; margin-left:70px;\'>");
    out.println("  <tr><td ><img src='./images/submit.gif' style='width:582px; left:50px;  height:470px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-60px;'>Data Added successfully</p></td></tr>");
     out.println("<tr><td></td><td></td><td></td>");
      out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"retailerinfoc.html\",\"_SELF\")'>Back</button></td>");
      out.println("</tr> </table>");
 }
 catch(SQLException e)
 {
	 System.out.println("error"+e);
 }
%>

</body>
</html>

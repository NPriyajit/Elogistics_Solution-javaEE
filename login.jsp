
<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
<head>
<link rel="icon" type="image/ico" href="./images/imageicon.png" />
<title>Authentication Procedure</title>
</head>
<body>


<%@ include file="header.jsp" %>
   <%!
      Connection conn;
      String uname,password,getuname,getpass;
      Statement stmtfill,stmtfill1;
      ResultSet rsshow,rsshow1;
      int i,n;
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

<%
 uname=request.getParameter("uname");
  password=request.getParameter("pword");
 session=request.getSession();
  session.setAttribute("ssun",uname);
  session.setMaxInactiveInterval(5*60);

     doConnect();
        try{
            stmtfill=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            stmtfill1=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            rsshow=stmtfill.executeQuery("select * from tbllogininfo where uname='"+uname+"' and pword='"+password+"'");
            rsshow1=stmtfill1.executeQuery("select * from tblretailerinfo where username='"+uname+"' and password='"+password+"'");
        }
        catch(SQLException e)
        {
            System.out.println("Error");
        }
 if(rsshow.next())
 {
         out.println("<br><h1><center>Just a sec.....</center></h1>");
         %>
         <script>
             window.open("elog.html","_SELF");
         </script>
         <%

     }
     else
     {
      if(rsshow1.next())
     {
         out.println("<br><h1><center>Just a sec.....</center></h1>");
         %>
         <script>
             window.open("eloguser.jsp","_SELF");
         </script>
         <%
         
     }
     else{
         out.println("<h1><center> Unautorized User</center></h1>");
         %>
         <script>
        setTimeout(() => { window.open("index.html","_SELF"); }, 10000);
         </script>
         <%
     
     }
     }
 %>
 </body>
 </html>

<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<title>Report Product Category</title>
<%@ include file="header.jsp" %>
<head>


</head>

<body>

    <%!
    Connection conn;
    Statement stmtfill,stmtshow;
    ResultSet rsfill,rsshow;
      String prodcatcode,prodcatname ;
    int i,sl;
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




      <h3   style="text-align:center;padding-bottom:15px;">Product Information &nbsp;<sup><small class="text-muted">Report</small></sup></h3>


    <div class="well" style="border-top: solid black;border-bottom: solid black ;" >

      <h4>  NAJ Electronics</h4>
      <h4>  College Square</h4>
      <h4>  Cuttack-01</h4>
      <table  style="margin-top:40px; border:2px solid black; font-size:12px;"class="table ">
        <tr>
            <td>Sl.no</td>
            <td>Product Category Code</td>
            <td>Product Category Name</td>
        </tr>
        <%
        doConnect();
        try{
            stmtfill=conn.createStatement();
            rsshow=stmtfill.executeQuery("select * from tblproductinfo");
            i=0;
            sl=0;
            while(rsshow.next())
            {
                prodcatcode =rsshow.getString("prodcatcode");
          	    prodcatname =rsshow.getString("prodcatname");
                sl++;

            %>


            <tr>
                <td><%= sl%></td>
                <td><%= prodcatcode %></td>
                <td><%= prodcatname %></td>
               

              </tr>
          <%
          i++;
        }
      }
      catch(SQLException es)
      {
        System.out.println("error");
      }
  %>


      </table>
<%@ include file="footer.jsp" %>


</div>


</body>

</html>

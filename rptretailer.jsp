
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<title>Report Retailer Information</title>
<%@ include file="header.jsp" %>
<head>


</head>

<body>

    <%!
    Connection conn;
    Statement stmtfill,stmtshow;
    ResultSet rsfill,rsshow;
    String  retno ,retname ,contactper ,locality ,city ,state ,phoneno ,fax ,gdate ,gstno ,ccode ,emailid ,website, username, password ;
    int i,slno;
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




      <h3   style="text-align:center;padding-bottom:15px;">Retailer Information &nbsp;<sup><small class="text-muted">Report</small></sup></h3>


    <div class="well" style="border-top: solid black;border-bottom: solid black ;" >

      <h4>  NAJ Electronics</h4>
      <h4>  College Square</h4>
      <h4>  Cuttack-01</h4>
      <table  style="margin-top:40px; border:2px solid black; font-size:12px;"class="table ">
        <tr>
            <td>Sl.no</td>
            <td>Retailer Code</td>
            <td>Retailer Name</td>
            <td>Contact Person</td>
            <td>Locality</td>
            <td>City</td>
            <td>State</td>
            <td>Phone No</td>
            <td>Fax</td>
            <td>Gst No</td>
            <td>Date</td>
            <td>Email Id</td>
            <td>Website</td>
            <td>Username</td>

        </tr>
        <%
        doConnect();
        try{
            stmtfill=conn.createStatement();
            rsfill=stmtfill.executeQuery("select * from tblretailerinfo");
            i=0;
            slno=0;
            while(rsfill.next())
            {
                retno =rsfill.getString("retno");
                retname =rsfill.getString("retname");
                contactper=rsfill.getString("contper");
                locality =rsfill.getString("locality");
                city =rsfill.getString("city");
                state =rsfill.getString("state");
                phoneno =rsfill.getString("phoneno");
                fax =rsfill.getString("fax");
                gstno =rsfill.getString("gstno");
                emailid =rsfill.getString("emailid");
                website =rsfill.getString("website");
                gdate =rsfill.getString("datedetails");
                username=rsfill.getString("username");

                slno++;

            %>
            <tr>
                <td><%=slno %></td>
                <td><%= retno %></td>
                <td><%=retname %></td>
                <td><%=contactper %></td>
                <td><%=locality %></td>
                <td><%=city %></td>
                <td><%=state %></td>
                <td><%=phoneno %></td>
                <td><%=fax %></td>
                <td><%=gstno %></td>
                <td><%=gdate %></td>
                <td><%=emailid %></td>
                <td><%=website %></td>
                <td><%=username %></td>
                
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


<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<title>Report Vendor Information</title>
<%@ include file="header.jsp" %>
<head>


</head>

<body>

    <%!
    Connection conn;
    Statement stmtfill,stmtshow;
    ResultSet rsfill,rsshow;
    String  vendno ,vendname ,contactper ,locality ,city ,state ,phoneno ,fax ,gdate ,gstno ,ccode ,emailid ,website ;
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




      <h3   style="text-align:center;padding-bottom:15px;">Vendor Information &nbsp;<sup><small class="text-muted">Report</small></sup></h3>


    <div class="well" style="border-top: solid black;border-bottom: solid black ;" >

      <h4>  NAJ Electronics</h4>
      <h4>  College Square</h4>
      <h4>  Cuttack-01</h4>
      <table  style="margin-top:40px; border:2px solid black; font-size:12px;"class="table ">
        <tr>
            <td>Sl.no</td>
            <td>Vendor Code</td>
            <td>Venor Name</td>
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
        </tr>
        <%
        doConnect();
        try{
            stmtfill=conn.createStatement();
            rsfill=stmtfill.executeQuery("select * from tblvendorinfo");
            i=0;
            slno=0;
            while(rsfill.next())
            {
                vendno =rsfill.getString("vendno");
                vendname =rsfill.getString("vendname");
                contactper =rsfill.getString("contactper");
                locality =rsfill.getString("locality");
                city =rsfill.getString("city");
                state =rsfill.getString("state");
                ccode =rsfill.getString("ccode");
                phoneno =rsfill.getString("phoneno");
                fax =rsfill.getString("fax");
                gstno =rsfill.getString("gstno");
                emailid =rsfill.getString("emailid");
                website =rsfill.getString("website");
                gdate =rsfill.getString("datedetails");
                slno++;

            %>
            <tr>
                <td><%=slno %></td>
                <td><%= vendno %></td>
                <td><%=vendname %></td>
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

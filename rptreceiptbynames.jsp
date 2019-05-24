
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<title>Report Receipt Information</title>
<%@ include file="header.jsp" %>
<head>


</head>

<body>

    <%!
    Connection conn;
    Statement stmtfill,stmtshow;
    ResultSet rsfill,rsshow;
    String  vouchno, vdate, retname,locality,city,state,bankname,refno,recmode,refdate,amt,sretname;
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
<%
sretname=request.getParameter("cmbretname");
%>



      <h3   style="text-align:center;padding-bottom:15px;">Receipt Information [<%= sretname %> ] &nbsp;<sup><small class="text-muted">Report</small></sup></h3>


    <div class="well" style="border-top: solid black;border-bottom: solid black ;" >

      <h4>  NAJ Electronics</h4>
      <h4>  College Square</h4>
      <h4>  Cuttack-01</h4>
      <table  style="margin-top:40px; border:2px solid black; font-size:12px;"class="table ">
        <tr>
            <td>Sl.no</td>
            <td>Voucher No</td>
            <td>Voucher Date</td>
            <td>Retailer Name</td>
            <td>Locality</td>
            <td>City</td>
            <td>State</td>
            <td>Receipt Mode</td>
            <td>Reference No</td>
            <td>Reference Data</td>
            <td>Bank Name</td>
            <td>Amount</td>
        </tr>
        <%
        doConnect();
        try{
            stmtfill=conn.createStatement();
            rsshow=stmtfill.executeQuery("select * from tblreceiptinfo where retname='"+sretname+"'");
            i=0;
            sl=0;
            while(rsshow.next())
            {
              vouchno=rsshow.getString("vouchno");
             vdate =rsshow.getString("vdate");
             retname =rsshow.getString("retname");
             locality =rsshow.getString("locality");
             city =rsshow.getString("city");
             state =rsshow.getString("state");
             recmode =rsshow.getString("recmode");
             refno =rsshow.getString("refno");
            refdate =rsshow.getString("refdate");
            bankname =rsshow.getString("bankname");
            amt =rsshow.getString("amt");
              sl++;
              if("CASH".equalsIgnoreCase(recmode)){
                refno="Not Available";
                refdate="Not Available";
                bankname="Not Available";
              }

            %>
            <tr>
                <td><%=sl %></td>
                <td><%= vouchno %></td>
                <td><%=vdate %></td>
                <td><%=retname %></td>
                <td><%=locality %></td>
                <td><%=city %></td>
                <td><%=state %></td>
                <td><%=recmode%></td>
                <td><%= refno %></td>
                <td><%= refdate %></td>
                <td><%= bankname %></td>
                <td><%= amt %></td>
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

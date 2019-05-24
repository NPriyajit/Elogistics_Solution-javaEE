
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<title>Report Order Information</title>
<%@ include file="header.jsp" %>
<head>


</head>

<body>

    <%!
    Connection conn;
    Statement stmtfill,stmtshow;
    ResultSet rsfill,rsshow;
    String  ordno, datedet, vendname,locality,city,state,slno,prodcode,prodname,prodcat,price,quant,amt,sprodcode;
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
sprodcode=request.getParameter("cmbprodcode");
%>


      <h3   style="text-align:center;padding-bottom:15px;">Order Information [<%=sprodcode %>] &nbsp;<sup><small class="text-muted">Report</small></sup></h3>


    <div class="well" style="border-top: solid black;border-bottom: solid black ;" >

      <h4>  NAJ Electronics</h4>
      <h4>  College Square</h4>
      <h4>  Cuttack-01</h4>
      <table  style="margin-top:40px; border:2px solid black; font-size:12px;"class="table ">
        <tr>
            <td>Sl.no</td>
            <td>Order No</td>
            <td>Date</td>
            <td>Vendor Name</td>
            <td>Locality</td>
            <td>City</td>
            <td>State</td>
            <td>Sl No</td>
            <td>Product Code</td>
            <td>Product Name</td>
            <td>Product Category</td>
            <td>Price</td>
            <td>Order Quant</td>
            <td>Amount</td>
        </tr>
        <%
        doConnect();
        try{
            stmtfill=conn.createStatement();
            rsshow=stmtfill.executeQuery("select * from tblorderinfo where prodcode='"+sprodcode+"'");
            i=0;
            sl=0;
            while(rsshow.next())
            {
                ordno =rsshow.getString("orderno");
                datedet =rsshow.getString("datedet");
               	 vendname =rsshow.getString("vendname");
               	 locality =rsshow.getString("locality");
                  city =rsshow.getString("city");
                  state =rsshow.getString("state");
                  slno =rsshow.getString("slno");
                  prodcode =rsshow.getString("prodcode");
                  prodname =rsshow.getString("prodname");
                  prodcat =rsshow.getString("prodcat");
                  price =rsshow.getString("price");
                  quant =rsshow.getString("quant");
                  amt =rsshow.getString("amt");
                sl++;

            %>
            <tr>
                <td><%=sl %></td>
                <td><%= ordno %></td>
                <td><%=datedet %></td>
                <td><%=vendname %></td>
                <td><%=locality %></td>
                <td><%=city %></td>
                <td><%=state %></td>
                <td><%=slno%></td>
                <td><%=prodcode %></td>
                <td><%=prodname %></td>
                <td><%=prodcat %></td>
                <td><%=price %></td>
                <td><%=quant %></td>
                <td><%=amt %></td>
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

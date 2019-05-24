
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<title>Report Issue Information</title>
<%@ include file="header.jsp" %>
<head>


</head>

<body>

    <%!
    Connection conn;
    Statement stmtfill,stmtshow;
    ResultSet rsfill,rsshow;
      String  orderno , odate , retname , locality , city , state , slno , prodcode , prodname , prodcat , price , quant , amt , idate ,invno;
      String  disper , disamt , cgst , sgst , taxamt , netamt ,sprodcode;
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


      <h3   style="text-align:center;padding-bottom:15px;">Issue Of Goods [<%=sprodcode %>] &nbsp;<sup><small class="text-muted">Report</small></sup></h3>
    <div class="well" style="border-top: solid black;border-bottom: solid black ;" >

      <h4>  NAJ Electronics</h4>
      <h4>  College Square</h4>
      <h4>  Cuttack-01</h4>
      <table  style="margin-top:40px; border:2px solid black; font-size:12px;"class="table ">
        <tr>
            <td>Sl.no</td>
            <td>Invoice No</td>
            <td>Issue Date</td>
            <td>Order No</td>
            <td>Order Date</td>
            <td>Retailer Name</td>
            <td>Locality</td>
            <td>City</td>
            <td>State</td>
            <td>Sl No</td>
            <td>Product Code</td>
            <td>Product Name</td>
            <td>Product Category</td>
            <td>Price</td>
            <td>Quant</td>
            <td>Amount</td>
            <td>Discount Percentage</td>
            <td>Discount Amount</td>
            <td>Cgst</td>
            <td>Sgst</td>
            <td>Tax Amount</td>
            <td>Net Amount</td>
        </tr>
        <%
        doConnect();
        try{
            stmtfill=conn.createStatement();
            rsshow=stmtfill.executeQuery("select * from tblissuegoodsinfo where prodcode='"+sprodcode+"'");
            i=0;
            sl=0;
            while(rsshow.next())
            {
              invno=rsshow.getString("invno");
            idate = rsshow.getString("idate");
            orderno = rsshow.getString("orderno");
            odate = rsshow.getString("odate");
            retname = rsshow.getString("retname");
            locality = rsshow.getString("locality");
             city = rsshow.getString("city");
             state = rsshow.getString("state");
             slno = rsshow.getString("slno");
             prodcode = rsshow.getString("prodcode");
            prodname = rsshow.getString("prodname");
            prodcat = rsshow.getString("prodcat");
            price = rsshow.getString("price");
            quant = rsshow.getString("quant");
            amt = rsshow.getString("amt");
            disper = rsshow.getString("disper");
            disamt = rsshow.getString("disamt");
            cgst = rsshow.getString("cgst");
            sgst = rsshow.getString("sgst");
            taxamt = rsshow.getString("taxamt");
            netamt = rsshow.getString("netamt");

                sl++;

            %>


            <tr>
                <td><%= sl %></td>
                <td><%= invno %></td>
                <td><%= idate %></td>
                <td><%= orderno %></td>
                <td><%= odate %></td>
                <td><%= retname  %></td>
                <td><%= locality  %></td>
                <td>  <%= city  %></td>
                <td><%= state  %></td>
                <td><%= slno  %></td>
                <td><%=prodcode%></td>
                <td><%= prodname  %></td>
                <td><%= prodcat  %></td>
                <td><%= price  %></td>
                <td><%= quant  %></td>
                <td><%= amt  %></td>
                <td><%= disper  %></td>
                <td><%= disamt  %></td>
                <td><%= cgst  %></td>
                <td><%= sgst  %></td>
                <td><%= taxamt  %></td>
                <td><%= netamt  %></td>


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

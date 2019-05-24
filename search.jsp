    
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<title>Search Result</title>
<%@ include file="header.jsp" %>
<head>


</head>

<body>

    <%!
    Connection conn;
    Statement stmtfill,stmtshow;
    ResultSet rsfill,rsshow;
    String sprodname,prodcode,vendname ,prodcat ,prodname ,hsn ,gst ,purchase ,sales ,opening ;
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
    sprodname=request.getParameter("search");
    %>


      <h3   style="text-align:center;padding-bottom:15px;">Search Query [<%= sprodname %>] &nbsp;<sup><small class="text-muted">Report</small></sup></h3>


    <div class="well" style="border-top: solid black;border-bottom: solid black ;" >
<h1>Search Results</h1>
      <table  style="margin-top:40px; border:2px solid black; font-size:12px;"class="table">
        <tr>
            <td>Sl.no</td>
            <td>Product Code</td>
            <td>Vendor Name</td>
            <td>Product Name</td>
            <td>Product Category</td>
            <td>HSN Code</td>
            <td>GST Slab</td>
            <td>Purchase Price</td>
            <td>Sales Price</td>
            <td>Opening Stock</td>
        </tr>
        <%
        doConnect();
        try{
            stmtfill=conn.createStatement();
            rsshow=stmtfill.executeQuery("select * from tblproductdetails where prodname='"+sprodname+"'");
            i=0;
            sl=0;
            if(rsshow.next())
            {
              vendname =rsshow.getString("vendname");
              prodcat =rsshow.getString("prodcat");
                prodcode =rsshow.getString("prodcode");
          			prodname =rsshow.getString("prodname");
          			hsn =rsshow.getString("hsn");
          			gst =rsshow.getString("gst");
          			purchase =rsshow.getString("purchaseprice");
          			sales =rsshow.getString("salesprice");
    	          opening =rsshow.getString("openingstock");
                sl++;

            %>


            <tr>
                <td><%= sl%></td>
                <td><%= prodcode %></td>
                <td><%= vendname %></td>
                <td><%= prodname %></td>
                <td><%= prodcat  %></td>
                <td><%= hsn %></td>
                <td>  <%= gst  %></td>
                <td><%= purchase  %></td>
                <td><%= sales  %></td>
                <td><%=opening%></td>

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

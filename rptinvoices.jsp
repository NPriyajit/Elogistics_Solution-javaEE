
<%@ page language="java" contentType="text/html" import="java.sql.*" %>



  <html>
  <head>
      <title>Issue of Goods</title>
      <%@ include file="header.jsp" %>
       </head>
  <body>
      <%!
      Connection conn;
      Statement stmtfill,stmtshow,stmtshow1,stmtfillsl;
      ResultSet rsfill,rsshow,rsshow1,rsfillsl;
       String  orderno , odate , retname , locality , city , state , slno , prodcode , prodname , prodcat , price , quant , amt , idate ,invno,sinvno;
      String  disper , disamt , cgst , sgst , taxamt , netamt ;
      int i,n,l,a,sl;
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
      sinvno= request.getParameter("cmbinvno");
      %>


      <h3 style="text-align:center;padding-bottom:15px;">GST Invoice Information<sup><small>Report</small></sup></h3>


    <div class="well" style="border-top: solid black;border-bottom: solid black ;" >

    
      <h4>  NAJ Electronics</h4>
      <h4>  College Square</h4>
      <h4>  Cuttack-01</h4>
      <h4> Ph No: 0671-3762979</h4>
      <h4> e-mail ID: najelectronics@elog.com</h4>

 <%
        doConnect();
        try{
            stmtfill=conn.createStatement();
            rsshow=stmtfill.executeQuery("select * from tblissuegoodsinfo where invno='"+sinvno+"'");
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
            }
        }
        catch(SQLException e)
        {
            System.out.println("EXEPTION");
        }
%>

            <form name="f1" id="myForm" action="issuegoodinfos.jsp" >
                  <table  style="margin-top:40px; padding:10px; font-size:12px;" class="table table-borderless ">
                           <tr>
                                <td>Invoice No:</td>
                                <td>
                                
                                   <%= invno %>
                                    
                                    </td>
                                <td> </td>
                                <td>Invoice Date:</td>
                                <td>
                                <%= idate %>
                              </td></tr>
                                <tr>
                                <td>Order No:</td>
                                <td> 
                                <%= orderno %>
                                 </td>
                                <td> </td>
                                <td>Order Date:</td>
                                 <td> 
                                <%= odate %>
                                 </td>
                                </tr>
                                 <tr>
                                <td>Retailer Name:</td>
                                <td> 
                                <%= retname %>
                                 </td>
                                </tr>
                                 <tr>
                                <td>Retailer Name:</td>
                                <td> 
                                <%= locality %>
                                 </td>
                                </tr>
                                 <tr>
                                <td>Retailer Name:</td>
                                <td> 
                                <%= city %>
                                 </td>
                                </tr>
                                 <tr>
                                <td>Retailer Name:</td>
                                <td> 
                                <%= state %>
                                 </td>
                                 <td>
                                 <br>
                                 </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr style="background-color:darkgray; margin-top:20px;">
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
            rsshow=stmtfill.executeQuery("select * from tblissuegoodsinfo where invno='"+sinvno+"'");
            while(rsshow.next())
            {
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

            %>


            <tr>
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
        }
      }
      catch(SQLException es)
      {
        System.out.println("error");
      }
  %>

            </table>
            <div class="btn" style="margin-top:20px;">
            <input type="button" value="Print" class="btn btn-primary">
            <input type="button" value="Cancel" class="btn btn-danger">
            </div>
              </form>
               <ul type="square">
            <li>Goods once sold can not be returned back.</li>
            <li>All disputes subject to Cuttack Jurisdiction</li>
            </ul>
               
              <%@ include file="footer.jsp" %>
              </body>
 </html>
                    
<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%
 i=0;
 locality=new String[30];
 city=new String[30];
 state=new String[30];


 doConnect();
 try{
     stmtshow=conn.createStatement();
     rsshow=stmtshow.executeQuery("select * from tblretailerinfo");
     while(rsshow.next())
     {

         locality[i]=rsshow.getString("locality");
         city[i]=rsshow.getString("city");
         state[i]=rsshow.getString("state");

         i++;
     }
 }
 catch(SQLException s)
 {
     System.out.println("error");
  }
  %>

  <%
    prodcat=new String[30];
   prodname=new String[30];
   price=new String[30];
   n=0;
   doConnect();
   try{
      stmtshow1=conn.createStatement();
      rsshow1=stmtshow1.executeQuery("select * from tblproductdetails");
      while(rsshow1.next())
      {
              prodcat[n]=rsshow1.getString("prodcat");
              prodname[n]=rsshow1.getString("prodname");
              price[n]=rsshow1.getString("salesprice");
              n++;
      }
   }
    catch(SQLException ses)
   {
      System.out.println("Error1"+ses);
   }

   %>



  <html>
  <head>
      <title>Order & Retail Info</title>
      <%@ include file="header.jsp" %>
      <script language="javascript">
        function showRetail()
        {

        var jlocality=new Array();
        var jcity=new Array();
        var jstate=new Array();


            var j,k;
            j=0;
            <%
            i=0;
            while(i<locality.length)
            {
            %>
            jlocality[j]="<%=locality[i] %>";
            jcity[j]="<%=city[i] %>";
            jstate[j]="<%=state[i] %>";

            j=j+1;
            <%
            i=i+1;
            }
            %>
            k=document.f1.cmbretailname.selectedIndex;
            document.f1.txtlocality.value=jlocality[k-1];
            document.f1.txtcity.value=jcity[k-1];
		        document.f1.txtstate.value=jstate[k-1];



        }


         function showProd(){
                  var jprodcat=new Array();
                  var jprodname=new Array();
                  var jprice=new Array();
                  var m,n;
             m=0;
           <%
                  l=0;
                  while(l < prodcat.length)
                  {
              %>
           jprodcat[m]="<%=prodcat[l] %>";
           jprodname[m]="<%=prodname[l] %>";
           jprice[m]="<%=price[l] %>";
           m=m+1;

              <%
                  l=l+1;
             }
              %>
                  n=document.f1.cmbprodcode.selectedIndex;
                  document.f1.txtprodcat.value=jprodcat[n-1];
             document.f1.txtprodname.value=jprodname[n-1];
             document.f1.price.value=jprice[n-1];
           }


        function setAmt()
         {
       	  var price,quant,amt;
       	  price=document.f1.price.value;
       	  quant=document.f1.quant.value;
       	  amt=price*quant;
       	  document.f1.amt.value=amt;
        }

            </script>
  </head>
  <body>
    <div class="backgroundpic">
      <%!
      Connection conn;
      Statement stmtfill,stmtshow,stmtshow1;
      ResultSet rsfill,rsshow,rsshow1;
      int i,n,l;
      String   retailname,locality[],city[],state[];
      String prodname[],prodcat[],price[],gst[],prodcode;
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

      <h3   style="text-align:center;padding-bottom:15px;">Order From Retailer</h3>

      <div class="well" style="border-top: solid black; border-bottom: solid black;" >
            <div class="container">




    <form name="f1" id="myForm" action="orderfromretailerinfos.jsp">
        <table  class="table table-borderless ">
          <tr>
              <td>
                  Order No:
              </td>
              <td>
                <div class="col-xs-8">
                  <input type="text" id="inputs" class="form-control input-sm" name="txtordno" required>
                  </div>
              </td>
              <td>
              </td>
              <td>
                Order Date:
              </td>
              <td>
                <div class="col-xs-8">
                <input type="date" id="inputs" class="form-control input-sm" name="odate">
                </div>
              </td>
          </tr>
            <tr>
                <td>
                    Retailer Name:
                </td>
                <td>
                  <div class="col-xs-8">
                        <select name="cmbretailname" id="inputs" class="form-control input-sm"  onchange="showRetail()">
                                <option value="">-Select-</option>
                                 <%
                                     doConnect();
                                     try{
                                         stmtfill=conn.createStatement();
                                         rsfill=stmtfill.executeQuery("select * from tblretailerinfo");
                                         while(rsfill.next()){
                                            retailname=rsfill.getString("retname");
                                             %>
                                             <option value="<%=retailname %>"><%=retailname %></option>
                                             <%
                                         }
                                     }
                                     catch(SQLException se){
                                         out.println("Error 2");
                                     }
                                 %>
                            </select></div>
                </td>
            </tr>


            <tr>
                <td>
                    Locality:
                </td>
                <td>
                <div class="col-xs-8">
                    <input type="text" id="inputs" class="form-control input-sm" name="txtlocality"  list="cities">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    City:
                </td>
                <td>
                <div class="col-xs-8">
                    <input type="text" id="inputs" class="form-control input-sm" name="txtcity" list="cities">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    State:
                </td>
                <td>
                <div class="col-xs-8">
                    <input type="text" id="inputs" class="form-control input-sm" name="txtstate" list="states"  >
                    </div>
                </td>
            </tr>

        </table>

        <table  class="table table-borderless ">
        <tr>
        <td>Sl. no</td>
        <td>Product Code</td>
        <td>Product Name</td>
        <td>Product Category</td>
        <td>Price</td>
        <td>Order Qty</td>
        <td>Amount</td>
        </tr>
<tr>
</tr>
        <tr>
        <td><input type="number" id="inputes" class="form-control input-sm" name="slno"></td>
        <td>
        <select name="cmbprodcode" id=" inputs" class="form-control input-sm" onchange="showProd()">
              <option value="">-Select-</option>
               <%
                   doConnect();
                   try{
                       stmtfill=conn.createStatement();
                       rsfill=stmtfill.executeQuery("select * from tblproductdetails");
                       while(rsfill.next()){
                           prodcode=rsfill.getString("prodcode");
                           %>
                           <option value="<%=prodcode%>"><%=prodcode%></option>
                           <%
                       }
                   }
                   catch(SQLException se){
                       out.println("Error 2");
                   }
               %>
          </select>
          </td>
          <td>

              <input type="text" id=" inputs" class="form-control input-sm" name="txtprodname">

          </td>
          <td>

              <input type="text" id=" inputs" class="form-control input-sm"  name="txtprodcat">

          </td>
          <td>

              <input type="text" id=" inputs" class="form-control input-sm"  name="price">

          </td>
          <td>

              <input type="text" id=" inputs" class="form-control input-sm" name="quant" onchange="setAmt()">

          </td>
          <td>

              <input type="text" id=" inputs" class="form-control input-sm"  name="amt">

          </td>
          </tr>
          </table>

        <div class="btn">
            <input id="btn" class="btn btn-primary" type="submit" name="btnsub" value="Submit">
            <input id="btn" class="btn btn-danger" type="reset" name="btnres" value="Reset">
            <input id="btn" class="btn btn-info" type="button" name="btnfind" value="Find" onclick="window.open('orderfromretailerinfofc.jsp','_self')">
        </div>

    </form>
<%@ include file="footer.jsp" %>
          </div>
          </div>
  </body>
</html>

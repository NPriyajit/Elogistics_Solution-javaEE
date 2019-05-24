
<%@ page language="java" contentType="text/html" import="java.sql.*" %>



<%
     i=0;
     datedet=new String[100];
     vendname=new String[100];
     locality=new String[100];
     city=new String[100];
     state=new String[100];

	 doConnect();
	 try{
        stmtshow=conn.createStatement();
        rsshow=stmtshow.executeQuery("select * from tblorderinfo");
        while(rsshow.next())
        {
            datedet[i]=rsshow.getString("datedet");
    	    vendname[i]=rsshow.getString("vendname");
        	locality[i]=rsshow.getString("locality");
            city[i]=rsshow.getString("city");
            state[i]=rsshow.getString("state");
            i++;
        }
     }
     catch(SQLException ses)
     {
        System.out.println("Error"+ses);
     }


	%>

<%
prodcat=new String[100];
prodname=new String[100];
price=new String[100];
gst=new String[100];
n=0;
doConnect();
try{
	 stmtshow1=conn.createStatement();
	 rsshow1=stmtshow1.executeQuery("select * from tblproductdetails");
	 while(rsshow1.next())
	 {
		   prodcat[n]=rsshow1.getString("prodcat");
           prodname[n]=rsshow1.getString("prodname");
           gst[n]=rsshow1.getString("gst");
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
      <title>Purchase Information</title>
      <%@ include file="header.jsp" %>

      <script>

      function showOrder()
      {
        var jdate=new Array();
		var jvendname=new Array();
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
          jdate[j]="<%=datedet[i] %>";
          jvendname[j]="<%=vendname[i]%>";
          jlocality[j]="<%=locality[i] %>";
          jcity[j]="<%=city[i] %>";
          jstate[j]="<%=state[i] %>";
          j=j+1;
          <%
          i=i+1;
          }
          %>
          k=document.f1.cmbordno.selectedIndex;
          document.f1.odate.value=jdate[k-1];
          document.f1.txtvendname.value=jvendname[k-1];
          document.f1.txtlocality.value=jlocality[k-1];
          document.f1.txtcity.value=jcity[k-1];
		  document.f1.txtstate.value=jstate[k-1];


      }



     function showProd(){
           var jprodcat=new Array();
		   var jprodname=new Array();
           var jgst=new Array();
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
        jgst[m]="<%=gst[l] %>";
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
            document.f1.cgstper.value=jgst[n-1]/2;
            document.f1.sgstper.value=jgst[n-1]/2;
            document.f1.disamt.value="";
            document.f1.taxamt.value="";
            document.f1.netamt.value="";

    }
    </script>


    <script>
     function setAmt()
      {
    	  var price,quant,amt;
    	  price=document.f1.price.value;
    	  quant=document.f1.quant.value;
    	  amt=price*quant;
    	  document.f1.amt.value=amt;
      }
      function disAmt()
      {
          var disper,disamt,amt;
          var m,n,ad;
          var cgst,taxamt,gst,netamt;
          amt=document.f1.amt.value;
          disper=document.f1.disper.value;
          disamt=amt*(disper/100);
          disamt=disamt.toFixed(2);
          document.f1.disamt.value=disamt;
          cgst=document.f1.cgstper.value;
          gst=cgst*2;
          ad=(amt-disamt);
        taxamt=ad*(gst/100);
        taxamt=taxamt.toFixed(2);
        document.f1.taxamt.value=taxamt;
        netamt=ad+Math.round(taxamt);
        document.f1.netamt.value=Math.round(netamt);
      }


    </script>

  </head>
  <body>

      <%!
      Connection conn;
      String datedet[],vendname[],locality[],city[],state[],prodname[],prodcat[],price[],gst[],slno;
      Statement stmtfill,stmtshow,stmtshow1,stmtfillsl;
      ResultSet rsfill,rsshow,rsshow1,rsfillsl;
      String orderno,prodcode;
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


      <div class="col-sm-4" style="margin-top:-10px;">
        <p style="margin-left:15px; float:left; font-size:14px; "><a href="elog.html"><span style="padding:10px;  "
              class="glyphicon glyphicon-home"></span>Home</a></p>
      
        <p style="font-size:14px; margin-left:15px; float:left;"> <a href="about.html"><span style="padding:10px;  "
              class="glyphicon glyphicon-list-alt"></span>About Us</a></p>
      
        <p style="font-size:14px; margin-left:15px; float:left;"> <a href="contact.html"><span style="padding:10px;  "
              class="glyphicon glyphicon-earphone"></span>Contact Us</a></p>
      
      </div>
      <div class="col-sm-4">
      
        <h3 style="text-align:center;  margin-top: -7px; ">Purchase of Goods</h3>
      </div>
      
      <div class="well" style="border-top: solid black;border-bottom: solid black ; margin-top:70px;">

                  <div class="container">

            <form name="f1" id="myForm" action="purchaseinfos.jsp" >
                  <table class="table table-borderless ">
                        <tr>
                                <td>Purchase Invoice No:</td>
                                <td><div class="col-xs-8"><input type="text" id="inputs" class="form-control input-sm" name="txtpurchno"></div></td>
                                <td> </td>
                                <td>Date:</td>
                                <td><div class="col-xs-8"><input type="date" id="inputs" class="form-control input-sm"  name="pdate"></div></td></tr>
                  <tr>
                  <td>Order NO:</td>
                  <td><div class="col-xs-8"> <select name="cmbordno" id="inputs" class="form-control input-sm" onchange="showOrder()">
                        <option value="">-Select-</option>
                         <%
                             doConnect();
                             try{
                                 stmtfill=conn.createStatement();
                                 rsfill=stmtfill.executeQuery("select * from tblorderinfo");
                                 while(rsfill.next()){
                                     orderno=rsfill.getString("orderno");
                                     %>
                                     <option value="<%=orderno%>"><%=orderno%></option>
                                     <%
                                 }
                             }
                             catch(SQLException se){
                                 out.println("Error 2");
                             }
                         %>
                    </select></div></td>
                  <td> </td>
                  <td>Date:</td>
                  <td><div class="col-xs-8"><input type="date" id="inputs" class="form-control input-sm"  name="odate"></div></td></tr>
                          <tr>
                              <td>
                                  Vendor Name:
                              </td>
                              <td>
                              <div class="col-xs-8">
                                    <input type="text" id="inputs" class="form-control input-sm" name="txtvendname">
                              </div>
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
                                  <input type="text"  id="inputs" class="form-control input-sm" name="txtcity" list="cities">
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
                      <table class="table table-borderless ">

                          <tr>
                              <td>Sl.no</td>
                              <td>Product Code</td>
                              <td>Product Name</td>
                              <td>Product Category</td>
                              <td>Price</td>
                              <td>Order<br> Qty</td>
                              <td>Amount</td>
                              <td>Discount<br>(%)</td>
                              <td>Discount<br> Amount</td>
                              <td>CGST<br>(%)</td>
                              <td>SGST<br>(%)</td>
                              <td>Tax Amount</td>
                              <td>Net Amount</td>
                          </tr>
                          <tr>
                          </tr>
                          <tr>
                              <td>

                                  <input type="number" id="inputes" class="form-control input-sm" name="slno">
                              </td>
                              <td><select name="cmbprodcode" id="inputs" class="form-control input-sm" onchange="showProd()">
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
                                </select></td>
                          <td>
                              <input type="text"  id="inputs" class="form-control input-sm" name="txtprodname">
                          </td>
                          <td>
                              <input type="text"  id="inputs" class="form-control input-sm"  name="txtprodcat">
                          </td>
                          <td>
                              <input type="text" id="inputs" class="form-control input-sm"  name="price">
                          </td>
                          <td>
                              <input type="text" id="inputs" class="form-control input-sm"  name="quant" onchange="setAmt()">
                          </td>
                          <td>
                              <input type="text" id="inputs" class="form-control input-sm"  name="amt">
                          </td>
                          <td>
                                <input type="text" id="inputs" class="form-control input-sm"  name="disper" onchange="disAmt()">
                            </td>
                            <td>
                                    <input type="text" id="inputs" class="form-control input-sm"  name="disamt">
                                </td>
                                <td>
                                        <input type="text" id="inputs" class="form-control input-sm"  name="cgstper">
                             </td>
                             <td>
                                    <input type="text" id="inputs" class="form-control input-sm"  name="sgstper">
                                </td>
                                <td>
                                        <input type="text" id="inputs" class="form-control input-sm"  name="taxamt">
                                    </td>
                                    <td>
                                            <input id="inputs" class="form-control input-sm"  name="netamt">
                                        </td>
                            </tr>
                            <tr></tr>

                      </table>
                      <div class="btn">
                          <input id="btn" class="btn btn-primary" style="width:100px;" type="submit" name="btnsub" value="Submit">
                          <input id="btn" class="btn btn-danger" style="width:100px;" type="reset" name="btnres" value="Reset" >
                          <input id="btn" class="btn btn-info" style="width:100px;"  type="button" name="btnfind" value="Find" onclick="window.open('purchaseinfofc.jsp','_self')">
                      </div>

                  </form>
                  <%@ include file="footer.jsp" %>
                  </div>
              </div>

          </div>
  </body>
  </html>


<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%
 k=0;
 fpdate=new String[30];
 forderno=new String[30];
 fodate=new String[30];
 fvendname=new String[30];
flocality=new String[30];
fcity=new String[30];
fstate=new String[30];
fslno=new String[30];
fprodcode=new String[30];
fprodcat=new String[30];
fprodname=new String[30];
fprice=new String[30];
fquant=new String[30];
famt=new String[30];
fdisper=new String[30];
fdisamt=new String[30];
ftaxamt=new String[30];
fnetamt=new String[30];
fsgst=new String[30];
fcgst=new String[30];

doConnect();
try
{
    fstmtshow=conn.createStatement();
    frsshow=fstmtshow.executeQuery("select * from tblpurchaseinfo");
    while(frsshow.next())
    {
        fpdate[k]=frsshow.getString("pdate");
        forderno[k]=frsshow.getString("orderno");
        fodate[k]=frsshow.getString("odate");
        fvendname[k]=frsshow.getString("vendname");
        flocality[k]=frsshow.getString("locality");
       fcity[k]=frsshow.getString("city");
       fstate[k]=frsshow.getString("state");
       fslno[k]=frsshow.getString("slno");
       fprodcode[k]=frsshow.getString("prodcode");
        fprodname[k]=frsshow.getString("prodname");
        fprodcat[k]=frsshow.getString("prodcat");
        fprice[k]=frsshow.getString("price");
        fquant[k]=frsshow.getString("quant");
        famt[k]=frsshow.getString("amt");
        fdisper[k]=frsshow.getString("disper");
        fdisamt[k]=frsshow.getString("disamt");
        fcgst[k]=frsshow.getString("cgst");
        fsgst[k]=frsshow.getString("sgst");
        ftaxamt[k]=frsshow.getString("taxamt");
        fnetamt[k]=frsshow.getString("netamt");
        k++;
    }
}
catch(SQLException sl)
{
    System.out.println("ERROR"+sl);
}
%>

<%
     i=0;
     datedet=new String[30];
     vendname=new String[30];
     locality=new String[30];
     city=new String[30];
     state=new String[30];

	 doConnect();
	 try{
        stmtshow=conn.createStatement();
        rsshow=stmtshow.executeQuery("select * from tblorderinfo ");
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
prodcat=new String[30];
prodname=new String[30];
price=new String[30];
gst=new String[30];
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
      <title>Find Information</title>
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
           var disper,disamt,amt;
           var ad;
           var cgst,taxamt,gst,netamt;
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
            setAmt();
            disAmt();
    }
    function showPurchase()
          {
            var jpdate=new Array();
            var jodate=new Array();
            var jorderno=new Array();
            var jvendname=new Array();
            var jlocality=new Array();
            var jcity=new Array();
            var jstate=new Array();
            var jslno=new Array();
            var jprodcode=new Array();
            var jprodcat=new Array();
            var jprodname=new Array();
            var jprice=new Array();
            var jquant=new Array();
            var jamt=new Array();
            var jdisper=new Array();
            var jdisamt=new Array();
            var jtaxamt=new Array();
            var jnetamt=new Array()
            var jsgst=new Array();
            var jcgst=new Array();
            var o,p;
			o=0;
		<%
           f=0;
           while(f < fpdate.length)
           {
       %>

        jpdate[o]="<%= fpdate[f] %>";
        jorderno[o]="<%=forderno[f] %>";
        jodate[o]="<%=fodate[f] %>";
        jvendname[o]="<%=fvendname[f]%>";
        jlocality[o]="<%=locality[f] %>";
        jcity[o]="<%=city[f] %>";
        jstate[o]="<%=state[f] %>";
        jslno[o]="<%=fslno[f] %>";
        jprodcode[o]="<%=fprodcode[f] %>";
        jprodname[o]="<%=fprodname[f] %>";
		    jprodcat[o]="<%=fprodcat[f] %>";
        jprice[o]="<%=fprice[f] %>";
        jquant[o]="<%=fquant[f]%>";
        jamt[o]="<%=famt[f] %>";
        jdisper[o]="<%=fdisper[f] %>";
        jdisamt[o]="<%=fdisamt[f] %>";
        jcgst[o]="<%=fcgst[f] %>";
        jsgst[o]="<%=fsgst[f] %>";
        jtaxamt[o]="<%=ftaxamt[f] %>";
        jnetamt[o]="<%=fnetamt[f] %>";

        o=o+1;
        <%
            f=f+1;
           }
        %>

          p=document.f1.cmbpurchno.selectedIndex;
           document.f1.pdate.value=jpdate[p-1];
           document.f1.cmbordno.value=jorderno[p-1];
           document.f1.odate.value=jodate[p-1];
           document.f1.odate.value=jodate[p-1];
          document.f1.txtvendname.value=jvendname[p-1];
          document.f1.txtlocality.value=jlocality[p-1];
          document.f1.txtcity.value=jcity[p-1];
          document.f1.txtstate.value=jstate[p-1];
          document.f1.slno.value=jslno[p-1];
          document.f1.cmbprodcode.value=jprodcode[p-1];
          document.f1.txtprodname.value=jprodname[p-1];
          document.f1.txtprodcat.value=jprodcat[p-1];
            document.f1.price.value=jprice[p-1];
            document.f1.quant.value=jquant[p-1];
            document.f1.oldQty.value=jquant[p-1];
            document.f1.amt.value=jamt[p-1];
            document.f1.disper.value=jdisper[p-1];
            document.f1.disamt.value=jdisamt[p-1];
            document.f1.cgstper.value=jcgst[p-1];
            document.f1.sgstper.value=jsgst[p-1];
            document.f1.taxamt.value=jtaxamt[p-1];
            document.f1.netamt.value=jnetamt[p-1];


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
        document.f1.netamt.value=netamt;
      }


    </script>

  </head>
  <body>

      <%!
      Connection conn;
      String datedet[],vendname[],locality[],city[],state[],prodname[],prodcat[],price[],gst[],slno[];
      String  forderno[],fodate[],fvendname[],flocality[],fcity[],fstate[],fslno[],fprodcode[],fprodname[],fprodcat[],fprice[],fquant[],famt[],fpdate[],purchno;
      String fdisper[],fdisamt[],fcgst[],fsgst[],ftaxamt[],fnetamt[];

      Statement stmtfill,stmtshow,stmtshow1,fstmtshow;
      ResultSet rsfill,rsshow,rsshow1,frsshow;
      String orderno,prodcode,prodno;
      int i,n,l,a,k,f;
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

      <h3 style="text-align:center; padding-bottom:15px;">Purchase Information&nbsp;<sup><small>Edit Information</small></sup></h3>


    <div class="well" style="border-top: solid black;border-bottom: solid black ;" >
            <div class="container">

            <form name="f1" id="myForm" action="purchaseinfofs.jsp" >
                  <table class="table table-borderless ">
                        <tr>
                                <td>Purchase Invoice No/Prod Code:</td>
                                <td>  <div class="col-xs-8"> <select name="cmbpurchno" id="inputs" class="form-control input-sm" onchange="showPurchase()">
                        <option value="">-Select-</option>
                         <%
                             doConnect();
                             try{
                                 stmtfill=conn.createStatement();
                                 rsfill=stmtfill.executeQuery("select * from tblpurchaseinfo");
                                 while(rsfill.next()){
                                     purchno=rsfill.getString("purchaseno");
                                     prodno=rsfill.getString("prodcode");
                                     %>
                                     <option value="<%=purchno %>-<%=prodno %>"><%=purchno %>-<%=prodno %></option>
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

                                <td>  <div class="col-xs-8"> <input type="date" id="inputs" class="form-control input-sm"  name="pdate"></div></td></tr>
                  <tr>
                  <td>Order No:</td>

                  <td>  <div class="col-xs-8"> <select name="cmbordno" id="inputs" class="form-control input-sm" onchange="showOrder()">
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
                    </select> </div></td>
                  <td> </td>
                  <td>Date:</td>
                  <td>
                  <div class="col-xs-8">
                    <input type="date" id="inputs" class="form-control input-sm"  name="odate">
                  </div>
                  </td></tr>
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
                                  <input type="text" id="inputs" class="form-control input-sm"  name="txtcity" list="cities">
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
                      <table class="table table-borderless " >

                          <tr >
                              <td>Sl. No</td>
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
                                  <input type="number" id="slno" id="inputs" class="form-control input-sm" name="slno">
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
                              <input type="text" id="inputs" class="form-control input-sm" name="txtprodname">
                          </td>
                          <td>
                              <input type="text" id="inputs" class="form-control input-sm"  name="txtprodcat">
                          </td>
                          <td>
                              <input type="text" id="inputs" class="form-control input-sm"  name="price">
                          </td>
                          <td>
                              <input type="text"  id="inputs" class="form-control input-sm" name="quant" onchange="setAmt()">
                              <input type="hidden" name="oldQty">
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
                                            <input type="text" id="inputs" class="form-control input-sm"  name="netamt">
                                        </td>
                            </tr>
                            <tr></tr>

                      </table>
                      <div class="btn">
                          <input id="btn" class="btn btn-primary" style="width:100px;" type="submit" name="btnup" value="Update">
                         <input id="btn" class="btn btn-danger" style="width:100px;" type="submit" name="btndel" value="Delete" >
                          <input id="btn" class="btn btn-info" style="width:100px;"  type="button" name="btnback" value="Back" onclick="window.open('purchaseinfoc.jsp','_self')">
                      </div>

                  </form>


              <%@ include file="footer.jsp" %>
              </div>

          </div>
  </body>
  </html>

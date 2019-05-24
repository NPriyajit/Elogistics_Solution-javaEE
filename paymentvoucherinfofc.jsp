
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%
j=0;
fvdate=new String[30];
fvendname=new String[30];
flocality=new String[30];
fcity=new String[30];
fstate=new String[30];
fpaymode=new String[30];
frefno=new String[30];
frefdate= new String[30];
fbankname=new String[30];
famt=new String[30];

doConnect();
try{
  stmtshow1=conn.createStatement();
  rsshow1=stmtshow1.executeQuery("select * from tblpaymentinfo");
  while(rsshow1.next())
  {
      fvdate[j]=rsshow1.getString("vdate");
      fvendname[j]=rsshow1.getString("vendname");
      flocality[j]=rsshow1.getString("locality");
      fcity[j]=rsshow1.getString("city");
      fstate[j]=rsshow1.getString("state");
      fpaymode[j]=rsshow1.getString("paymode");
      frefno[j]=rsshow1.getString("refno");
      frefdate[j]=rsshow1.getString("refdate");
      fbankname[j]=rsshow1.getString("bankname");
      famt[j]=rsshow1.getString("amt");
      j++;
  }
}
catch(SQLException es)
{
   System.out.println("Error"+es);
}


%>


<%
     i=0;
     locality=new String[30];
     city=new String[30];
     state=new String[30];

	 doConnect();
	 try{
        stmtshow=conn.createStatement();
        rsshow=stmtshow.executeQuery("select * from tblvendorinfo ");
        while(rsshow.next())
        {
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



  <html>
  <head>
      <title>Payment Information</title>
    <%@ include file="header.jsp" %>
      <script>

      function showVendor()
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
          k=document.f1.cmbvendname.selectedIndex;
          document.f1.txtlocality.value=jlocality[k-1];
          document.f1.txtcity.value=jcity[k-1];
		    document.f1.txtstate.value=jstate[k-1];


      }

      function showPayment()
      {
        var jvdate=new Array();
        var jvendname=new Array();
        var jlocality=new Array();
        var jcity=new Array();
        var jstate=new Array();
        var jpaymode=new Array();
        var jrefno=new Array();
        var jrefdate=new Array();
        var jbankname=new Array();
        var jamt= new Array();
        var m,n;
        m=0;
        <%
        l=0;
        while(l<fvendname.length)
        {
          %>
          jvdate[m]="<%= fvdate[l] %>";
          jvendname[m]="<%= fvendname[l] %>";
          jlocality[m]="<%= flocality[l] %>";
          jcity[m]="<%= fcity[l] %>";
          jstate[m]="<%= fstate[l] %>";
          jpaymode[m]="<%= fpaymode[l] %>";
          jrefno[m]="<%= frefno[l] %>";
          jrefdate[m]="<%= frefdate[l] %>";
          jbankname[m]="<%= fbankname[l] %>";
          jamt[m]="<%= famt[l] %>";
            m++;
            <%
            l++;
          }
          %>
        n=document.f1.cmbvouchno.selectedIndex;
        document.f1.vdate.value=jvdate[n-1];
        document.f1.cmbvendname.value=jvendname[n-1];
        document.f1.txtlocality.value=jlocality[n-1];
        document.f1.txtcity.value=jcity[n-1];
        document.f1.txtstate.value=jstate[n-1];
        document.f1.paymode.value=jpaymode[n-1];
        if(jpaymode[n-1]=="CASH")
        {
            payMode();
        }
        else {
        document.f1.refno.value=jrefno[n-1];
        document.f1.refdate.value=jrefdate[n-1];
        document.f1.bankname.value=jbankname[n-1];
      }
        document.f1.amt.value=jamt[n-1];

      }


            </script>
            <script>
            function payMode()
            {
                var k=document.f1.paymode.selectedIndex;
                var paymode=document.f1.paymode.value;

                if(k==1 || paymode=="CASH")
                {
                  document.f1.refno.disabled=true;
                  document.f1.bankname.disabled=true;
                  document.f1.refdate.disabled=true;
                  document.f1.refno.value="Not Available";
                  document.f1.bankname.value="Not Available";
                  document.f1.refdate.type="text";
                  document.f1.refdate.value="Not Available";
                  }
                else
                {
                  document.f1.refno.disabled=false;
                  document.f1.bankname.disabled=false;
                  document.f1.refdate.disabled=false;
                  document.f1.refno.value=" ";
                  document.f1.bankname.value=" ";
                  document.f1.refdate.value=" ";
                  document.f1.refdate.type="date";
                  document.f1.refdate.value=" ";
                }
            }
</script>


  <datalist id="banks">
    <option value="HDFC BANK">HDFC BANK</option>
    <option value="SBI BANK">SBI BANK</option>
    <option value="AXIS BANK">AXIS BANK</option>
  </datalist>
        </head>
        <body>

            <%!
            Connection conn;
            String locality[],city[],state[];
            String vouchno,fvdate[],fvendname[],flocality[],fcity[],fstate[],fpaymode[],frefno[],frefdate[],fbankname[],famt[];
            Statement stmtfill,stmtshow,stmtshow1,stmtfill1;
            ResultSet rsfill,rsshow,rsshow1,rsfill1;
            String vendname;
            int i,n,j,l;
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


            <h3   style="text-align:center;padding-bottom:15px;">Payment Voucher Information&nbsp;<sup><small>Edit Information</small></sup></h3>


          <div class="well" style="border-top: solid black;border-bottom: solid black ;" >
                  <div class="container">


                  <form name="f1" id="myForm" action="paymentvocherinfofs.jsp" >
                          <table  class="table table-borderless ">
                        <tr>
                        <td>Voucher No:</td>
                        <td>
                        <div class="col-xs-8">
                        <select  id="inputs" class="form-control input-sm" name="cmbvouchno" onchange="showPayment()">

                          <option value="">-Select-</option>
                          <%
                          doConnect();
                          try{
                            stmtfill1=conn.createStatement();
                            rsfill1=stmtfill1.executeQuery("select * from tblpaymentinfo");
                            while(rsfill1.next())
                            {
                              vouchno=rsfill1.getString("vouchno");
                            %>
                            <option value="<%= vouchno %>"> <%=vouchno%> </option>
                            <%
                            }
                          }
                          catch(SQLException e){
                              out.println("Error 2");
                          }
                      %>
                        </select>
                      </div></td>
                        <td> </td>
                        <td>Date:</td>
                        <td><div class="col-xs-8"><input type="date"  id="inputs" class="form-control input-sm"  name="vdate"></div></td>
                                <tr>
                                    <td>
                                        Vendor Name:
                                    </td>
                                    <td>
                                      <div class="col-xs-8">
                                        <select name="cmbvendname"  id="inputs" class="form-control input-sm" onchange="showVendor()">
                                            <option value="">-Select-</option>
                                             <%
                                                 doConnect();
                                                 try{
                                                     stmtfill=conn.createStatement();
                                                     rsfill=stmtfill.executeQuery("select * from tblvendorinfo");
                                                     while(rsfill.next()){
                                                         vendname=rsfill.getString("vendname");
                                                         %>
                                                         <option value="<%=vendname%>"><%=vendname%></option>
                                                         <%
                                                     }
                                                 }
                                                 catch(SQLException se){
                                                     out.println("Error 2");
                                                 }
                                             %>
                                        </select>
                                        </div>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        Locality:
                                    </td>
                                    <td>
                                    <div class="col-xs-8">
                                        <input type="text" name="txtlocality"  id="inputs" class="form-control input-sm"  readonly>
                                    </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        City:
                                    </td>
                                    <td>
                                    <div class="col-xs-8">
                                        <input type="text" name="txtcity"  id="inputs" class="form-control input-sm" readonly>
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        State:
                                    </td>
                                    <td>
                                    <div class="col-xs-8">
                                        <input type="text" name="txtstate"  id="inputs" class="form-control input-sm" readonly  >
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                <td>
                                Payment Mode:
                                </td>
                                <td>
                                <div class="col-xs-8">
                                    <select name="paymode" id="inputs" class="form-control input-sm" onchange="payMode()">
                                    <option value="">-Select-</option>
                                    <option value="CASH">CASH</option>
                                    <option value="CHEQUE">CHEQUE</option>
                                    <option value="DRAFT">DRAFT</option>
                                    <option value="NEFT">NEFT</option>
                                    </select>
                                </div>
                                </td>
                                </tr>

                                <td>
                                Ref. No:
                                </td>
                                <td>
                                <div class="col-xs-8">
                                <input type="text" name="refno" id="inputs" class="form-control input-sm">
                                </div>
                                </td>
                                <td>

                                </td>
                                <td>
                                Date:
                                </td>
                                <td>
                                  <div class="col-xs-8">
                                  <input type="date" name="refdate" id="inputs" class="form-control input-sm">
                                  </div>
                                </td>
                                </tr>
                                <tr>
                                <td>
                                Bank Name:
                                </td>
                                <td>
                                  <div class="col-xs-8">
                                  <input type="text" name="bankname" id="inputs" class="form-control input-sm" list="banks">
                                  </div>
                                </td>
                                </tr>
                                <tr>
                                <td>
                                Amount:
                                </td>
                                <td>
                                  <div class="col-xs-8">
                                  <input type="text" name="amt" id="inputs" class="form-control input-sm">
                                  </div>
                                </td>
                                </tr>
                            </table>
                            <div class="btn" >
                                <input class="btn btn-primary" type="submit" name="btnup" value="Update"  id="btn">
                                <input class="btn btn-danger" type="submit" name="btndel" value="Delete" id="btn">
                                <input class="btn btn-info" type="button" name="btnback" value="Back" id="btn" onclick="window.open('paymentvendorinfoc.jsp','_self')">
                            </div>
                            </form>
                            <%@ include file="footer.jsp" %>
                            </div></div></body>
                            </html>

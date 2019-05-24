
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%
j=0;
fvdate=new String[30];
fretname=new String[30];
flocality=new String[30];
fcity=new String[30];
fstate=new String[30];
frecmode=new String[30];
frefno=new String[30];
frefdate= new String[30];
fbankname=new String[30];
famt=new String[30];

doConnect();
try{
  stmtshow1=conn.createStatement();
  rsshow1=stmtshow1.executeQuery("select * from tblreceiptinfo");
  while(rsshow1.next())
  {
      fvdate[j]=rsshow1.getString("vdate");
      fretname[j]=rsshow1.getString("retname");
      flocality[j]=rsshow1.getString("locality");
      fcity[j]=rsshow1.getString("city");
      fstate[j]=rsshow1.getString("state");
      frecmode[j]=rsshow1.getString("recmode");
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
     locality1=new String[30];
     city1=new String[30];
     state1=new String[30];

	 doConnect();
	 try{
        stmtshow=conn.createStatement();
        rsshow=stmtshow.executeQuery("select * from tblretailerinfo ");
        while(rsshow.next())
        {
        	locality1[i]=rsshow.getString("locality");
            city1[i]=rsshow.getString("city");
            state1[i]=rsshow.getString("state");

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
      <title>Find Information</title>
    <%@ include file="header.jsp" %>
      <script>

      function showReceipt()
      {
        var jvdate=new Array();
        var jretname=new Array();
        var jlocality=new Array();
        var jcity=new Array();
        var jstate=new Array();
        var jrecmode=new Array();
        var jrefno=new Array();
        var jrefdate=new Array();
        var jbankname=new Array();
        var jamt= new Array();
        var m,n;
        m=0;
        <%
        l=0;
        while(l<fretname.length)
        {
          %>
          jvdate[m]="<%= fvdate[l] %>";
          jretname[m]="<%= fretname[l] %>";
          jlocality[m]="<%= flocality[l] %>";
          jcity[m]="<%= fcity[l] %>";
          jstate[m]="<%= fstate[l] %>";
          jrecmode[m]="<%= frecmode[l] %>";
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
        document.f1.cmbretname.value=jretname[n-1];
        document.f1.txtlocality.value=jlocality[n-1];
        document.f1.txtcity.value=jcity[n-1];
        document.f1.txtstate.value=jstate[n-1];
        document.f1.recmode.value=jrecmode[n-1];
        if(jrecmode[n-1]=="CASH")
        {
            recMode();
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
            function showRetailer()
            {

            var jlocality1=new Array();
            var jcity1=new Array();
            var jstate1=new Array();


                var j,k;
                j=0;
                <%
                i=0;
                while(i<locality1.length)
                {
                %>
                jlocality1[j]="<%=locality1[i] %>";
                jcity1[j]="<%=city1[i] %>";
                jstate1[j]="<%=state1[i] %>";

                j=j+1;
                <%
                i=i+1;
                }
                %>
                k=document.f1.cmbretname.selectedIndex;
                document.f1.txtlocality.value=jlocality1[k-1];
                document.f1.txtcity.value=jcity1[k-1];
                document.f1.txtstate.value=jstate[k-1];
                  }

                  function recMode()
                  {
                      var k=document.f1.recmode.selectedIndex;
                      var recmode=document.f1.recmode.value;

                      if(k==1 || recmode=="CASH")
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
            String locality1[],city1[],state1[];
            String vouchno,fvdate[],fretname[],flocality[],fcity[],fstate[],frecmode[],frefno[],frefdate[],fbankname[],famt[];
            Statement stmtfill,stmtshow,stmtshow1,stmtfill1;
            ResultSet rsfill,rsshow,rsshow1,rsfill1;
            String retname;
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


            <h3   style="text-align:center;padding-bottom:15px;">Receipt Voucher Information&nbsp;<sup><small>Edit Information</small></sup></h3>


          <div class="well" style="border-top: solid black;border-bottom: solid black ;" >
                  <div class="container">


                  <form name="f1" id="myForm" action="receiptvoucherinfofs.jsp" >
                          <table  class="table table-borderless ">
                        <tr>
                        <td>Voucher No:</td>
                        <td>
                        <div class="col-xs-8">
                        <select  id="inputs" class="form-control input-sm" name="cmbvouchno" onchange="showReceipt()">

                          <option value="">-Select-</option>
                          <%
                          doConnect();
                          try{
                            stmtfill1=conn.createStatement();
                            rsfill1=stmtfill1.executeQuery("select * from tblreceiptinfo");
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
                                        Retaileror Name:
                                    </td>
                                    <td>
                                      <div class="col-xs-8">
                                        <select name="cmbretname"  id="inputs" class="form-control input-sm" onchange="showRetailer()">
                                            <option value="">-Select-</option>
                                             <%
                                                 doConnect();
                                                 try{
                                                     stmtfill=conn.createStatement();
                                                     rsfill=stmtfill.executeQuery("select * from tblretailerinfo");
                                                     while(rsfill.next()){
                                                         retname=rsfill.getString("retname");
                                                         %>
                                                         <option value="<%=retname%>"><%=retname%></option>
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
                                    <select name="recmode" id="inputs" class="form-control input-sm" onchange="recMode()">
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
                                <input class="btn btn-info" type="button" name="btnback" value="Back" id="btn" onclick="window.open('receiptvoucherinfoc.jsp','_self')">
                            </div>
                            </form>
                            <%@ include file="footer.jsp" %>
                            </div></div></body>
                            </html>

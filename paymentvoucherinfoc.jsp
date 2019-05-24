
<%@ page language="java" contentType="text/html" import="java.sql.*" %>


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
            Statement stmtfill,stmtshow,stmtshow1;
            ResultSet rsfill,rsshow,rsshow1;
            String vendname;
            int i,n;
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


            <h3   style="text-align:center;padding-bottom:15px;">Payment Voucher Information</h3>


          <div class="well" style="border-top: solid black;border-bottom: solid black ;" >
                  <div class="container">


                  <form name="f1" id="myForm" action="paymentvocherinfos.jsp" >
                          <table  class="table table-borderless ">
                        <tr>
                        <td>Voucher No:</td>
                        <td><div class="col-xs-8"><input type="text"  id="inputs" class="form-control input-sm" name="txtvouchno"></div></td>
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
                                        <input type="text" name="txtlocality"  id="inputs" class="form-control input-sm" >
                                    </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        City:
                                    </td>
                                    <td>
                                    <div class="col-xs-8">
                                        <input type="text" name="txtcity"  id="inputs" class="form-control input-sm">
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        State:
                                    </td>
                                    <td>
                                    <div class="col-xs-8">
                                        <input type="text" name="txtstate"  id="inputs" class="form-control input-sm"   >
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
                                <input class="btn btn-primary" type="submit" name="btnsub" value="submit"  id="btn">
                                <input class="btn btn-danger" type="reset" name="btnres" value="reset"id="btn">
                                <input class="btn btn-info" type="button" name="btnfind" value="find" id="btn" onclick="window.open('paymentvoucherinfofc.jsp','_self')">
                            </div>
                            </form>
                            <%@ include file="footer.jsp" %>
                            </div></div></body>
                            </html>

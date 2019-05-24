<%@ page language="java" contentType="text/html" import="java.sql.*" %>


<html>
<head>
<title>Purchase Information</title>
<link rel="icon" type="image/ico" href="./images/imageicon.png" />
</head>

<body>


 <%!
 Statement stmtUpdate1,stmtUpdate,stmtdel;
 ResultSet rsshow1;
 String  orderno,odate,vendname,locality,city,state,slno,prodcode,prodname,prodcat,price,quant,amt,purchaseno,pdate,disper,disamt,cgst,sgst,taxamt,netamt;
 String oldquant, prodno,btnup,btndel;
 Connection conn;
 public void doConnect()
    {
      try
      {
        Class.forName("sun.jdbc.odbc.JdbcodbcDriver");
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

purchaseno=request.getParameter("cmbpurchno");
pdate=request.getParameter("pdate");
 orderno=request.getParameter("cmbordno");
odate=request.getParameter("odate");
 vendname=request.getParameter("txtvendname");
 locality=request.getParameter("txtlocality");
 city=request.getParameter("txtcity");
 state=request.getParameter("txtstate");
 slno=request.getParameter("slno");
 prodcode=request.getParameter("cmbprodcode");
 prodname=request.getParameter("txtprodname");
 prodcat=request.getParameter("txtprodcat");
 price=request.getParameter("price");
 quant=request.getParameter("quant");
 oldquant=request.getParameter("oldQty");
 amt=request.getParameter("amt");
 disper=request.getParameter("disper");
 disamt=request.getParameter("disamt");
 cgst=request.getParameter("cgstper");
 sgst=request.getParameter("sgstper");
 taxamt=request.getParameter("taxamt");
 netamt=request.getParameter("netamt");
 btnup=request.getParameter("btnup");
 btndel=request.getParameter("btndel");

String [] purc=purchaseno.split("-");
purchaseno=purc[0];
prodno=purc[1];

if(btnup !=null)
{
 doConnect();
 try
 {
   stmtUpdate=conn.createStatement();
   stmtUpdate1=conn.createStatement();
   stmtUpdate.executeUpdate("update tblpurchaseinfo set  pdate='"+pdate+"', orderno='"+orderno+"' ,vendname='"+vendname+"', locality='"+locality+"',city='"+city+"',state='"+state+"',slno='"+slno+"', prodname='"+prodname+"', prodcat='"+prodcat+"', price='"+price+"', quant='"+quant+"', amt='"+amt+"', disper='"+disper+"', disamt='"+disamt+"', cgst='"+cgst+"', sgst='"+sgst+"', taxamt='"+taxamt+"', netamt='"+netamt+"'  where purchaseno='"+purchaseno+"' and prodcode='"+prodno+"'");
   stmtUpdate1.executeUpdate("update tblproductdetails set openingstock= openingstock - '"+oldquant+"' + '"+quant+"'  where prodcode='"+prodcode+"'");
   out.println("<table style=' align:center; padding:60px; margin-left:70px;\'>");
		out.println("  <tr><td ><img src='./images/added.gif' style='width:482px; left:50px;  height:400px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-60px;'>Data Updated successfully</p></td></tr>");
		 out.println("<tr><td></td><td></td><td></td>");
		  out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"purchaseinfofc.jsp\",\"_SELF\")'>Back</button></td>");
		  out.println("</tr> </table>");
  }
 catch(SQLException e)
 {
	 System.out.println("error"+e);
 }

}


else if(btndel != null)
{
  try
  {
  stmtdel=conn.createStatement();
		stmtdel.executeUpdate("delete from tblpurchaseinfo where purchaseno='"+purchaseno+"' ");
		out.println("<table style=' align:center; padding:60px; margin-left:70px;\'>");
				out.println("  <tr><td ><img src='./images/delete.gif' style='width:582px; left:50px;  height:470px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-60px;'>Data Deleted successfully</p></td></tr>");
				 out.println("<tr><td></td><td></td><td></td>");
				  out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"purchaseinfofc.jsp\",\"_SELF\")'>Back</button></td>");
				  out.println("</tr> </table>");
	}
	catch(SQLException sq)
	{
		out.println("Unable to Delete");
	}
}

%>

</body>
</html>

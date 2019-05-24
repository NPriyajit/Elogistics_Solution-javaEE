<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%
     i=0;
     prodcatname=new String[30];

	 doConnect();
	 try{
        stmtshow=conn.createStatement();
        rsshow=stmtshow.executeQuery("select * from tblproductinfo");
        while(rsshow.next())
        {
						prodcatname[i]=rsshow.getString("prodcatname");
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
    <title>
        Find Product Details
    </title>
<%@ include file="header.jsp" %>

  <script language="javascript">
	   function showProduct(){
		   var jpcn=new Array();
			var j,k;
			j=0;
		<%
            i=0;
            while(i < prodcatname.length)
            {
        %>
        jpcn[j]="<%=prodcatname[i] %>";
	     	j=j+1;
        <%
            i=i+1;
			}
        %>
		    k=document.f1.cmbprodcatcode.selectedIndex;
            document.f1.txtprodcatname.value=jpcn[k-1];
       }

    </script>
</head>
<body>
    <%!
    Connection conn;
    Statement stmtfill,stmtshow;
    ResultSet rsfill,rsshow;
    String prodcatcode,prodcatname[];
    int i;
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
      
        <h3 style="text-align:center;  margin-top: -7px; ">Product Category Details<sup><small>Edit Details</small></sup></h3>
      </div>
      
      <div class="well" style="border-top: solid black;border-bottom: solid black ; margin-top:70px;">

 
          <div class="container">

                  <form name="f1" id="myForm" action="productcatinfofs.jsp" >
                        <table class="table table-borderless ">
                            <div style="padding:32px;">
                                <tr>
                                        <td>
                                            Product Category Code:
                                        </td>
                                        <td>
                                          <div class="col-xs-8">
                                                <select name="cmbprodcatcode"  id="inputs" class="form-control input-sm" height:30px; text-align: center;"  onchange="showProduct()">
                                                        <option value="">-Select-</option>
                                                         <%
                                                             doConnect();
                                                             try{
                                                                 stmtfill=conn.createStatement();
                                                                 rsfill=stmtfill.executeQuery("select * from tblproductinfo");
                                                                 while(rsfill.next()){
                                                                     prodcatcode=rsfill.getString("prodcatcode");
                                                                     %>
                                                                     <option value="<%=prodcatcode%>"><%=prodcatcode%></option>
                                                                     <%
                                                                 }
                                                             }
                                                             catch(SQLException se){
                                                                 out.println("Error 2");
                                                             }
                                                         %>
                                                    </select>
                                        </td>
                                    </tr>

                              <tr>
                                    <td>
                                        Product Category Name:
                                    </td>
                                    <td>
                                      <div class="col-xs-8">
                                        <input type="text"  id="inputs" class="form-control input-sm" name="txtprodcatname">
                                    </td>
                                </tr>
                                </div>
                            </table>
                    <div class="btn">
                        <input id="btn" class="btn btn-primary" type="submit" name="btnup" value="Update">
                        <input id="btn" class="btn btn-danger" type="submit" name="btndel" value="Delete" onclick="choose()">
                        <input id="btn" class="btn btn-info" type="button" name="btnback" value="Back" onclick="window.open('productcatinfoc.html','_self')">
                    </div>
                </fieldset>
                </form>

                <div class="position-fixed">
                  <center><p class="text-muted">&copy;Project Group</p></center>
                </div>

</div>
        </div>
</body>
</html>

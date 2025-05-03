<%-- 
    Document   : DepositAction
    Created on : Jun 16, 2020, 6:55:14 AM
    Author     : Venkat
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String username=(String)session.getAttribute("username");
String ano=(String)session.getAttribute("ano");
String bankname=(String)session.getAttribute("bankname");
%>
<%@page import="java.sql.*" %>
<%@page import="com.DBCon" %>
<%
    String amount=request.getParameter("amount");
    float money=Float.parseFloat(amount);
    String balance=request.getParameter("balace");
    float bal=Float.parseFloat(balance);
        float famount=bal-money;
    try
    {
       Connection con=DBCon.getCon();
       Statement st=con.createStatement();
                 int i=st.executeUpdate("update account set balance='"+famount+"' where ano='"+ano+"'");
                 int ii=st.executeUpdate("insert into transaction values('"+ano+"','"+username+"','"+amount+"','WITHDRAW',now())");
                 if((i>0)&&(ii>0))
                 {
                     %>
                     <script type="text/javascript">
                         window.alert("Money Withdraw Sucessfully.....");
                         window.location="ViewBalance.jsp";
                         </script>
                     <%
                 }
else
{
 %>
                     <script type="text/javascript">
                         window.alert("Unable to  Withdraw Money.....");
                         window.location="ViewBalance.jsp";
                         </script>
                     <%
}
%>
                     <script type="text/javascript">
                         window.alert("Unable to  Withdraw Money.....");
                         window.location="ViewBalance.jsp";
                         </script>
                     <%
               }
               
    catch(Exception e)
    {
        out.println(e);
    }
    %>

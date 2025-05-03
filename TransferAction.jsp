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
<%try
    {
       Connection con=DBCon.getCon();
       Statement s=con.createStatement();
       String amount=request.getParameter("amount");
    float money=Float.parseFloat(amount);
    String balance=request.getParameter("balace");
    float bal=Float.parseFloat(balance);
        float famount=bal-money;
        
    String tacno=request.getParameter("tano");

    ResultSet r=s.executeQuery("select * from account where ano='"+tacno+"'");
   if(r.next()){
    
    
    
     float money1=Float.parseFloat(r.getString("balance"));    
       float tamount=money+money1; 
    
       Statement st=con.createStatement();
                 int i=st.executeUpdate("update account set balance='"+famount+"' where ano='"+ano+"'");
                  int f=st.executeUpdate("update account set balance='"+tamount+"' where ano='"+tacno+"'");
                     
                 int ii=st.executeUpdate("insert into t_transaction values('"+ano+"','"+tacno+"','"+amount+"','TRANSFER',now())");
                 if((i>0)&&(ii>0)&&(f>0))
                 {
                     %>
                     <script type="text/javascript">
                         window.alert("Money Transafer Sucessfully.....");
                         window.location="ViewBalance.jsp";
                         </script>
                     <%
                 }
else
{
 %>
                     <script type="text/javascript">
                         window.alert("Unable to  Transafer Money.....");
                         window.location="ViewBalance.jsp";
                         </script>
                     <%
}
%>
                     <script type="text/javascript">
                         window.alert("Unable to  Transfer Money.....");
                         window.location="ViewBalance.jsp";
                         </script>
                     <%
               }else{
%>
                     <script type="text/javascript">
                         window.alert("Account No Not Valid.....");
                         window.location="Transfer.jsp";
                         </script>
                     <%
}
}
               
    catch(Exception e)
    {
        out.println(e);
    }
    %>

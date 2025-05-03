<%-- 
    Document   : CustomerRegAction
    Created on : Jun 15, 2020, 7:41:35 PM
    Author     : Venkat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.DBCon" %>
<%
    String ano=request.getParameter("ano");
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String address=request.getParameter("address");
    String bankname=request.getParameter("bankname");
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String balance="0";
    try
    {
     
        Connection con=DBCon.getCon();
        Statement st=con.createStatement();
        int i=st.executeUpdate("insert into customer values('"+ano+"','"+fname+"','"+lname+"','"+email+"','"+mobile+"','"+address+"','"+bankname+"','"+username+"','"+password+"','Waiting') ");
        int ii=st.executeUpdate("insert into account values('"+ano+"','"+username+"','"+password+"','"+balance+"')");
        if((i>0)&&(ii>0))
        {
         %>
         <script type='text/javascript'>
             window.alert("Account Created SucessFully");
             window.location="Customer.jsp";
             
             </script>
         <%
        }
else
{
%>
         <script type='text/javascript'>
             window.alert("Unable to Create Account Right Now");
             window.location="CustomerReg.jsp";
             
             </script>
         <%
}
        
    }
    catch(Exception e)
    {
      out.println(e);  
    }
    %>
    
    
    
    
    
    
    %>

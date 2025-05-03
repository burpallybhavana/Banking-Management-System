<%-- 
    Document   : AdminLogin
    Created on : Jun 15, 2020, 5:34:35 PM
    Author     : Venkat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="com.DBCon" %>
<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    
try
{
    Connection con=DBCon.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select *from admin where username='"+username+"' and password='"+password+"'");
    if(rs.next())
    {
     %>
     <script type="text/javascript">
         window.alert("Admin Login SucessFully");
         window.location="AdminHome.jsp";
         </script>
     <%
    }
else
{
%>
     <script type="text/javascript">
         window.alert("Admin Login Fail");
         window.location="Admin.jsp";
         </script>
     <%
}
}
catch(Exception e)
{
out.println(e);
}
    %>
<%-- 
    Document   : CustomerRegAction
    Created on : Jun 15, 2020, 7:41:35 PM
    Author     : Venkat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.DBCon" %>
<%
    String eid=request.getParameter("eid");
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String address=request.getParameter("address");
    String bankname=request.getParameter("bankname");
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    try
    {
     
        Connection con=DBCon.getCon();
        Statement st=con.createStatement();
        int i=st.executeUpdate("insert into employee values('"+eid+"','"+fname+"','"+lname+"','"+email+"','"+mobile+"','"+address+"','"+bankname+"','"+username+"','"+password+"','Waiting') ");
        if(i>0)
        {
         %>
         <script type='text/javascript'>
             window.alert("Employee Account Created SucessFully");
             window.location="Employee.jsp";
             
             </script>
         <%
        }
else
{
%>
         <script type='text/javascript'>
             window.alert("Unable to Create Account Right Now");
             window.location="EmployeeReg.jsp";
             
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

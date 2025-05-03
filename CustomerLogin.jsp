<%-- 
    Document   : EmployeeLogin
    Created on : Jun 15, 2020, 8:40:29 PM
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
      ResultSet rs=st.executeQuery("select * from customer where username='"+username+"' and password='"+password+"'");
      while(rs.next())
      {
          String status=rs.getString("status");
          String ano=rs.getString("ano");
          session.setAttribute("username",username);
          session.setAttribute("ano",ano);
             String bankname=rs.getString("bankname");
              session.setAttribute("bankname",bankname);
          if(status.equalsIgnoreCase("Waiting"))
           
          {
              %>
              <script type="text/javascript">
                  window.alert("Your Account Not Yet Activated");
                  window.location="Customer.jsp";
                  </script>
              <%
          }
else
if(status.equalsIgnoreCase("Activated"))
{
%>
              <script type="text/javascript">
                  window.alert("Login Sucessfully....");
                  window.location="CustomerHome.jsp";
                  </script>
              <%
}
else
{
%>
              <script type="text/javascript">
                  window.alert("Username or Password Incorrect....");
                  window.location="Employee.jsp";
                  </script>
              <%
}
%>
              <script type="text/javascript">
                  window.alert("Username or Password Incorrect....");
                  window.location="Employee.jsp";
                  </script>
              <%
      }
%>
              <script type="text/javascript">
                  window.alert("Username or Password Incorrect....");
                  window.location="Employee.jsp";
                  </script>
              <%
    }
    catch(Exception e)
    {
      out.println(e);
    }
    %>
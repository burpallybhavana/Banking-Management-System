<%-- 
    Document   : EActivate
    Created on : Jun 15, 2020, 8:33:47 PM
    Author     : Venkat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="com.DBCon" %>
<%
    String ano=request.getParameter("ano");
    try
    {
        Connection con=DBCon.getCon();
        Statement st=con.createStatement();
        int i=st.executeUpdate("update customer set status='Activated' where ano='"+ano+"'");
        if(i>0)
        {
            %>
            <script type="text/javascript">
                window.alert("Customer Account Activated SucessFully.....");
                window.location="EViewCustomers.jsp";
                </script>
            <%
        }
else
{
%>
            <script type="text/javascript">
                window.alert("Unbale To Activate Customer Account Try After Some Time.....");
                window.location="EViewCustomers.jsp";
                </script>
            <%
}
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>

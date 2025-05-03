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
    String eid=request.getParameter("eid");
    try
    {
        Connection con=DBCon.getCon();
        Statement st=con.createStatement();
        int i=st.executeUpdate("update employee set status='Activated' where eid='"+eid+"'");
        if(i>0)
        {
            %>
            <script type="text/javascript">
                window.alert("Employee Account Activated SucessFully.....");
                window.location="ViewEmployees.jsp";
                </script>
            <%
        }
else
{
%>
            <script type="text/javascript">
                window.alert("Unbale To Activate Employee Account Try After Some Time.....");
                window.location="ViewEmployees.jsp";
                </script>
            <%
}
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>

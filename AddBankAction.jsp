<%-- 
    Document   : AddBankAction
    Created on : Jun 15, 2020, 6:52:51 PM
    Author     : Venkat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="com.DBCon" %>
<%
    String bankname=request.getParameter("bankname");
    String branch=request.getParameter("branch");
    try
    {
        Connection con=DBCon.getCon();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select count(*) from addbank where bankname='"+bankname+"' and branch='"+branch+"'");
        while(rs.next())
        {
            int count=rs.getInt(1);
            if(count==0)
            {
                int i=st.executeUpdate("insert into addbank values('"+bankname+"','"+branch+"')");
                if(i>0)
                {
                    %>
                    <script type='text/javascript'>
                        window.alert("Bank Added Sucessfully.... ");
                        window.location="AdminHome.jsp";
                        </script>
                    <%
                 
                }
else
{
%>
                    <script type='text/javascript'>
                        window.alert("Unbale To  Add Bank Details.... ");
                        window.location="AdminHome.jsp";
                        </script>
                    <%
}
            }
%>
                    <script type='text/javascript'>
                        window.alert("Bank Already Added.... ");
                        window.location="AdminHome.jsp";
                        </script>
                    <%
        }
%>
                    <script type='text/javascript'>
                        window.alert("Bank Already Added.... ");
                        window.location="AdminHome.jsp";
                        </script>
                    <%

    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>

<%-- 
    Document   : ChangePass
    Created on : 1 Mar, 2022, 11:23:47 AM
    Author     : my pc
--%>
<%@page import="java.sql.ResultSet" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body align="center">

        <%
            if (request.getParameter("update") != null) {

                String select = "select * from tbl_teacher where teacher_password='" + request.getParameter("current") + "' and teacher_id='" + session.getAttribute("Teacherid") + "'";
                ResultSet rs = con.selectCommand(select);

                if (!rs.next()) {
        %>
        <script>alert('invallid current password 😬');</script>

        <%
        } else {

            if (request.getParameter("new").equals(request.getParameter("confirm"))) {
                String upd = "update tbl_teacher set teacher_password='" + request.getParameter("new") + "' where teacher_id='" + session.getAttribute("Teacherid") + "'";
                con.executeCommand(upd);
        %>
        <script>alert(' password Changed 😌');</script>

        <%
        } else {
        %>
        <script>alert(' password missmatch 🧐');</script>

        <%
                    }
                }
            }
        %>















        <h1 align="center">Change Your Password</h1>


        <form method="post">

            <table align="center"> 
                <tr>

                    <td>Current Password</td>
                    <td>

                        <input type="text" name="current" value="">
                    </td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td>
                        <input type="text" name="new" value="">
                    </td>
                </tr>
                <tr>
                    <td>Re Enter Password</td>
                    <td>   
                        <input type="text" name="confirm" value=""> 
                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit"     name="update" value="UPDATE">
                        <input type="reset" name="Cancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
         <%@include file="footer.jsp" %>
    </body>
</html>

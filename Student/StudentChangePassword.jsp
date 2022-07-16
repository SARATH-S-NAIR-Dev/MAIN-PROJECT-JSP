<%-- 
    Document   : ChangePass
    Created on : 1 Mar, 2022, 11:23:47 AM
    Author     : my pc
--%>
<%@include file="header.jsp" %>
<%@page import="java.sql.ResultSet" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body align="center">

        <%            if (request.getParameter("update") != null) {

                String select3 = "select * from tbl_student where student_password='" + request.getParameter("current") + "' and student_id='" + session.getAttribute("Studentid") + "'";
                ResultSet rs3 = con.selectCommand(select3);

                if (!rs3.next()) {
        %>
        <script>alert('invallid current password 😬');</script>

        <%
        } else {

            if (request.getParameter("new").equals(request.getParameter("confirm"))) {
                String upd = "update tbl_student set student_password='" + request.getParameter("new") + "' where student_id='" + session.getAttribute("Studentid") + "'";
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


        <h2 align="center">Change Your Password</h2>


        <form method="post">

            <table align="center">
                <br>
                <br>
                <tr>
                    <td>Current Password</td>
                    <td>

                        <input type="text" class="form-control" name="current" value="">
                    </td>

                </tr>
                <tr>
                    <td>New Password</td>
                    <td>
                        <input type="text"class="form-control" name="new" value="">
                    </td>
                </tr>
                <tr>
                    <td>Re Enter Password</td>
                    <td>   
                        <input type="text" class="form-control" name="confirm" value=""> 
                    </td>
                </tr>
                <tr>

                </tr>

                <tr>

                    <td colspan="2" align="center">
                        <br>
                        <br>
                       
                        <input type="submit" style="color: white"  class="button button-a btn-lg button-rouded"   name="update" value="UPDATE">
                        <input type="reset" class="button button-a btn-lg button-rouded" name="Cancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
        <%@include file="footer.jsp" %>
    </body>
</html>

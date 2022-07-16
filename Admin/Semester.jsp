<%-- 
    Document   : District
    Created on : 23 Feb, 2022, 3:10:37 PM
    Author     : my pc
--%>
<%@include file="Header.jsp" %>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String sname = "", sid = "";

            if (request.getParameter("btnsave") != null) {

                if (!request.getParameter("txthidden").equals("")) {
                    String upd = "update tbl_semester set semester_name='" + request.getParameter("semester") + "' where semester_id='" + request.getParameter("eid") + "'";
                    con.executeCommand(upd);
                    out.println(upd);

        %>
        <script>
            alert('Updated');
        </script>

        <%        } else {

            String insert = "insert into tbl_semester(semester_name)values('" + request.getParameter("semester") + "')";
            con.executeCommand(insert);


        %>
        <script>
            alert('Inserted');
        </script>

        <%                    //  out.println(insert);
                }

            }
            if (request.getParameter("did") != null) {

                String del = "delete from tbl_semester where semester_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);
        %>
        
        
        
        
        <script>alert('deleted') </script>
        
        <%
            }

        %>

        <%                    if (request.getParameter("eid") != null) {
                String sel = "select * from tbl_semester where semester_id='" + request.getParameter("eid") + "'";
                ResultSet rs = con.selectCommand(sel);
                rs.next();
                {
                    sname = rs.getString("semester_name");
                    sid = rs.getString("semester_id");
                    response.sendRedirect("Semester.jsp");

                }
            }


        %>


        <h1 align="center">Semester!</h1>
        <form method="post">
            <table align="center" border="1" class="table text-start align-middle table-bordered table-hover mb-0">
                <input type="hidden" name="txthidden" value="<%=sid%>">
                <tr>

                    <td>Semester Name</td>
                    <td>
                        <input type="text" name="semester" required="" value="<%=sname%>">

                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave"  class="btn btn-primary ms-2" value="SAVE">
                        <input type="reset" name="reset"  class="btn btn-primary ms-2" value="RESET"
                    </td>
                </tr>

            </table>
            <br>
            <table align="center" border="1" class="table text-start align-middle table-bordered table-hover mb-0">
                <tr>
                    <td>SI NO</td>
                    <td>Semester Name</td>

                    <td>Action</td>
                </tr>
                <%

                    String select = "select * from tbl_semester";
                    ResultSet rs = con.selectCommand(select);
                    int i = 0;
                    while (rs.next()) {
                        i++;

                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("semester_name")%></td>

                    <td><a href="Semester.jsp?did=<%=rs.getString("semester_id")%>">Delete</a>/
                        <a href="Semester.jsp?eid=<%=rs.getString("semester_id")%>">Edit</a>

                    </td>
                </tr>

                <%

                    }


                %>
            </table>
        </form>
             <%@include file="Footer.jsp" %>
    </body>
</html>

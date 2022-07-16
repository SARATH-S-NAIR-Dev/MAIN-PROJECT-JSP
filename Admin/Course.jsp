<%-- 
    Document   : Course
    Created on : 23 Feb, 2022, 3:10:37 PM
    Author     : my pc
--%>
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
            String cname = "", cid = "", ccode = "";

            if (request.getParameter("btnsave") != null) {

                if (!request.getParameter("txthidden").equals("")) {
                    String upd = "update tbl_course set course_name='" + request.getParameter("course") + "',course_code='" + request.getParameter("code") + "' where course_id='" + request.getParameter("eid") + "'";
                    con.executeCommand(upd);
                  //  out.println(upd);

        %>
        <script>
            alert('Updated');

           
        </script>

        <%        } else {

            String insert = "insert into tbl_course(course_name,course_code)values('" + request.getParameter("course") + "','" + request.getParameter("code") + "')";
            con.executeCommand(insert);


        %>
        <script>
            alert('Inserted');
        </script>

        <%                }

            }
            if (request.getParameter("did") != null) {

                String del = "delete from tbl_course where course_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);

            }

            if (request.getParameter("eid") != null) {
                String sel = "select * from tbl_course where course_id='" + request.getParameter("eid") + "'";
                ResultSet rs = con.selectCommand(sel);
                rs.next();
                {
                    cname = rs.getString("course_name");
                    cid = rs.getString("course_id");
                    ccode = rs.getString("course_code");
                }
            }


        %>


        <h1 align="center">Course!</h1>
        <form method="post">
            <table align="center" border="1">
                <input type="hidden" name="txthidden" value="<%=cid%>">
                <tr>

                    <td>Course Name</td>
                    <td>
                        <input type="text" name="course" required="" value="<%=cname%>">

                    </td>
                </tr>
                <tr>
                    <td>Course Code</td>
                    <td><input type="text" name="code" required="" value="<%=ccode%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SAVE">
                        <input type="reset" name="reset" value="RESET"
                    </td>
                </tr>

            </table>
            <br>
            <table align="center" border="1">
                <tr>
                    <td>SI NO</td>
                    <td>Course Name</td>
                    <td>Course Code</td>
                    <td>Action</td>
                </tr>
                <%

                    String select = "select * from tbl_course";
                    ResultSet rs = con.selectCommand(select);
                    int i = 0;
                    while (rs.next()) {
                        i++;

                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("course_name")%></td>
                    <td><%=rs.getString("course_code")%></td>
                    <td><a href="Course.jsp?did=<%=rs.getString("course_id")%>">Delete</a>/
                        <a href="Course.jsp?eid=<%=rs.getString("course_id")%>">Edit</a>

                    </td>
                </tr>

                <%

                    }


                %>
            </table>
        </form>
    </body>
</html>

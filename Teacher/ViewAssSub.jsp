<%-- 
    Document   : ViewAssSub
    Created on : 22 Apr, 2022, 12:32:34 PM
    Author     : psst
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
         <%@include file="header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            session.setAttribute("vid", request.getParameter("vid"));

        %>
        <div id="tab" align="center">
        <form method="post">
            <table    >
                <tr>
                    <td>SI NO</td>
                    <td>Rgister No</td>
                    <td>Roll No</td>
                    <td>Name</td>
                    <td>Assignment</td>
                    <td>Marks</td>
                </tr>
                <%                        String select = "select * from tbl_assignment a inner join tbl_student s on s.student_id=a.student_id where notification_id='" + session.getAttribute("vid") + "'";
                    ResultSet rs = con.selectCommand(select);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>



                <tr> 
                    <td> <%=i%></td>
                    <td> <%=rs.getString("student_regno")%></td>
                    <td> <%=rs.getString("student_roll")%></td>
                    <td> <%=rs.getString("student_name")%></td>
                    <td><a href="../Assets/Files/Assignment/<%=rs.getString("assignment_file")%>" download>Download</a>/<a href="../Assets/Files/Assignment/<%=rs.getString("assignment_file")%>" target="_blank">View</a></td>

                    <td> <input type="text" value="<%=rs.getString("assignment_mark")%>" name="<%=rs.getString("assignment_id")%>"></td>
                </tr>

                <%

                    }%>


                <tr>
                    <td colspan="6" align="center">
                        <input type="submit"  name="Sub" value="Sumbit">

                    </td>

                </tr>

            </table>
        </form>
        </div>
        <%

            if (request.getParameter("Sub") != null) {
                String sel = "select * from tbl_assignment a inner join tbl_student s on s.student_id=a.student_id where notification_id='" + session.getAttribute("vid") + "'";
                ResultSet rez = con.selectCommand(sel);
                while (rez.next()) {
                    String upd = "update tbl_assignment set assignment_mark ='" + request.getParameter(rez.getString("assignment_id")) + "' where assignment_id='" + rez.getString("assignment_id") + "'";
                    con.executeCommand(upd);
                }
                response.sendRedirect("ViewAssSub.jsp?vid=" + session.getAttribute("vid"));
            }
        %>
 <%@include file="footer.jsp" %>
    </body>
</html>

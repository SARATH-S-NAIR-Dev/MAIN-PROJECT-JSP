<%-- 
    Document   : MarkView
    Created on : Apr 18, 2022, 3:59:26 AM
    Author     : PSST
--%>
<%@page import="java.sql.ResultSet" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
        <table >
           
            <%

                String select1 = "select * from tbl_mark m inner join tbl_subject s on m.subject_id=s.subject_id where  student_id='"+session.getAttribute("Studentid")+"' and s.semester_id='"+request.getParameter("mid")+"' and subject_status=0";
               // out.println(select1);
                ResultSet rs1 = con.selectCommand(select1);
                int i1 = 0;
                while (rs1.next()) {
                    i1++;

            %>

            <tr>
                <td><%=rs1.getString("subject_name")%></td>
                <td><%=rs1.getString("mark_mark")%></td>
                <td><%=rs1.getString("mark_status")%></td>
                <td><%=rs1.getString("mark_grade")%></td>
            </tr>

            <%
                }
            %>
        </table>
        </div>
    </body>
    <%@include file="footer.jsp" %>
</html>

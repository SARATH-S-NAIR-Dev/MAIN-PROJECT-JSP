
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
        <% String subname = "", subid = "", semid = "", code = "",min = "";

            if (request.getParameter("btnsave") != null) {

                if (!request.getParameter("txthidden").equals("")) {
                    String upd = "update tbl_subject set subject_name='" + request.getParameter("subject") + "',semester_id='" + request.getParameter("slctsemester") + "',subject_code='" + request.getParameter("code") + "',subject_short='" + request.getParameter("min") + "' where subject_id='" + request.getParameter("eid") + "'";
                    con.executeCommand(upd);
                    out.println(upd);
                    response.sendRedirect("Subject.jsp");


        %>
        <script>
            alert('Updated');
        </script>

        <%        } else {

            String insert = "insert into tbl_subject(subject_name,subject_status,semester_id,subject_code,subject_short)values('" + request.getParameter("subject") + "','" + request.getParameter("rdo_status") + "','" + request.getParameter("slctsemester") + "','" + request.getParameter("code") + "','" + request.getParameter("min") + "')";
            con.executeCommand(insert);


        %>
        <script>
            alert('Inserted');
        </script>

        <%                    //  out.println(insert);
                }

            }
            if (request.getParameter("did") != null) {

                String del = "delete from tbl_subject where subject_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);
                response.sendRedirect("Subject.jsp");

            }

            if (request.getParameter("eid") != null) {
                String sel = "select * from tbl_subject where subject_id='" + request.getParameter("eid") + "'";
                ResultSet rs = con.selectCommand(sel);
                rs.next();
                {
                    subname = rs.getString("subject_name");
                    subid = rs.getString("subject_id");
                    semid = rs.getString("semester_id");
                    code = rs.getString("subject_code");
                    min = rs.getString("subject_short");

                }
            }


        %>


        <h1 align="center">Subject!</h1>
        <form method="post">
            <table align="center" border="1" class="table text-start align-middle table-bordered table-hover mb-0">
                <input type="hidden" name="txthidden" value="<%=subid%>">
                <tr>

                    <td>Subject Name</td>
                    <td>
                        <input type="text" name="subject" required="" value="<%=subname%>">

                    </td>
                </tr>


                <tr>
                    <td>Semester ID</td>
                    <td>
                        <select name="slctsemester">
                            <option>--select--</option>
                            <%
                                String sel = "select * from tbl_semester";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("semester_id")%>"><%=rs.getString("semester_name")%></option>
                            <%
                                }
                            %>
                        </select>

                    </td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>
                        <input type="radio" name="rdo_status" required="" value="0"> Yes
                        <input type="radio" name="rdo_status" value="1"> No
                    </td>
                </tr>
                <tr>
                    <td>Code</td>
                    <td>
                        <input type="text" name="code" required="" value="<%=code%>">
                    </td>
                </tr>
                <tr>
                    <td>Short Name</td>
                    <td>
                        <input type="text" name="min" required="" value="<%=min%>">
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
                    <td>Subject Name</td>
                    <td>Semester ID</td>
                    <td>Subject Code</td>
                    <td>Action</td>
                </tr>
                <%
                    String select = "select * from tbl_subject s inner join tbl_semester d on d.semester_id=s.semester_id ";
                    ResultSet res = con.selectCommand(select);
                    int i = 0;
                    while (res.next()) {
                        i++;

                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=res.getString("subject_name")%></td>
                    <td><%=res.getString("semester_name")%></td>
                    <td><%=res.getString("subject_code")%></td>
                    <td><%=res.getString("subject_short")%></td>
                    <td><a href="Subject.jsp?did=<%=res.getString("subject_id")%>">Delete</a>/
                        <a href="Subject.jsp?eid=<%=res.getString("subject_id")%>">Edit</a>
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

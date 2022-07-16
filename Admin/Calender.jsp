<%-- 
    Document   : Course
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
       


        <h1 align="center">Calender!</h1>
        <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/CalenderAction.jsp">
            <table align="center" border="1" class="table text-start align-middle table-bordered table-hover mb-0">
               
                <tr>
                    <td>Calender File</td>
                    <td><input type="file" name="file" required=""  class="btn btn-primary ms-2" value=""></td>
                </tr>
                 <tr>
                        <td ><label>Semester</label></td>
                        <td>
                            <div class="nav-item dropdown" style="color: #009CFF">
                                <select name="slctsem" style="color: #009CFF" class="nav-link dropdown-toggle" >
                                    <option>--select--</option>
                                    <%
                                        String sele = "select * from tbl_semester";
                                        ResultSet res = con.selectCommand(sele);
                                        while (res.next()) {
                                    %>
                                    <option  value="<%=res.getString("semester_id")%>"><%=res.getString("semester_name")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
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
                    <td>Calender Date</td>
                    <td>Calender File</td>
                     <td>Semester ID</td>
                    <td>Action</td>
                </tr>
                <%

                    String select = "select * from tbl_calender c inner join tbl_semester s on s.semester_id=c.semester_id";
                    ResultSet rs = con.selectCommand(select);
                    int i = 0;
                    while (rs.next()) {
                        i++;

                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("calender_date")%></td>
                    <td><a href="../Assets/Files/CalenderPDF/<%=rs.getString("calender_file")%>" download>Download</a>/<a href="../Assets/Files/CalenderPDF/<%=rs.getString("calender_file")%>" target="_blank">View</a></td>
                    <td><%=rs.getString("semester_id")%></td>
                    <td><a href="Course.jsp?did=<%=rs.getString("calender_id")%>">Delete</a>/
                        <a href="Course.jsp?eid=<%=rs.getString("calender_id")%>">Edit</a>

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

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
            String dname = "", did = "";

            if (request.getParameter("btnsave") != null) {

                String insert = "insert into tbl_notification(notification_title,notification_content,notification_type)values('" + request.getParameter("title") + "','" + request.getParameter("notification") + "','" + request.getParameter("type") + "')";
                con.executeCommand(insert);
//                out.println(insert);


        %>
        <script>
            alert('Inserted 😊');
        </script>

        <%                    //  out.println(insert);
            }

            if (request.getParameter("did") != null) {

                String del = "delete from tbl_notification where notification_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);
                response.sendRedirect("Notification.jsp");

            }


        %>

        
        <h1 align="center">Notification!</h1>
        <form method="post">
            <table align="center" border="1" class="table text-start align-middle table-bordered table-hover mb-0">
                <tr>
                
                <td>Notification Title</td>
                <td>
                    <input type="text" name="title" required="" value="">
                    
                </td>
            </tr>
                <tr>

                    <td>Notification</td>
                    <td>
                        <textarea rows = "10" cols = "30" name = "notification" placeholder="Enter Notification"></textarea>

                    </td>
                </tr>
                <tr>
                    <td style="color: #201e88"><label>Notification Type</label> </td>
                    <td>
                        <input type="radio"  name="type" required="" value="student">Student
                        <input type="radio"  name="type" required="" value="teacher">Teacher
                        <input type="radio"  name="type" required="" value="both">Both
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
                    <td>Notification Title</td>
                    <td>Notification</td>
                    <td>Notification Type</td>

                    <td>Action</td>
                </tr>
                <%  
                    String select = "select * from tbl_notification";
                    ResultSet rs = con.selectCommand(select);
                    int i = 0;
                    while (rs.next()) {
                        i++;

                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("notification_title")%></td>
                    <td><%=rs.getString("notification_content")%></td>
                    <td><%=rs.getString("notification_type")%></td>

                    <td><a href="Notification.jsp?did=<%=rs.getString("notification_id")%>">Delete</a>/

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

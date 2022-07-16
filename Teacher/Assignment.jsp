<%-- 
    Document   : TeachChat
    Created on : 23 Feb, 2022, 3:10:37 PM
    Author     : my pc
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
        <%
            session.setAttribute("mid", request.getParameter("mid"));
            String ccontent = "", did = "", desc = "", title = "", date = "", eid = "";

            if (request.getParameter("btnsave") != null) {
                if (!request.getParameter("txthidden").equals("")) {
                    String upd = "update tbl_assignnoti set noti_title='" + request.getParameter("title") + "',noti_details='" + request.getParameter("description") + "',noti_subdate='" + request.getParameter("date") + "' where noti_id='" + request.getParameter("eid") + "'";
                    con.executeCommand(upd);
        %>
        <script>alert('updated😁👍');</script>
        <%
        } else {

            String insert = "insert into tbl_assignnoti(noti_title,noti_details,noti_date,noti_subdate,subject_id)values('" + request.getParameter("title") + "','" + request.getParameter("description") + "',curdate(),'" + request.getParameter("date") + "','" +session.getAttribute("mid") + "')";
            con.executeCommand(insert);


        %>
        <script>
            alert('Inserted');
        </script>

        <%                //  out.println(insert);
                }
            }

        %>
        <%if (request.getParameter("did") != null) {
                String del = "delete from tbl_assignnoti where noti_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);
                response.sendRedirect("Assignment.jsp");

            }

        %>
        <%if (request.getParameter("eid") != null) {
                String sel = "select * from tbl_assignnoti";
                ResultSet rs3 = con.selectCommand(sel);
                rs3.next();
                {
                    title = rs3.getString("noti_title");
                    desc = rs3.getString("noti_details");
                    date = rs3.getString("noti_subdate");
                    eid = rs3.getString("noti_id");

                }

            }


        %>


  <div id="tab" align="center">
        <h1 align="center">Assignment!</h1>
        <form method="post">
            <table align="center" >
                <input type="hidden" name="txthidden" value="<%=eid%>">
                <tr>

                    <td>Title</td>
                    <td>
                        <input type="text" name="title" required="" value="<%=title%>">

                    </td>
                </tr>

                <tr>

                    <td>Description</td>
                    <td>
                        <textarea type="text" name="description" required="" value=""><%=desc%></textarea>

                    </td>
                </tr>
                <tr>

                    <td>Submission Date</td>
                    <td>
                        <input type="date" name="date" required="" value="<%=date%>">

                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="SEND">
                        <input type="reset" name="reset" value="RESET"
                    </td>
                </tr>

            </table>
            <br>
            <table align="center" border="1">
                <tr>
                    <td>SI NO</td>
                    <td>Title</td>
                    <td>Description</td>
                    <td>Submission Date</td>
                    <td>Action</td>
                    <td>Submissions</td>
                </tr>
                <%

                    String select3 = "select * from tbl_assignnoti where subject_id='"+session.getAttribute("mid")+"'";
                    ResultSet rs3 = con.selectCommand(select3);
                    int k = 0;
                    while (rs3.next()) {
                        k++;

                %>

                <tr>
                    <td><%=k%></td>
                    <td><%=rs3.getString("noti_title")%></td>
                    <td><%=rs3.getString("noti_details")%></td>
                    <td><%=rs3.getString("noti_subdate")%></td>
                    <td> <a href="Assignment.jsp?did=<%=rs3.getString("noti_id")%>">Delete</a>/
                     <a href="Assignment.jsp?eid=<%=rs3.getString("noti_id")%>&mid=<%=session.getAttribute("mid")%>">Edit</a></td>
                    <td> <a href="ViewAssSub.jsp?vid=<%=rs3.getString("noti_id")%>">View</a></td>
                    <%
                        }
                    %>
            </table>
        </form>
  </div>
 <%@include file="footer.jsp" %>
    </body>
</html>

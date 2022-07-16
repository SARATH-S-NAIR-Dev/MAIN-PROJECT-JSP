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
        <%            String ccontent = "", did = "", ctime = "", cdate = "", cteacher = "", cid = "";

            if (request.getParameter("btnsave") != null) {

                String insert = "insert into tbl_peer(peer_date,peer_time,peer_content,student_id)values(curdate(),curtime(),'" + request.getParameter("peer") + "','" + session.getAttribute("Studentid") + "')";
                con.executeCommand(insert);
                out.println(insert);


        %>
        <script>
            alert('Inserted');
        </script>

        <%                //  out.println(insert);
            }

        %>
        <%if (request.getParameter("cid") != null) {
                session.setAttribute("pid", request.getParameter("cid"));
                response.sendRedirect("Chat/Chat.jsp");

            }


        %>
       
        
       
        <div id="tab" align="center">

            
            <form method="post">
               
                <table>
                     <h2 style="color: #0078ff" align="center">Ask!</h2>
                    <input type="hidden" name="txthidden" value="<%=did%>">
                    <tr>

                        <td>Question..?</td>
                        <td>
                            <textarea type="text" name="peer" required="" value="<%=ccontent%>"></textarea>

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
                        <td>Question</td>
                        <td>Name</td>
                        <td>Action</td>
                    </tr>
                    <%

                        String select1 = "select * from tbl_peer";
                        ResultSet rs1 = con.selectCommand(select1);
                        int j = 0;
                        while (rs1.next()) {
                            j++;

                    %>

                    <tr>
                        <td><%=j%></td>
                        <td><%=rs1.getString("peer_content")%></td>
                        <td>
                        <%

                            if (rs1.getString("teacher_id").equals("0")) {
                                String sel = "select * from tbl_student where student_id='" + rs1.getString("student_id") + "'";
                                ResultSet res = con.selectCommand(sel);
                                while (res.next()) {
                        %>
                        <%=res.getString("student_name")%>

                        <%
                            }
                        } else if (rs1.getString("student_id").equals("0")) {
                            String sel = "select * from tbl_teacher where teacher_id='" + rs1.getString("teacher_id") + "'";
                            ResultSet res = con.selectCommand(sel);
                            while (res.next()) {
                        %>
                        <%=res.getString("teacher_name")%>


                        <%
                                }
                            }
                        %>
                        </td>
                        <td> <a href="peer.jsp?cid=<%=rs1.getString("peer_id")%>">Replay</a></td>
                        <%
                            }
                        %>
                </table>
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>

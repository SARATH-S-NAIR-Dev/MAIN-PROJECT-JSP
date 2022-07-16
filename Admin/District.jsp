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

        <%            String dname = "", did = "";

            if (request.getParameter("btnsave") != null) {

                if (!request.getParameter("txthidden").equals("")) {
                    String upd = "update tbl_district set district_name='" + request.getParameter("district") + "' where district_id='" + request.getParameter("eid") + "'";
                    con.executeCommand(upd);
//                     out.println(upd);
                    response.sendRedirect("District.jsp");

        %>
        <script>
            alert('Updated');
        </script>

        <%        } else {

            String insert = "insert into tbl_district(district_name)values('" + request.getParameter("district") + "')";
            con.executeCommand(insert);
            response.sendRedirect("District.jsp");

        %>
        <script>
            alert('Inserted');
        </script>

        <%                    //  out.println(insert);
                }

            }
            if (request.getParameter("did") != null) {

                String del = "delete from tbl_district where district_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);
                response.sendRedirect("District.jsp");

            }

            if (request.getParameter("eid") != null) {
                String sel = "select * from tbl_district where district_id='" + request.getParameter("eid") + "'";
                ResultSet rs = con.selectCommand(sel);
                rs.next();
                {
                    dname = rs.getString("district_name");
                    did = rs.getString("district_id");

                }
            }


        %>


        <h1 align="center">Add New District!</h1>
        <form method="post">
            <table align="center" cellpadding='5'>
                <input type="hidden" name="txthidden" value="<%=did%>">
                <tr>

                    <td>District Name</td>
                    <td>
                        <input type="text" name="district" required="" value="<%=dname%>">

                    </td>
                <br>


                <td colspan="2" align="center">
                    <input type="submit" name="btnsave" class="btn btn-primary ms-2" value="SAVE">
                    <input type="reset" name="reset" class="btn btn-primary ms-2" value="RESET">
                </td>
                </tr>

            </table >
            <br>
            <table class="table text-start align-middle table-bordered table-hover mb-0">
                <tr>
                    <td>SI NO</td>
                    <td>District Name</td>

                    <td>Action</td>
                </tr>
                <%

                    String select = "select * from tbl_district";
                    ResultSet rs = con.selectCommand(select);
                    int i = 0;
                    while (rs.next()) {
                        i++;

                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("district_name")%></td>

                    <td><a href="District.jsp?did=<%=rs.getString("district_id")%>">Delete</a>/
                        <a href="District.jsp?eid=<%=rs.getString("district_id")%>">Edit</a>

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


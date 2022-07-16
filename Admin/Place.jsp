<%-- 
    Document   : category
    Created on : 23 Feb, 2022, 3:26:51 PM
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

            if (request.getParameter("Save") != null) {
                String insert = "insert into tbl_place(place_name,district_id)values('" + request.getParameter("place") + "','" + request.getParameter("slctdistrict") + "')";
                con.executeCommand(insert);
               // out.println(insert);
            }
        %>

        <h1 align="center">Place!</h1>
        <form method="post">
            <table align="center" class="table text-start align-middle table-bordered table-hover mb-0">
                <tr>

                    <td> Place Name</td>
                    <td>
                        <input type="text" name="place" required="" value="">

                    </td>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="slctdistrict">
                            <option>--select--</option>
                            <%
                                String sel = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                            <%
                                }
                            %>
                        </select>

                    </td>
                </tr>



                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="Save"  class="btn btn-primary ms-2" value="save">
                    </td>
                </tr>

                <br>
                <table align="center" border="1" class="table text-start align-middle table-bordered table-hover mb-0">
                    <tr>
                        <td>Si No</td>
                        <td>Place Name</td>
                        <td>District Name</td>


                    </tr>

                    <%
                        String select = "select * from tbl_place p inner join tbl_district d on d.district_id=p.district_id";
                        ResultSet res = con.selectCommand(select);
                        int i = 0;
                        while (res.next()) {
                            i++;
                    %>

                    <tr>
                        <td><%=i%></td>
                        <td><%=res.getString("place_name")%></td>
                        <td><%=res.getString("district_name")%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>

        </form>
 <%@include file="Footer.jsp" %>
    </body>
</html>

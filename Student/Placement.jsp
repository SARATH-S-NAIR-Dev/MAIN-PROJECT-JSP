<%-- 
    Document   : Course
    Created on : 23 Feb, 2022, 3:10:37 PM
    Author     : my pc
--%>
<%@include file="header.jsp" %>
<%@page import="java.sql.ResultSet" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <div id="tab" align="center">

        <h2 align="center">Add Placements!</h2>
        <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/PlacementAction.jsp">
            <table align="center" border="1" width="200px" >
               
                 <tr>
                    <td>Industry Tittle</td>
                    <td><input type="text" name="name" required="" value="name"></td>
                </tr>
                <tr>
                    <td>Proof</td>
                    <td><input type="file" name="file" required=""   value="proof"></td>
                </tr>
                 
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave"  class="btn btn-primary ms-2" value="SAVE">
                        <input type="reset" name="reset"  class="btn btn-primary ms-2" value="RESET"
                    </td>
                </tr>

            </table>
            </div>
            <br>
            <h2 align="center">My Placements</h2>
            <br>
            <table align="center" border="1" class="table text-start align-middle table-bordered table-hover mb-0">
                <tr>
                    <td>SI NO</td>
                    <td>Industry Name</td>
                    <td>Confirmation File</td>
                     
                    <td>Action</td>
                </tr>
                <%

                    String select1 = "select * from tbl_placement p inner join tbl_student s on s.student_id=p.student_id where p.student_id='"+session.getAttribute("Studentid")+"'";
                    ResultSet rsz = con.selectCommand(select1);
                    int m = 0;
                    while (rsz.next()) {
                        m++;

                %>

                <tr>
                    <td><%=m%></td>
                    <td><%=rsz.getString("placement_company")%></td>
                    <td><a href="../Assets/Files/placement/<%=rsz.getString("placement_proof")%>" download>Download</a>/<a href="../Assets/Files/placement/<%=rsz.getString("placement_proof")%>" target="_blank">View</a></td>
                 
                    <td><a href="Placement.jsp?did=<%=rsz.getString("placement_id")%>">Delete</a>/
                        <a href="Placement.jsp?eid=<%=rsz.getString("placement_id")%>">Edit</a>

                    </td>
                </tr>

                <%

                    }


                %>
            </table>
        </form>
            <%@include file="footer.jsp" %>
    </body>
</html>

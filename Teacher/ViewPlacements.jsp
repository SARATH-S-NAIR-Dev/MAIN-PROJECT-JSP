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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
 <div id="tab" align="center">
    
        <form method="post">
            <table>
                <tr>
                    <td colspan="5" align="center"> <h1 align="center">All Placements!</h1></td>
                </tr>
                
                <tr>
                    <td>SI NO</td>
                    <td>Student Name</td>
                    <td>Industry Title</td>
                    <td>Proof</td>
                    
                    
                    
                </tr>
                <%
                    String selec ="select * from tbl_placement p inner join tbl_student s on p.student_id= s.student_id ";
                    //out.println(selec);
                    ResultSet rs1 = con.selectCommand(selec);
                    int o = 0;
                    while (rs1.next()) {
                        o++;
                   
                        
                %>



                <tr> 
                    <td> <%=o%></td>
                    <td> <%=rs1.getString("student_name")%></td>
                    <td> <%=rs1.getString("placement_company")%></td>
                    <td> <%=rs1.getString("placement_proof")%></td>
                   
                  
                </tr>

                <%
                    
                    }%>


            </table>
        </form>
 </div>
        
                    <%@include file="footer.jsp" %>
    </body>
</html>

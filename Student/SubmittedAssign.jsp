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
                    <td colspan="5" align="center"> <h1 align="center">Assignment Results</h1></td>
                </tr>
                
                <tr>
                    <td>SI NO</td>
                    <td>Teacher Name</td>
                    <td>Title</td>
                    <td>Last Date</td>
                    <td>Marks</td>
                    
                    
                </tr>
                <%
                    String selec =" select * from tbl_assignment a inner join tbl_assignnoti n on a.notification_id=n.noti_id inner join tbl_subject s on s.subject_id=n.subject_id where student_id='"+session.getAttribute("Studentid")+"'";
                    out.println(selec);
                    ResultSet rs1 = con.selectCommand(selec);
                    int m = 0;
                    while (rs1.next()) {
                        m++;
                    String se="select * from tbl_assign a inner join tbl_teacher t on t.teacher_id=a.teacher_id where subject_id='"+rs1.getString("subject_id")+"' ";
                    ResultSet ts=con.selectCommand(se);
                    out.println(se);
                    if (ts.next()){
                        
                %>



                <tr> 
                    <td> <%=m%></td>
                    <td> <%=ts.getString("teacher_name")%></td>
                    <td> <%=rs1.getString("noti_title")%></td>
                    <td> <%=rs1.getString("noti_subdate")%></td>
                    <td> <%=rs1.getString("assignment_mark")%></td>
                  
                </tr>

                <%
                    }
                    }%>


            </table>
        </form>
 </div>
        
                    <%@include file="footer.jsp" %>
    </body>
</html>

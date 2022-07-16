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
                    String selec =" select * from tbl_notification where notification_id='"+request.getParameter("id")+"'";
                    ResultSet rs1 = con.selectCommand(selec);
                    int m = 0;
                    while (rs1.next()) {
                        m++;
              
                %>



                <tr> 
                    <td> <%=m%></td>
                    <td> <%=rs1.getString("notification_title")%></td>
                    <td> <%=rs1.getString("notification_content")%></td>
                    
                  
                </tr>

                <%
                    
                    }%>


            </table>
        </form>
 </div>
        
                    <%@include file="footer.jsp" %>
    </body>
</html>

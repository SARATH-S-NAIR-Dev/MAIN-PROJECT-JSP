<%-- 
    Document   : TeachChat
    Created on : 23 Feb, 2022, 3:10:37 PM
    Author     : my pc
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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
            String ccontent="",did="",ctime="",cdate="",cteacher="";
        
            if(request.getParameter("btnsave")!=null){
                
               
                
                String insert="insert into tbl_chat(chat_date,chat_time,chat_content,teacher_id)values(curdate(),curtime(),'"+request.getParameter("chat")+"','"+session.getAttribute("Teacherid")+"')";
                con.executeCommand(insert);
                out.println(insert);
               
                
                %>
                <script>
                    alert('Inserted');
                </script>
        
        <%
              //  out.println(insert);
                 }
                
          
        %>
        
        
        <h1 align="center">Ask!</h1>
        <form method="post">
        <table align="center" border="1">
            <input type="hidden" name="txthidden" value="<%=did%>">
            <tr>
                
                <td>Question..?</td>
                <td>
                    <textarea type="text" name="chat" required="" value="<%=ccontent%>"></textarea>
                    
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
                    <td>Teacher Name</td>
                </tr>
                <%
                
                String select ="select * from tbl_chat c inner join tbl_teacher t on c.teacher_id=t.teacher_id";
                ResultSet rs=con.selectCommand(select);
                int i=0;
                while(rs.next()){
                    i++;
                
                %>
                
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("chat_content")%></td>
                    <td><%=rs.getString("teacher_name")%></td>
                   
                   
                </tr>
               
                <%
                
                
                }
                
                
                %>
            </table>
        </form>
                
    </body>
</html>

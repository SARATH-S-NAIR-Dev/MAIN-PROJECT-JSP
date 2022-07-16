<%-- 
    Document   : Login
    Created on : 28 Feb, 2022, 12:11:28 PM
    Author     : my pc
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        if(request.getParameter("LOGIN")!=null){
            
            String sel="select * from tbl_admin where admin_email='"+request.getParameter("email")+"' and admin_password='"+request.getParameter("password")+"' ";
                  ResultSet res=con.selectCommand(sel);
                  
                  String sele="select * from tbl_teacher where teacher_email='"+request.getParameter("email")+"' and teacher_password='"+request.getParameter("password")+"' ";
                  ResultSet rs=con.selectCommand(sele);
                  
                  String selec="select * from tbl_student where student_email='"+request.getParameter("email")+"' and student_password='"+request.getParameter("password")+"' ";
                  ResultSet rsss=con.selectCommand(selec);
                  
                  
            
            if(rs.next()){
                 session.setAttribute("Type", "teacher");
                session.setAttribute("Teacherid", rs.getString("teacher_id"));
                session.setAttribute("Tname", rs.getString("teacher_name"));
                response.sendRedirect("../Teacher/TeacherHome.jsp");
                
            }
            else if(res.next()){
                
                session.setAttribute("Adminid", res.getString("admin_id"));
                session.setAttribute("Aname", res.getString("admin_name"));
                response.sendRedirect("../Admin/AdminHome.jsp");
            
            }
            else if(rsss.next()){
                session.setAttribute("Type", "student");
                session.setAttribute("StudentYear", rsss.getString("student_year"));
                session.setAttribute("Studentid", rsss.getString("student_id"));
                session.setAttribute("Sname", rsss.getString("student_name"));
                response.sendRedirect("../Student/StudentHome.jsp");
            
            }
            
            
               
            else{
                %>
                <script>
                    
                    alert('invalid credentials 🤨');
                </script>
        
        <%
            }
         
        }
        
        
        %>
        
        <form method="post">
            <div class="container">

                <h1 align="center" style="color:blueviolet" style="font-size: 20px" >LOGIN</h1>

                <table align="center" border="1" cellpadding="20" style="border-collapse: collapse">
                    <tr>
                        <td style="color: #201e88"><label>Email ID</label></td>
                        <td><input type="text" placeholder="Your Email"   name="email" required=""></td>
                    </tr>
                    <tr>
                        <td style="color: #201e88"><label>Password</label></td>
                        <td style="color: #201e88"><input type="password" placeholder="Enter Password"  name="password" required=""></td>
                    </tr>
                      <tr>
                        <td colspan="2" align="center">
                            <input type="submit" style="color: blueviolet"   placeholder="Email ID"  name="LOGIN" value="LOGIN">
                            <input type="reset" name="Cancel" value="Cancel">
                        </td>
                    </tr>
               
                </table>
            </div>
            
        </form>
          </body>
</html>

<%-- 
    Document   : teacherView
    Created on : 9 Mar, 2022, 11:58:26 AM
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
         if (request.getParameter("Aid") != null) {

                String change = "update tbl_teacher set teacher_status='1' where teacher_id='"+request.getParameter("Aid")+"'";
                con.executeCommand(change);
                response.sendRedirect("TeacherView.jsp");

            }
         if (request.getParameter("Did") != null) {

                String changes = "update tbl_teacher set teacher_status='2' where teacher_id='"+request.getParameter("Did")+"'";
                con.executeCommand(changes);
                response.sendRedirect("TeacherView.jsp");

            }
        
        
        
        %>
        
        
        
        <h1 align="center">Registered Teachers!</h1>
        <h1 align="center">Pending</h1>
         <table align="center" border="1" class="table text-start align-middle table-bordered table-hover mb-0">
                <tr>
                    <td>SI NO</td>
                    <td>Teacher Name</td>
                    <td>Teacher Email</td>
                    <td>Teacher Photo</td>
                    <td>Teacher DOJ</td>
                    <td>Teacher Status</td>
                    <td>Action</td>
                </tr>
                <%

                    String select = "select * from tbl_teacher where teacher_status='0'";
                    ResultSet rs = con.selectCommand(select);
                    int i = 0;
                    while (rs.next()) {
                        i++;

                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("teacher_name")%></td>
                    <td><%=rs.getString("teacher_email")%></td>
                    <td> <img src="../Assets/Files/Teacher/TeacherPhoto/<%=rs.getString("teacher_photo")%>" width="120" height="120"></td>
                    <td><%=rs.getString("teacher_doj")%></td>
                    <td>Pending</td>
                    <td>
                        <a href="TeacherView.jsp?Aid=<%=rs.getString("teacher_id")%>">Activate</a>
                        

                    </td>
                </tr>

                <%

                    }


                %>
            </table>
            <br>
            <br>
            
            
            
            <%
            String select1="select * from tbl_teacher where teacher_status='1'";
            ResultSet rest=con.selectCommand(select1);
            if(rest.next()){
            
            %>
            <h1 align="center">Active</h1>
            <table align="center" border="1" class="table text-start align-middle table-bordered table-hover mb-0">
                <tr>
                   <td>SI NO</td>
                    <td>Teacher Name</td>
                    <td>Teacher Email</td>
                    <td>Teacher Photo</td>
                    <td>Teacher DOJ</td>
                    <td>Teacher Status</td>
                    <td>Action</td>
                </tr>
                <%

                    String selec = "select * from tbl_teacher where teacher_status='1'";
                    ResultSet res = con.selectCommand(selec);
                    int j = 0;
                    while (res.next()) {
                        j++;

                %>

                <tr>
                    <td><%=j%></td>
                    <td><%=res.getString("teacher_name")%></td>
                    <td><%=res.getString("teacher_email")%></td>
                    <td> <img src="../Assets/Files/Teacher/TeacherPhoto/<%=res.getString("teacher_photo")%>" width="120" height="120"></td>
                    <td><%=res.getString("teacher_doj")%></td>
                    <td>Active</td>
                    <td>
                        <a href="TeacherView.jsp?Did=<%=res.getString("teacher_id")%>">Deactivate</a>
                        

                    </td>
                </tr>

                <%

                    }


                %>
               
            </table>
                <%
                
            }
                %>
                
                
                
                 <br>
                
             <%
            String select2="select * from tbl_teacher where teacher_status='2'";
            ResultSet rest1=con.selectCommand(select2);
            if(rest1.next()){
            
            %>    
            <h1 align="center">Deactivated</h1>
             <table align="center" border="1" class="table text-start align-middle table-bordered table-hover mb-0">
                <tr>
                    <td>SI NO</td>
                    <td>Teacher Name</td>
                    <td>Teacher Email</td>
                    <td>Teacher Photo</td>
                    <td>Teacher DOJ</td>
                    <td>Teacher Status</td>
                    <td>Action</td>
                </tr>
                <%

                    String sele = "select * from tbl_teacher where teacher_status='2'";
                    ResultSet ress = con.selectCommand(sele);
                    int k = 0;
                    while (ress.next()) {
                        k++;

                %>

                <tr>
                    <td><%=k%></td>
                    <td><%=ress.getString("teacher_name")%></td>
                    <td><%=ress.getString("teacher_email")%></td>
                    <td> <img src="../Assets/Files/Teacher/TeacherPhoto/<%=ress.getString("teacher_photo")%>" width="120" height="120"></td>
                    <td><%=ress.getString("teacher_doj")%></td>
                    <td>Inactive</td>
                    <td>
                        <a href="TeacherView.jsp?Aid=<%=ress.getString("teacher_id")%>">Activate</a>
                        

                    </td>
                </tr>

                <%

                    }


                %>
            </table>
              <%
                
            }
                %>
                 <%@include file="Footer.jsp" %>
    </body>
</html>

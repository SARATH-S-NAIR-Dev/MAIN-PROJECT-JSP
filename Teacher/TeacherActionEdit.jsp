<%-- 
    Document   : AdminProfile
    Created on : 28 Feb, 2022, 12:43:06 PM
    Author     : my pc
--%>
<%@page import="java.sql.ResultSet" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
         <%@include file="header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        
      
        <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/TeacherUpdAction.jsp">
            <h1 align="center"  >Edit Your Profile</h1>
            <table align="center"colspan="3" >
                





                <%
                    String select = "select * from tbl_teacher where teacher_id='" + session.getAttribute("Teacherid") + "'";
                    ResultSet rs = con.selectCommand(select);

                    if (rs.next()) {


                %>
                <tr>
                    <td colspan="2" align="center">
                        <a href="#" onclick=""> 
                        <img src="../Assets/Files/Teacher/TeacherPhoto/<%=rs.getString("teacher_photo")%>" name="photo" id="profile-image" height="120" width="120" align="center" />
                        <input d="profile-image-upload" type="file" name="photo" style="display: none">
                        </a>
                    </td>
                </tr>
                <tr>
                    <td><div class="col-md-12 mb-3">
                            <div class="form-group">
                        <label>Name</label> 

                        <input type="text" name="text_name" value="<%=rs.getString("teacher_name")%>">
                            </div>
                    </td>
                </tr>
                <tr>
                    <td><div class="col-md-12 mb-3">
                            <div class="form-group">
                     <label>Contact</label>
                     <input type="text" name="text_contact" value="<%=rs.getString("teacher_contact")%>">
                            </div></td>
                </tr>
                <tr>
                    <td><div class="col-md-12 mb-3">
                            <div class="form-group">
                     <label>Email</label>
                     <input type="text" name="text_email" value="<%=rs.getString("teacher_email")%>"></div>  </td>
                </tr>
                <tr>
                    <td><div class="col-md-12 mb-3">
                            <div class="form-group">
                     <label>Address</label>
                     <input type="text" name="text_address" value="<%=rs.getString("teacher_address")%>"> </div>   </td>
                </tr>



                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit"   class="button button-a button-big button-rouded"  name="update" value="UPDATE">
                        <input type="reset" class="button button-a button-big button-rouded" name="Cancel" value="Cancel">
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

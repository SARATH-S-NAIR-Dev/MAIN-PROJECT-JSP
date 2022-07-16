<%-- 
    Document   : AdminProfile
    Created on : 28 Feb, 2022, 12:43:06 PM
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




        <form method="post" class="contactForm" enctype="multipart/form-data" action="../Assets/Actionpages/StudentUpdAction.jsp">

            <h2 align="center"  style="font-size: 40px; color:#0078ff">Edit Your Profile</h2>
            <table align="center"colspan="3" >


                <br>
                <br>



                <%                    String select1 = "select * from tbl_student where student_id='" + session.getAttribute("Studentid") + "'";
                    ResultSet rs2 = con.selectCommand(select1);

                    if (rs2.next()) {


                %>


                <tr>
                    <td colspan="2" align="center">
                        <a href="#" onclick=""> 

                            <img src="../Assets/Files/StudentPhoto/<%=rs2.getString("student_photo")%>" name="profile-image" id="profile-image" height="120" width="120" align="center" />

                            <input id="profile-image-upload" type="file" name="photo" onchange="readURL(this)" style="display: none">

                        </a>
                    </td>
                </tr>





                <tr>
                    <td>  <div class="col-md-12 mb-3">
                            <div class="form-group">
                                <label >Name</label> 

                                <input type="text" name="text_name" class="form-control" value="<%=rs2.getString("student_name")%>">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><div class="col-md-12 mb-3">
                            <div class="form-group">
                                <label>Contact</label>
                                <input type="text" name="text_contact" class="form-control" value="<%=rs2.getString("student_contact")%>">
                            </div></div>
                    </td>
                </tr>
                <tr>
                    <td><div class="col-md-12 mb-3">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="text" name="text_email" class="form-control" value="<%=rs2.getString("student_email")%>"></div></div>  </td>
                </tr>
                <tr>
                    <td><div class="col-md-12 mb-3">
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" name="text_address" class="form-control" value="<%=rs2.getString("student_address")%>"> 
                            </div></div></td>
                </tr>



                </tr>
               






                <%

                    }


                %>

 <tr>
                    <td colspan="2" align="center">
                        <input type="submit"  name="update" value="UPDATE">
                        <input type="reset" class="button button-a button-big button-rouded" name="Cancel" value="Cancel">
                    </td>
                </tr>

            </table>

        </form>
        <%@include file="footer.jsp" %>
    </body>

</html>
<script src="../Assets/JQ/jQuery.js"></script>
<script>


                                $('#profile-image').on('click', function(callback) {
                                    $('#profile-image-upload').click();
                                    readURL(document.getElementById("profile-image-upload"));
                                });
                                function readURL(input) {

                                    if (input.files && input.files[0]) {

                                        var reader = new FileReader();
                                        reader.onload = function(e) {
                                            document.querySelector("#profile-image").setAttribute("src", e.target.result);
                                        };

                                        reader.readAsDataURL(input.files[0]);
                                    }
                                }


</script>
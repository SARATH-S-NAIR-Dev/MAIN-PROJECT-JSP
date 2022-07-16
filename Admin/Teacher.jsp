<%-- 
    Document   : page
    Created on : 27 Feb, 2022, 11:48:49 PM
    Author     : my pc
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="pagecss.css"/>
    </head>





    <body>




        <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/TeacherInsAction.jsp">
            <div class="container">

                <h1 align="center" style="color:blueviolet" >Teacher</h1>

                <table align="center" border="1" cellpadding="10" style="border-collapse: collapse">
                    <tr>
                        <td style="color: #201e88"><label>Name</label></td>
                        <td><input type="text" placeholder="Your Name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"   name="Name" required=""></td>
                    </tr>
                    <tr>
                        <td style="color: #201e88"><label>Contact</label></td>
                        <td style="color: #201e88"><input type="text" placeholder="Contact No" pattern="[7-9]{1}[0-9]{9}" 
                title="Phone number with 7-9 and remaing 9 digit with 0-9" name="Contact" required=""></td>
                    </tr>
                    <tr>
                        <td style="color: #201e88"><label>Email</label></td>
                        <td><input type="email"   placeholder="Email ID"  name="email"required="" value="">
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="color: #201e88"><label>Address</label></td>
                        <td><input type="txtarea" name="address"  data-rule="required" data-msg="Please write something for us" placeholder="Your Address" required=""  >

                        </td>
                    </tr>
                    <tr>
                        <td style="color: #201e88"><label>Place</label></td>
                        <td>
                            <div class="custom-select" style="width:200px;">
                                <select name="slctplace" class="select"   placeholder="District Name"  onchange="getPlace(this.value)">
                                    <option>--select--</option>
                                    <%
                                        String sel = "select * from tbl_place";
                                        ResultSet rs = con.selectCommand(sel);
                                        while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("place_id")%>"><%=rs.getString("place_name")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="color: #201e88"><label>Gender</label> </td>
                        <td>
                    <input type="radio"  name="Male" required="" value="male">Male
                    <input type="radio"  name="Male" required="" value="female">Female
                        </td>
                        
                    </tr>
                    <tr>
                        <td style="color: #201e88"><label>Photo</label></td>
                        <td><input type="file" name="photo"required=""    value=""></td>
                    </tr>
                    <tr>
                        <td style="color: #201e88"><label>Proof</label></td>
                        <td><input type="file" name="proof"required="" value=""></td>
                    </tr>
                    <tr>
                        <td style="color: #201e88"><label>Password</label></td>
                        <td><input type="password" placeholder="Enter Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" name="password"required="" value=""></td>
                    </tr>
                    <tr style="color: #201e88">
                        <td><label>Confirm Password</label></td>
                        <td style="color: #201e88"><input type="password" placeholder="Re Enter Password" name="cpassword"required="" value=""></td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit"   class="btn btn-primary ms-2" name="Submit" value="Submit">
                            <input type="submit" name="Cancel"  class="btn btn-primary ms-2" value="Cancel">
                        </td>
                    </tr>
                    
                    
                    
                    
                </table>
        </form>
                                 
    </div>
</body>

</html>
<script src="../Assets/JQ/jQuery.js"></script>


<script>
                                    function getPlace(did)
                                    {

                                        $.ajax({
                                            url: "../Assets/AjaxPages/Ajaxplace.jsp?did=" + did,
                                            success: function(html) {
                                                $("#place").html(html);
                                            }
                                        });
                                    }
</script>
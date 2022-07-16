<%-- 
    Document   : page
    Created on : 27 Feb, 2022, 11:48:49 PM
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
        <link rel="stylesheet" href="pagecss.css"/>
    </head>





    <body>
<%









%>



        <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/StudentInsAction.jsp">
            <div class="container">

                <h1 align="center" style="color:#0078ff" >Students</h1>

                <table align="center" cellpadding="10" style="border-collapse: collapse">
                    <tr>
                        <td style="color: #201e88"><label>Name</label></td>
                        <td><input type="text" placeholder="Your Name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"   name="Name" required=""></td>
                    </tr>
                    <tr>
                        <td style="color: #201e88"><label>Contact</label></td>
                        <td style="color: #201e88"><input type="text" placeholder="Contact No" pattern="[7-9]{1}[0-9]{9}" 
                title="Phone number with 7-9 and remaing 9 digit with 0-9"  name="Contact" required=""></td>
                    </tr>
                    <tr>
                        <td style="color: #201e88"><label>Email</label></td>
                        <td><input type="email"   placeholder="Email ID"  name="email"required="" value="">
                        </td>
                    </tr>
                    <tr>
                        <td style="color: #201e88"><label>Address</label></td>
                        <td>
                             <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Enter Address"></textarea>

                        </td>
                    </tr>
                     <tr>
                        <td style="color: #201e88"><label>District</label></td>
                        <td>
                            <div style="width:200px;">
                                <select name="slctcourse" required=""   onchange="getPlace(this.value)">
                                    <option value="">--select--</option>
                                    <%
                                        String sele = "select * from tbl_district";
                                        ResultSet res = con.selectCommand(sele);
                                        while (res.next()) {
                                    %>
                                    <option value="<%=res.getString("district_id")%>"><%=res.getString("district_name")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="color: #201e88"><label>Place</label></td>
                        <td>
                            <div  style="width:200px;">
                                <select name="slctplace" required="" id="place">
                                    <option value="">--select--</option>
                                  
                                </select>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="color: #201e88"><label>Gender</label> </td>
                        <td>
                    <input type="radio" re  name="Male" required="" value="male">Male
                    <input type="radio"  name="Male"  value="female">Female
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
                        <td style="color: #201e88"><label>Year</label></td>
                        <td><input type="text" name="year" placeholder="Current Year" required=""  >

                        </td>
                    </tr>
                     <tr>
                        <td style="color: #201e88"><label>Register NO</label></td>
                        <td><input type="text" name="regno" placeholder="Your Register No" required=""  >

                        </td>
                    </tr>
                     <tr>
                        <td style="color: #201e88"><label>D.O.B</label></td>
                        <td><input type="text" name="dob" placeholder="Your Date Of Birth" required=""  >

                        </td>
                    </tr>
                     <tr>
                        <td style="color: #201e88"><label>Aadhar NO</label></td>
                        <td><input type="text" name="aadhar" placeholder="Your Aadhar NO" required=""  >

                        </td>
                    </tr>
                     <tr>
                        <td style="color: #201e88"><label>Blood Group</label></td>
                        <td><input type="text" name="blood" placeholder="Your Blood Group" required=""  >

                        </td>
                    </tr>
                     <tr>
                        <td style="color: #201e88"><label>Admission NO</label></td>
                        <td><input type="text" name="admno" placeholder="Your Admission NO" required=""  >

                        </td>
                    </tr>
                     <tr>
                        <td style="color: #201e88"><label>Religion</label></td>
                        <td><input type="text" name="religion" placeholder="Your Religion" required=""  >

                        </td>
                    </tr>
                     <tr>
                        <td style="color: #201e88"><label>Category</label></td>
                        <td><input type="text" name="category" placeholder="Your Category" required=""  >

                        </td>
                    </tr>
                     <tr>
                        <td style="color: #201e88"><label>Guardian Phone</label></td>
                        <td><input type="text" name="gurdno" placeholder="Guardian Number" required=""  >

                        </td>
                    </tr>
                    <tr>
                        <td style="color: #201e88"><label>Roll NO</label></td>
                        <td><input type="text" placeholder="Your Roll NO"   name="roll" required=""></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" placeholder="Email ID"  name="Submit" value="Submit">
                            <input type="submit" name="Cancel" value="Cancel">
                        </td>
                    </tr>
                    
                    
                    
                    
                </table>
        </form>
    </div>
                                 <%@include file="footer.jsp" %>
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
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">

        <head>
            <!-- Required meta tags-->
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="Colorlib Templates">
            <meta name="author" content="Colorlib">
            <meta name="keywords" content="Colorlib Templates">

            <!-- Title Page-->
            <title>Teacher Reg</title>

            <!-- Icons font CSS-->
            <link href="../Assets/Template/Registration/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
            <link href="../Assets/Template/Registration/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
            <!-- Font special for pages-->
            <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

            <!-- Vendor CSS-->
            <link href="../Assets/Template/Registration/vendor/select2/select2.min.css" rel="stylesheet" media="all">
            <link href="../Assets/Template/Registration/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

            <!-- Main CSS-->
            <link href="../Assets/Template/Registration/css/main.css" rel="stylesheet" media="all">
        </head>

        <body>
            <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/TeacherInsAction.jsp">
                <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins" style="background:#ffffff;
                     background-image: linear-gradient(315deg, #ffffff 0%, #d7e1ec 74%);;background: #8360c3;  /* fallback for old browsers */
                     background: -webkit-linear-gradient(to right, #2ebf91, #8360c3);  /* Chrome 10-25, Safari 5.1-6 */
                     background: linear-gradient(to right, #2ebf91, #8360c3); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                     /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                     ">
                    <div class="wrapper wrapper--w680">
                        <div class="card card-4">
                            <div class="card-body" style=" ">
                                <h2 class="title">Register New Teachers</h2>
                                <form method="POST">

                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">first name</label>
                                            <input class="input--style-4" type="text" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"   placeholder="Your Name" name="name">
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Contact</label>
                                            <input class="input--style-4" type="text"  pattern="[7-9]{1}[0-9]{9}" 
                                                   title="Phone number with 7-9 and remaing 9 digit with 0-9" placeholder="Contact No" required="" name="contact">
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Email</label>
                                            <input class="input--style-4" type="text" required="" placeholder="Email ID" name="email">
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Address</label>
                                            <input class="input--style-4" type="text" required=""  data-rule="required" data-msg="Please write something for us" placeholder="Your Address" name="address">
                                        </div>
                                    </div>

                                    <div class="input-group">
                                        <label class="label">Place</label>
                                        <div class="rs-select2 js-select-simple select--no-search">
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
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>


                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Gender</label>
                                        <div class="p-t-10">
                                            <label class="radio-container m-r-45">Male
                                                <input type="radio" required=""   name="gender">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio-container">Female
                                                <input type="radio" required=""  name="gender">
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Photo</label>
                                            <input class="input--style-4" type="file" required=""  name="photo">
                                        </div>
                                    </div>

                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Proof</label>
                                            <input class="input--style-4" type="file" required=""  name="proof">
                                        </div>
                                    </div>

                                </div>

                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Password</label>
                                            <input class="input--style-4" type="password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  required=""  placeholder="Enter Password" name="password">
                                        </div>
                                    </div>

                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Re Enter Password</label>
                                            <input class="input--style-4" type="password" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"  placeholder="Re Enter Password" name="cpassword">
                                        </div>
                                    </div>
                                    <tr>
                                        <td style="color: #201e88"><label class="label">Qualification</label></td>
                                        <td><input type="text" class="input--style-4"  placeholder="Your Qualification"   name="qualification" required=""></td>
                                    </tr>

                                </div>
                                <div class="p-t-15">
                                    <div class="input-group">
                                    <button class="btn btn--radius-2 btn--blue" type="submit">Submit</button>
                                    </div>
                                </div>
                           
                        </div>
                    </div>
                </div>
            </div>
 </form>
            <!-- Jquery JS-->
            <script src="../Assets/Template/Registration/vendor/jquery/jquery.min.js"></script>
            <!-- Vendor JS-->
            <script src="../Assets/Template/Registration/vendor/select2/select2.min.js"></script>
            <script src="../Assets/Template/Registration/vendor/datepicker/moment.min.js"></script>
            <script src="../Assets/Template/Registration/vendor/datepicker/daterangepicker.js"></script>

            <!-- Main JS-->
            <script src="../Assets/Template/Registration/js/global.js"></script>

        </form>

    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->

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
<!-- end document-->

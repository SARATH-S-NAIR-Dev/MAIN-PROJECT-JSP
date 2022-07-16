<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">
        <head>
        <%String teach = session.getAttribute("Tname").toString();
        %>
        <meta charset="utf-8">
        <title style="color: #0078ff" >MCA DEPARTMENT WEBSITE</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <link rel="stylesheet" href="Noti.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <!-- Favicons -->
        <link href="../Assets/Template/Temp/img/favicon.png" rel="icon">
        <link href="../Assets/Template/Temp/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Bootstrap CSS File -->
        <link href="../Assets/Template/Temp/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Libraries CSS Files -->
        <link href="../Assets/Template/Temp/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="../Assets/Template/Temp/lib/animate/animate.min.css" rel="stylesheet">
        <link href="../Assets/Template/Temp/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="../Assets/Template/Temp/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../Assets/Template/Temp/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="../Assets/Template/Admin/js/favicon.ico" rel="icon">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">


        <!-- Libraries Stylesheet -->
        <link href="../Assets/Template/Admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="../Assets/Template/Admin/lib/tempusdominus/../Assets/Template/Admin/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="../Assets/Template/Admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="../Assets/Template/Admin/css/style.css" rel="stylesheet">
        <link href="../Assets/form.css" rel="stylesheet">

        <!-- Main Stylesheet File -->
        <link href="../Assets/Template/Temp/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="Noti.css">
        <!-- =======================================================
          Theme Name: DevFolio
          Theme URL: https://bootstrapmade.com/devfolio-bootstrap-portfolio-html-template/
          Author: BootstrapMade.com
          License: https://bootstrapmade.com/license/
        ======================================================= -->
        <style>

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {background-color: #ddd;}

            .dropdown:hover .dropdown-content {display: block;}

        </style>
    </head>

    <body id="page-top">

        <!--/ Nav Star /-->
        <nav class="navbar navbar-b navbar-trans navbar-expand-md fixed-top"  id="mainNav" >
            <div class="container">
                <a class="navbar-brand js-scroll"style="color: #0078ff" href="../Assets/Template/Temp/#page-top" >MCA </a>
                <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
                        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
                <div class="navbar-collapse collapse justify-content-end" id="navbarDefault">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link js-scroll active" style="color: #0078ff"  href="TeacherHome.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll" style="color: #0078ff" href="TeacherProfile.jsp">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll" style="color: #0078ff" href="TeacherActionEdit.jsp">Edit Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll" style="color: #0078ff" href="TeacherChangePassword.jsp">Change Password</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll" style="color: #0078ff" href="TimeTableTeach.jsp">Timetable</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll" style="color: #0078ff" href="#contact">Contact</a>
                        </li>
                        <li>
                            <div class="navbar-nav align-items-center ms-auto">
                                <div class="nav-item dropdown">
                                    <a href="#" style="color: #0078ff" class="nav-link dropdown-toggle dropbtn" data-bs-toggle="dropdown">
                                        <i class="fa fa-bell me-lg-2"></i>
                                        <span class="d-none d-lg-inline-flex">Notification</span>
                                    </a>
                                    <div class="dropdown-menu dropdown-content dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">

                                        <%
                                            String select9 = "select * from tbl_notification";
                                            ResultSet rs10 = con.selectCommand(select9);
                                            int m = 0;
                                            while (rs10.next()) {
                                                if (rs10.getString("notification_type").equals(session.getAttribute("Type"))) {
                                        %>
                                        <a href="#" class="dropdown-item">
                                            <h6 class="fw-normal mb-0"><%  out.println(rs10.getString("notification_title"));%></h6>
                                            <!--                                        <small>15 minutes ago</small>-->
                                        </a>
                                        <hr class="dropdown-divider">
                                        <%
                                            }

                                            if (rs10.getString("notification_type").equals("both")) {
                                        %>
                                        <a href="#" class="dropdown-item">
                                            <h6 class="fw-normal mb-0"><%  out.println(rs10.getString("notification_title"));%></h6>
                                            <!--                                        <small>15 minutes ago</small>-->
                                        </a>
                                        <hr class="dropdown-divider">
                                        <%
                                                }

                                            }


                                        %>

                                        <a href="#" class="dropdown-item text-center">See all notifications</a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll" style="color: #0078ff" href="../logout.jsp">Logout</a>
                        </li>


                    </ul>
                </div>
            </div>
        </nav>
        <!--/ Nav End /-->


        <!--/ Intro Skew End /-->
        <!--/ Intro Skew Star /-->
        <br>
        <br> 
        <br>
        <br>
        <br> 

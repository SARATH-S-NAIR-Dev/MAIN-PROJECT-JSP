    <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
    <head>        

        <%String Stud = session.getAttribute("Tname").toString();
        %>
        <meta charset="utf-8">
        <title>MCA DEPARTMENT WEBSITE</title>
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
    </style>
</head>

<body id="page-top">

    <!--/ Nav Star /-->
    <nav class="navbar navbar-b navbar-trans navbar-expand-md fixed-top"  id="mainNav" >
        <div class="container">
            <a class="navbar-brand js-scroll" href="../Assets/Template/Temp/#page-top" >MCA </a>
            <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
                    aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span></span>
                <span></span>
                <span></span>
            </button>
            <div class="navbar-collapse collapse justify-content-end" id="navbarDefault">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link js-scroll active"  href="TeacherHome.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll"  href="TeacherProfile.jsp">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll"  href="TeacherActionEdit.jsp">Edit Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll"  href="TeacherChangePassword.jsp">Change Password</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll"  href="../Student/TableView.jsp">Timetable</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll"  href="#contact">Contact</a>
                    </li>
                    <li>
                        <div class="navbar-nav align-items-center ms-auto">
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle dropbtn" data-bs-toggle="dropdown">
                                    <i class="fa fa-bell me-lg-2"></i>
                                    <span class="d-none d-lg-inline-flex">Notification</span>
                                </a>
                                <div class="dropdown-menu dropdown-content dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">

                                    <%
                                        String select = "select * from tbl_notification";
                                        ResultSet rs = con.selectCommand(select);
                                        int i = 0;
                                        while (rs.next()) {
                                            if (rs.getString("notification_type").equals(session.getAttribute("Type"))) {
                                    %>
                                    <a href="#" class="dropdown-item">
                                        <h6 class="fw-normal mb-0"><%  out.println(rs.getString("notification_title"));%></h6>
                                        <!--                                        <small>15 minutes ago</small>-->
                                    </a>
                                        <hr class="dropdown-divider">
                                    <%
                                        }

                                        if (rs.getString("notification_type").equals("both")) {
                                    %>
                                    <a href="#" class="dropdown-item">
                                        <h6 class="fw-normal mb-0"><%  out.println(rs.getString("notification_title"));%></h6>
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
                            <a class="nav-link js-scroll"  href="../logout.jsp">Logout</a>
                        </li>
                </ul>
            </div>
        </div>
    </nav>
    <!--/ Nav End /-->
    <!--/ Intro Skew Star /-->
    <div id="home" class="intro route bg-image" style="background-image: url(../Assets/Template/Temp/img/intro1.jpg)">
        <div class="overlay-itro"></div>
        <div class="intro-content display-table">
            <div class="table-cell">
                <div class="container">
                    <!--<p class="display-6 color-d">Hello, world!</p>-->
                    <h1 class="intro-title mb-4">Hi <%=Stud%></h1>
                    <p class="intro-subtitle"><span class="text-slider-items">Welcome To MCA Department Official Website</span><strong class="text-slider"></strong></p>
                    <!-- <p class="pt-3"><a class="btn btn-primary btn js-scroll px-4" href="../Assets/Template/Temp/#about" role="button">Learn More</a></p> -->
                </div>
            </div>
        </div>
    </div>

    <!--/ Intro Skew End /-->




    <!--/ Section Services Star /-->
    <section id="service" class="services-mf route">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="title-box text-center">
                        <br>
                        <br>
                        <h3 class="title-a">
                            Services
                        </h3>
                        <p class="subtitle-a">
                           Select Any Service
                        </p>
                        <div class="line-mf"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <a href="TeacherProfile.jsp"> <div class="service-box">
                            <div class="service-ico">
                                <span class="ico-circle"><i class="ion-monitor"></i></span>
                            </div>
                            <div class="service-content">
                                <h2 class="s-title">view Profile</h2>
                                <p class="s-description text-center">
                                    
                                </p>
                            </div>
                        </div></a>
                </div>
                <div class="col-md-4">
                    <a href="peer.jsp"><div class="service-box">
                            <div class="service-ico">
                                <span class="ico-circle"><i class="ion-code-working"></i></span>
                            </div>
                            <div class="service-content">
                                <h2 class="s-title">Ask?</h2>
                                <p class="s-description text-center">
                                    
                                </p>
                            </div>
                        </div></a>
                </div>
                <div class="col-md-4">
                    <a href="TeacherActionEdit.jsp"> <div class="service-box">
                            <div class="service-ico">
                                <span class="ico-circle"><i class="ion-camera"></i></span>
                            </div>
                            <div class="service-content">
                                <h2 class="s-title">Edit Profile</h2>
                                <p class="s-description text-center">
                                   
                                </p>
                            </div>
                        </div></a>
                </div>
                <div class="col-md-4">
                    <div class="service-box">
                        <a href="TeacherChangePassword.jsp"> <div class="service-ico">
                                <span class="ico-circle"><i class="ion-android-phone-portrait"></i></span>
                            </div>
                            <div class="service-content">
                                <h2 class="s-title">Change Password</h2>
                                <p class="s-description text-center">
                                    
                                </p>
                            </div></a>
                    </div>
                </div>
                <div class="col-md-4">
                    <a href="TimeTableTeach.jsp"><div class="service-box">
                            <div class="service-ico">
                                <span class="ico-circle"><i class="ion-paintbrush"></i></span>
                            </div>
                            <div class="service-content">
                                <h2 class="s-title">Timetable</h2>
                                <p class="s-description text-center">
                                    
                                </p>
                            </div>
                        </div></a>
                </div>
                <div class="col-md-4">
                    <a href="Student.jsp">  <div class="service-box">
                            <div class="service-ico">
                                <span class="ico-circle"><i class="ion-stats-bars"></i></span>
                            </div>
                            <div class="service-content">
                                <h2 class="s-title">Add Students</h2>  
                                <p class="s-description text-center">
                                    
                                </p>
                            </div>
                        </div></a>
                </div>
                
                 <div class="col-md-4">
                     <a href="SemMarkSelect.jsp"><div class="service-box">
                            <div class="service-ico">
                                <span class="ico-circle"><i class="ion-paintbrush"></i></span>
                            </div>
                            <div class="service-content">
                                <h2 class="s-title">Semester Results</h2>
                                <p class="s-description text-center">
                                    
                                </p>
                            </div>
                        </div></a>
                </div>
                  <div class="col-md-4">
                      <a href="AssignSemSelect.jsp"><div class="service-box">
                            <div class="service-ico">
                                <span class="ico-circle"><i class="ion-paintbrush"></i></span>
                            </div>
                            <div class="service-content">
                                <h2 class="s-title">Assignment</h2>
                                <p class="s-description text-center">
                                    
                                </p>
                            </div>
                        </div></a>
                </div>
                
                 <div class="col-md-4">
                     <a href="ViewPlacements.jsp"><div class="service-box">
                            <div class="service-ico">
                                <span class="ico-circle"><i class="ion-help"></i></span>
                            </div>
                            <div class="service-content">
                                <h2 class="s-title">View Placements</h2>
                                <p class="s-description text-center">
                                    
                                </p>
                            </div>
                        </div></a>
                </div>
            </div>
            
        </div>
    </section>
    <!--/ Section Services End /-->

    <div class="section-counter paralax-mf bg-image" style="background-image: url(../Assets/Template/Temp/img/counters-bg.jpg)">
        <div class="overlay-mf"></div>
        <div class="container">
            <div class="row">
                <div class="col-sm-3 col-lg-3">
                    <div class="counter-box">
                        <div class="counter-ico">
                            <span class="ico-circle"><i class="ion-checkmark-round"></i></span>
                        </div>
                        <div class="counter-num">
                            <p class="counter">450</p>
                            <span class="counter-text">WORKS COMPLETED</span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-lg-3">
                    <div class="counter-box pt-4 pt-md-0">
                        <div class="counter-ico">
                            <span class="ico-circle"><i class="ion-ios-calendar-outline"></i></span>
                        </div>
                        <div class="counter-num">
                            <p class="counter">15</p>
                            <span class="counter-text">YEARS OF EXPERIENCE</span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-lg-3">
                    <div class="counter-box pt-4 pt-md-0">
                        <div class="counter-ico">
                            <span class="ico-circle"><i class="ion-ios-people"></i></span>
                        </div>
                        <div class="counter-num">
                            <p class="counter">550</p>
                            <span class="counter-text">TOTAL CLIENTS</span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-lg-3">
                    <div class="counter-box pt-4 pt-md-0">
                        <div class="counter-ico">
                            <span class="ico-circle"><i class="ion-ribbon-a"></i></span>
                        </div>
                        <div class="counter-num">
                            <p class="counter">36</p>
                            <span class="counter-text">AWARD WON</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--/ Section Portfolio Star /-->
    <section id="work" class="portfolio-mf sect-pt4 route">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="title-box text-center">
                        <h3 class="title-a">
                            Portfolio
                        </h3>
                        <p class="subtitle-a">
                            Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                        </p>
                        <div class="line-mf"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="work-box">
                        <a href="../Assets/Template/Temp/img/work-1.jpg" data-lightbox="gallery-mf">
                            <div class="work-img">
                                <img src="../Assets/Template/Temp/img/work-1.jpg" alt="" class="img-fluid">
                            </div>
                            <div class="work-content">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <h2 class="w-title">Lorem impsum dolor</h2>
                                        <div class="w-more">
                                            <span class="w-ctegory">Web Design</span> / <span class="w-date">18 Sep. 2018</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="w-like">
                                            <span class="ion-ios-plus-outline"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="work-box">
                        <a href="../Assets/Template/Temp/img/work-2.jpg" data-lightbox="gallery-mf">
                            <div class="work-img">
                                <img src="../Assets/Template/Temp/img/work-2.jpg" alt="" class="img-fluid">
                            </div>
                            <div class="work-content">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <h2 class="w-title">Loreda Cuno Nere</h2>
                                        <div class="w-more">
                                            <span class="w-ctegory">Web Design</span> / <span class="w-date">18 Sep. 2018</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="w-like">
                                            <span class="ion-ios-plus-outline"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="work-box">
                        <a href="../Assets/Template/Temp/img/work-3.jpg" data-lightbox="gallery-mf">
                            <div class="work-img">
                                <img src="../Assets/Template/Temp/img/work-3.jpg" alt="" class="img-fluid">
                            </div>
                            <div class="work-content">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <h2 class="w-title">Mavrito Lana Dere</h2>
                                        <div class="w-more">
                                            <span class="w-ctegory">Web Design</span> / <span class="w-date">18 Sep. 2018</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="w-like">
                                            <span class="ion-ios-plus-outline"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="work-box">
                        <a href="../Assets/Template/Temp/img/work-4.jpg" data-lightbox="gallery-mf">
                            <div class="work-img">
                                <img src="../Assets/Template/Temp/img/work-4.jpg" alt="" class="img-fluid">
                            </div>
                            <div class="work-content">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <h2 class="w-title">Bindo Laro Cado</h2>
                                        <div class="w-more">
                                            <span class="w-ctegory">Web Design</span> / <span class="w-date">18 Sep. 2018</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="w-like">
                                            <span class="ion-ios-plus-outline"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="work-box">
                        <a href="../Assets/Template/Temp/img/work-5.jpg" data-lightbox="gallery-mf">
                            <div class="work-img">
                                <img src="../Assets/Template/Temp/img/work-5.jpg" alt="" class="img-fluid">
                            </div>
                            <div class="work-content">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <h2 class="w-title">Studio Lena Mado</h2>
                                        <div class="w-more">
                                            <span class="w-ctegory">Web Design</span> / <span class="w-date">18 Sep. 2018</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="w-like">
                                            <span class="ion-ios-plus-outline"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="work-box">
                        <a href="../Assets/Template/Temp/img/work-6.jpg" data-lightbox="gallery-mf">
                            <div class="work-img">
                                <img src="../Assets/Template/Temp/img/work-6.jpg" alt="" class="img-fluid">
                            </div>
                            <div class="work-content">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <h2 class="w-title">Studio Big Bang</h2>
                                        <div class="w-more">
                                            <span class="w-ctegory">Web Design</span> / <span class="w-date">18 Sep. 2017</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="w-like">
                                            <span class="ion-ios-plus-outline"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!--/ Section Portfolio End /-->

    <!--/ Section Testimonials Star /-->
    <div class="testimonials paralax-mf bg-image" style="background-image: url(../Assets/Template/Temp/img/overlay-bg.jpg)">
        <div class="overlay-mf"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div id="testimonial-mf" class="owl-carousel owl-theme">
                        <div class="testimonial-box">
                            <div class="author-test">
                                <img src="../Assets/Template/Temp/img/testimonial-2.jpg" alt="" class="rounded-circle b-shadow-a">
                                <span class="author">Xavi Alonso</span>
                            </div>
                            <div class="content-test">
                                <p class="description lead">
                                    Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Lorem ipsum dolor sit amet,
                                    consectetur adipiscing elit.
                                </p>
                                <span class="comit"><i class="fa fa-quote-right"></i></span>
                            </div>
                        </div>
                        <div class="testimonial-box">
                            <div class="author-test">
                                <img src="../Assets/Template/Temp/img/testimonial-4.jpg" alt="" class="rounded-circle b-shadow-a">
                                <span class="author">Marta Socrate</span>
                            </div>
                            <div class="content-test">
                                <p class="description lead">
                                    Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Lorem ipsum dolor sit amet,
                                    consectetur adipiscing elit.
                                </p>
                                <span class="comit"><i class="fa fa-quote-right"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--/ Section Blog Star /-->
    <section id="blog" class="blog-mf sect-pt4 route">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="title-box text-center">
                        <h3 class="title-a">
                            Blog
                        </h3>
                        <p class="subtitle-a">
                            Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                        </p>
                        <div class="line-mf"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card card-blog">
                        <div class="card-img">
                            <a href="../Assets/Template/Temp/blog-single.html"><img src="../Assets/Template/Temp/img/post-1.jpg" alt="" class="img-fluid"></a>
                        </div>
                        <div class="card-body">
                            <div class="card-category-box">
                                <div class="card-category">
                                    <h6 class="category">Travel</h6>
                                </div>
                            </div>
                            <h3 class="card-title"><a href="../Assets/Template/Temp/blog-single.html">See more ideas about Travel</a></h3>
                            <p class="card-description">
                                Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Praesent sapien massa, convallis
                                a pellentesque nec,
                                egestas non nisi.
                            </p>
                        </div>
                        <div class="card-footer">
                            <div class="post-author">
                                <a href="../Assets/Template/Temp/#">
                                    <img src="../Assets/Template/Temp/img/testimonial-2.jpg" alt="" class="avatar rounded-circle">
                                    <span class="author">Morgan Freeman</span>
                                </a>
                            </div>
                            <div class="post-date">
                                <span class="ion-ios-clock-outline"></span> 10 min
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-blog">
                        <div class="card-img">
                            <a href="../Assets/Template/Temp/blog-single.html"><img src="../Assets/Template/Temp/img/post-2.jpg" alt="" class="img-fluid"></a>
                        </div>
                        <div class="card-body">
                            <div class="card-category-box">
                                <div class="card-category">
                                    <h6 class="category">Web Design</h6>
                                </div>
                            </div>
                            <h3 class="card-title"><a href="../Assets/Template/Temp/blog-single.html">See more ideas about Travel</a></h3>
                            <p class="card-description">
                                Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Praesent sapien massa, convallis
                                a pellentesque nec,
                                egestas non nisi.
                            </p>
                        </div>
                        <div class="card-footer">
                            <div class="post-author">
                                <a href="../Assets/Template/Temp/#">
                                    <img src="../Assets/Template/Temp/img/testimonial-2.jpg" alt="" class="avatar rounded-circle">
                                    <span class="author">Morgan Freeman</span>
                                </a>
                            </div>
                            <div class="post-date">
                                <span class="ion-ios-clock-outline"></span> 10 min
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-blog">
                        <div class="card-img">
                            <a href="../Assets/Template/Temp/blog-single.html"><img src="../Assets/Template/Temp/img/post-3.jpg" alt="" class="img-fluid"></a>
                        </div>
                        <div class="card-body">
                            <div class="card-category-box">
                                <div class="card-category">
                                    <h6 class="category">Web Design</h6>
                                </div>
                            </div>
                            <h3 class="card-title"><a href="../Assets/Template/Temp/blog-single.html">See more ideas about Travel</a></h3>
                            <p class="card-description">
                                Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Praesent sapien massa, convallis
                                a pellentesque nec,
                                egestas non nisi.
                            </p>
                        </div>
                        <div class="card-footer">
                            <div class="post-author">
                                <a href="../Assets/Template/Temp/#">
                                    <img src="../Assets/Template/Temp/img/testimonial-2.jpg" alt="" class="avatar rounded-circle">
                                    <span class="author">Morgan Freeman</span>
                                </a>
                            </div>
                            <div class="post-date">
                                <span class="ion-ios-clock-outline"></span> 10 min
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ Section Blog End /-->


    <!--/ Section Contact-Footer Star /-->
    <section class="paralax-mf footer-paralax bg-image sect-mt4 route" style="background-image: url(../Assets/Template/Temp/img/overlay-bg.jpg)">
        <div class="overlay-mf"></div>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="contact-mf">
                        <div id="contact" class="box-shadow-full">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="title-box-2">
                                        <h5 class="title-left">
                                            Send Message Us
                                        </h5>
                                    </div>
                                    <div>
                                        <form action="" method="post" role="form" class="contactForm">
                                            <div id="sendmessage">Your message has been sent. Thank you!</div>
                                            <div id="errormessage"></div>
                                            <div class="row">
                                                <div class="col-md-12 mb-3">
                                                    <div class="form-group">
                                                        <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                                                        <div class="validation"></div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <div class="form-group">
                                                        <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                                                        <div class="validation"></div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                                                        <div class="validation"></div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-3">
                                                    <div class="form-group">
                                                        <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                                                        <div class="validation"></div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <button type="submit" class="button button-a button-big button-rouded">Send Message</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="title-box-2 pt-4 pt-md-0">
                                        <h5 class="title-left">
                                            Get in Touch
                                        </h5>
                                    </div>
                                    <div class="more-info">
                                        <p class="lead">
                                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis dolorum dolorem soluta quidem
                                            expedita aperiam aliquid at.
                                            Totam magni ipsum suscipit amet? Autem nemo esse laboriosam ratione nobis
                                            mollitia inventore?
                                        </p>
                                        <ul class="list-ico">
                                            <li><span class="ion-ios-location"></span> 329 WASHINGTON ST BOSTON, MA 02108</li>
                                            <li><span class="ion-ios-telephone"></span> (617) 557-0089</li>
                                            <li><span class="ion-email"></span> contact@example.com</li>
                                        </ul>
                                    </div>
                                    <div class="socials">
                                        <ul>
                                            <li><a href="../Assets/Template/Temp/"><span class="ico-circle"><i class="ion-social-facebook"></i></span></a></li>
                                            <li><a href="../Assets/Template/Temp/"><span class="ico-circle"><i class="ion-social-instagram"></i></span></a></li>
                                            <li><a href="../Assets/Template/Temp/"><span class="ico-circle"><i class="ion-social-twitter"></i></span></a></li>
                                            <li><a href="../Assets/Template/Temp/"><span class="ico-circle"><i class="ion-social-pinterest"></i></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="copyright-box">
                            <p class="copyright">&copy; Copyright <strong>Sarath S Nair</strong>. All Rights Reserved</p>
                            <div class="credits">
                                <!--
                                  All the links in the footer should remain intact.
                                  You can delete the links only if you purchased the pro version.
                                  Licensing information: https://bootstrapmade.com/license/
                                  Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=DevFolio
                                -->
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </section>
    <!--/ Section Contact-footer End /-->

    <a href="../Assets/Template/Temp/#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
    <div id="preloader"></div>

    <!-- JavaScript Libraries -->
    <script src="../Assets/Template/Temp/lib/jquery/jquery.min.js"></script>
    <script src="../Assets/Template/Temp/lib/jquery/jquery-migrate.min.js"></script>
    <script src="../Assets/Template/Temp/lib/popper/popper.min.js"></script>
    <script src="../Assets/Template/Temp/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="../Assets/Template/Temp/lib/easing/easing.min.js"></script>
    <script src="../Assets/Template/Temp/lib/counterup/jquery.waypoints.min.js"></script>
    <script src="../Assets/Template/Temp/lib/counterup/jquery.counterup.js"></script>
    <script src="../Assets/Template/Temp/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="../Assets/Template/Temp/lib/lightbox/js/lightbox.min.js"></script>
    <script src="../Assets/Template/Temp/lib/typed/typed.min.js"></script>
    <!-- Contact Form JavaScript File -->
    <script src="../Assets/Template/Temp/contactform/contactform.js"></script>

    <!-- Template Main Javascript File -->
    <script src="../Assets/Template/Temp/js/main.js"></script>

</body>
</html>

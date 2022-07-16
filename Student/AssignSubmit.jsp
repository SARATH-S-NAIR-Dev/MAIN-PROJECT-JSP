<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">
        <head>
        <%String Stud = session.getAttribute("Sname").toString();
            DateFormat yearf = new SimpleDateFormat("YYYY");
            DateFormat monthf = new SimpleDateFormat("MM");
            DateFormat dayf = new SimpleDateFormat("dd");
            
            String year = yearf.format(new Date());
            String month = monthf.format(new Date());
            String day = dayf.format(new Date());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
            int yearnew = Integer.parseInt(year);
            
            Date Date = sdf.parse(String.valueOf(yearnew) + "-" + month + "-" + day);
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
                <a class="navbar-brand js-scroll" style="color: #0078ff" href="../Assets/Template/Temp/#page-top" >MCA </a>
                <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
                        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
                <div class="navbar-collapse collapse justify-content-end" id="navbarDefault">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link js-scroll active" style="color: #0078ff"  href="StudentHome.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll" style="color: #0078ff" href="StudentProfile.jsp">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll" style="color: #0078ff" href="StudentActionEdit.jsp">Edit Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll" style="color: #0078ff"  href="StudentChangePassword.jsp">Change Password</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll" style="color: #0078ff" href="TableView.jsp">Timetable</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll" style="color: #0078ff"  href="#contact">Contact</a>
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
                                            String select = "select * from tbl_notification ";
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

                                        <a href="#"  class="dropdown-item text-center">See all notifications</a>
                                    </div>
                                </div>
                            </div>
                        </li>



                    </ul>
                </div>
            </div>
        </nav>
      

        <!--/ Intro Skew End /-->


        <br>
        <br>
        <!--/ Section Blog Star /-->
        <section id="blog" class="blog-mf sect-pt4 route">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="title-box text-center">
                            <h3 class="title-a">
                                Assignment Details
                            </h3>
                            <p class="subtitle-a">
                                You can Submit Your Assignments Here!
                            </p>
                            <div class="line-mf"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">

                    </div>
                    <div class="col-md-4">
                        <%
                            String sel = "select * from tbl_assignnoti n inner join tbl_assign a on n.subject_id=a.subject_id inner join tbl_teacher t on a.teacher_id=t.teacher_id where noti_id='" + request.getParameter("mid") + "'";
                            ResultSet ros = con.selectCommand(sel);
                            System.out.println(sel);
                               
                            while (ros.next()) {
                                   

                        %>
                        <div class="card card-blog">


                            <div class="card-body">
                                <div class="card-category-box">
                                    <div class="card-category">
                                        <h2 class="category"><%=ros.getString("noti_title")%></h2>
                                    </div>
                                </div>
                                <p class="card-description">
                                    <%=ros.getString("noti_details")%>
                                </p>
                                <%
                                
                                Date date1 = sdf.parse(ros.getString("noti_subdate"));  
                                    if (Date.compareTo(date1)<0) {
                                %>
                                <form method="post" enctype="multipart/form-data" action="../Assets/Actionpages/assupdaction.jsp">
                                    <input type="hidden" name='file' value="<%=request.getParameter("mid")%>">
                                    <input type="file"  name="file_ass">
                                    <input type="submit" class="category"  name="btn_upload">
                                </form>
                                <%
                                } else {
                                %>
                                Time Over
                                <%        
                                }
                                %>
                            </div>
                            <div class="card-footer">
                                <div class="post-author">
                                    <a href="../Assets/Template/Temp/#">
                                        <img src="../Assets/Template/Temp/img/testimonial-2.jpg" alt="" class="avatar rounded-circle">
                                        <span class="author"><%=ros.getString("teacher_name")%></span>
                                    </a>
                                </div>
                                <div class="post-date">
                                    <span class="ion-ios-clock-outline"></span> <%=ros.getString("noti_subdate")%>
                                </div>
                            </div>

                        </div>
                        <%
                            }
                                        
                        %>
                    </div>
                    <div class="col-md-4">

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
                                <p class="copyright">&copy; Copyright <strong>DevFolio</strong>. All Rights Reserved</p>
                                <div class="credits">
                                    <!--
                                      All the links in the footer should remain intact.
                                      You can delete the links only if you purchased the pro version.
                                      Licensing information: https://bootstrapmade.com/license/
                                      Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=DevFolio
                                    -->
                                    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
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

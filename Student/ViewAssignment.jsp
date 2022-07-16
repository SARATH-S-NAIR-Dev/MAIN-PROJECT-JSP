<%-- 
    Document   : SemMark
    Created on : Apr 18, 2022, 1:49:48 AM
    Author     : PSST
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
     
        <section id="service" class="services-mf route">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="title-box text-center">
                            <br>
                            <br>
                            <h3 class="title-a">
                               SELECT SEMESTER
                            </h3>
                            <p class="subtitle-a">
                                Complete Semester Assignment
                            </p>
                            <div class="line-mf"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    
                  
                     <%
            String select="select * from tbl_assignnoti ";
            ResultSet rs=con.selectCommand(select);
            System.out.println(select);
             
                    while (rs.next()) {
                       
        
        
        
        
        %>
                
                    <div class="col-md-4">
                        <a href="AssignSubmit.jsp?mid=<%=rs.getString("noti_id")%>"> <div class="service-box">
                                <div class="service-ico">
                                    <span class="ico-circle"><i class="ion-android-document"></i></span>
                                </div>
                                <div class="service-content">
                                    <h2 class="s-title"><%=rs.getString("noti_title")%></h2>
                                    <p class="s-description text-center">

                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>
                    
                                    <%
                    }
                                    %>

                </div>
            </div>
        </section>
                
    </body>
</html>

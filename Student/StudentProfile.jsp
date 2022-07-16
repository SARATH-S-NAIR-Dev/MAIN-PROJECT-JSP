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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="header.jsp" %>
    </head>
    <body>

        <form>
            <h2 align="center" style="color:#0078ff" style="font-size: 60px" >Student Profile</h2>
            <table align="center"colspan="3" cellpadding="20px" border="1">




                <%                    String sele = "select * from tbl_student where student_id='" + session.getAttribute("Studentid") + "'";
                    ResultSet res = con.selectCommand(sele);

                    if (res.next()) {


                %>
                <section id="about" class="about-mf sect-pt4 route">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="box-shadow-full">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-sm-6 col-md-5">
                                                    <div class="about-img">
                                                        <img src="../Assets/Files/StudentPhoto/<%=res.getString("student_photo")%>" class="img-fluid rounded b-shadow-a" alt="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-md-7">
                                                    <div class="about-info">
                                                        <p><span class="title-s">Name: </span> <span><%=res.getString("student_name")%></span></p>
                                                        <p><span class="title-s">Phone: </span> <span><%=res.getString("student_contact")%></span></p>
                                                        <p><span class="title-s">Email: </span> <span><%=res.getString("student_email")%></span></p>
                                                        <p><span class="title-s">Address: </span> <span><%=res.getString("student_address")%></span></p>
                                                        <p><span class="title-s">Gender: </span> <span><%=res.getString("student_gender")%></span></p>
                                                        <p><span class="title-s">Year: </span> <span><%=res.getString("student_year")%></span></p>
                                                        <p><span class="title-s">Reegister NO: </span> <span><%=res.getString("student_regno")%></span></p>
                                                        <p><span class="title-s">D.O.B: </span> <span><%=res.getString("student_dob")%></span></p>
                                                        <p><span class="title-s">Aadhar NO: </span> <span><%=res.getString("student_aadhar")%></span></p>
                                                        <p><span class="title-s">Blood group: </span> <span><%=res.getString("student_blood")%></span></p>
                                                        <p><span class="title-s">Admission NO: </span> <span><%=res.getString("student_admno")%></span></p>
                                                        <p><span class="title-s">Religion: </span> <span><%=res.getString("student_religion")%></span></p>
                                                        <p><span class="title-s">Cast: </span> <span><%=res.getString("student_category")%></span></p>
                                                        <p><span class="title-s">Guardian Phone: </span> <span><%=res.getString("student_guardno")%></span></p>
                                                        <p><span class="title-s">Roll NO: </span> <span><%=res.getString("student_roll")%></span></p>


                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="skill-mf">
                                            <p class="title-s">Skill</p>
                                            <span>HTML</span> <span class="pull-right">85%</span>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" style="width: 85%;" aria-valuenow="85" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>
                                            <span>CSS3</span> <span class="pull-right">75%</span>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>
                                            <span>PHP</span> <span class="pull-right">50%</span>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>
                                            <span>JAVASCRIPT</span> <span class="pull-right">90%</span>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0"
                                                     aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>




                <%

                    }


                %>



            </table>

        </form>
        <%@include file="footer.jsp" %>
    </body>
</html>

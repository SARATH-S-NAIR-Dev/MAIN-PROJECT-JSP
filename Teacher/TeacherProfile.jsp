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
    <%@include file="SessionValidator.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>

</head>
<body>
    <form>
        <h1 align="center" style="color:" ><u>Teacher Profile</u></h1>
        <table align="center"colspan="3" cellpadding="20px" border="1">




            <%
                String select1 = "select * from tbl_teacher where teacher_id='" + session.getAttribute("Teacherid") + "'";
                ResultSet rs1 = con.selectCommand(select1);

                if (rs1.next()) {


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
                    <img src="../Assets/Files/Teacher/TeacherPhoto//<%=rs1.getString("teacher_photo")%>" width="120" height="120">
                    </div>
                  </div>
                  <div class="col-sm-6 col-md-7">
                    <div class="about-info">
                      <p><span class="title-s">Name: </span> <span><%=rs1.getString("teacher_name")%></span></p>
                      <p><span class="title-s">Phone: </span> <span><%=rs1.getString("teacher_contact")%></span></p>
                      <p><span class="title-s">Email: </span> <span><%=rs1.getString("teacher_email")%></span></p>
                      <p><span class="title-s">Address: </span> <span><%=rs1.getString("teacher_address")%></span></p>
                      <p><span class="title-s">Gender: </span> <span><%=rs1.getString("teacher_gender")%></span></p>
                      <p><span class="title-s">Date Of Join: </span> <span><%=rs1.getString("teacher_doj")%></span></p>
                      <p><span class="title-s">Qualification: </span> <span><%=rs1.getString("teacher_qualification")%></span></p>
                      
                      
                      
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

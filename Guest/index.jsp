<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="css/style.css">

    <title>Login #7</title>
  </head>
  <body>
  
   <%
        if(request.getParameter("LOGIN")!=null){
            
            String sel="select * from tbl_admin where admin_email='"+request.getParameter("email")+"' and admin_password='"+request.getParameter("password")+"' ";
                  ResultSet res=con.selectCommand(sel);
                  
                  String sele="select * from tbl_teacher where teacher_email='"+request.getParameter("email")+"' and teacher_password='"+request.getParameter("password")+"' ";
                  ResultSet rs=con.selectCommand(sele);
                  
                  String selec="select * from tbl_student where student_email='"+request.getParameter("email")+"' and student_password='"+request.getParameter("password")+"' ";
                  ResultSet rsss=con.selectCommand(selec);
                  
            if(rs.next()){
                 session.setAttribute("Type", "teacher");
                session.setAttribute("Teacherid", rs.getString("teacher_id"));
                session.setAttribute("Tname", rs.getString("teacher_name"));
                response.sendRedirect("../Teacher/TeacherHome.jsp");
                
            }
            else if(res.next()){
                
                session.setAttribute("Adminid", res.getString("admin_id"));
                session.setAttribute("Aname", res.getString("admin_name"));
                response.sendRedirect("../Admin/Index.jsp");
            
            }
            else if(rsss.next()){
                session.setAttribute("Type", "student");
                session.setAttribute("StudentYear", rsss.getString("student_year"));
                session.setAttribute("Studentid", rsss.getString("student_id"));
                session.setAttribute("Sname", rsss.getString("student_name"));
                response.sendRedirect("../Student/StudentHome.jsp");
            
            }
            
            
               
            else{
                %>
                <script>
                    
                    alert('invalid credentials 🤨');
                </script>
        
        <%
            }
         
        }
        
        
        %>
        
  
  <div class="content">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <img src="images/undraw_remotely_2j6y.svg" alt="Image" class="img-fluid">
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="mb-4">
              <h3>Sign In</h3>
              <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p>
            </div>
            <form action="#" method="post">
              <div class="form-group first">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="email" name="email">

              </div>
              <div class="form-group last mb-4">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password">
                
              </div>
              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                  <input type="checkbox" checked="checked"/>
                  <div class="control__indicator"></div>
                </label>
                <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span> 
              </div>

              <input type="submit" value="Log In" class="btn btn-block btn-primary" name="LOGIN">

              <span class="d-block text-left my-4 text-muted">&mdash; or login with &mdash;</span>
              
              <div class="social-login">
                <a href="#" class="facebook">
                  <span class="icon-facebook mr-3"></span> 
                </a>
                <a href="#" class="twitter">
                  <span class="icon-twitter mr-3"></span> 
                </a>
                <a href="#" class="google">
                  <span class="icon-google mr-3"></span> 
                </a>
              </div>
            </form>
            </div>
          </div>
          
        </div>
        
      </div>
    </div>
  </div>

  
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
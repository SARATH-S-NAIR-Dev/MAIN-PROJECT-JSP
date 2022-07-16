<%-- 
    Document   : Home
    Created on : 28 Feb, 2022, 12:10:12 PM
    Author     : my pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%

        String Admin = session.getAttribute("Aname").toString();
    %>


    <body align="center">
        <form align="center">
            <h1 align="center">Welcome <%=Admin%></h1>

            <a href="Calender.jsp">Set calender</a>
            <a href="District.jsp">Add District</a>
            <a href="Notification.jsp">Add Notification</a>
            <a href="Place.jsp">Add Place</a>
            <a href="Semester.jsp">Add Semester</a>
            <a href="Subject.jsp">Add Subject</a>
            <a href="Teacher.jsp">Add Teacher</a>
            <a href="TeacherAssign.jsp">Assign Teachers</a>
            <a href="TeacherView.jsp">view Teachers</a>
            <a href="TimeTable.jsp">Set Timetable</a>
            <a href="Index.jsp">Dashboard</a>



        </form>
    </body>
</html>

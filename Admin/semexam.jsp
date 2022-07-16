<%--
    Document   : District
    Created on : 23 Feb, 2022, 3:10:37 PM
    Author     : my pc
--%>
<%@include file="Header.jsp" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%    String select = "", sel1 = "";
    Calendar now = Calendar.getInstance();
    int curyear = now.get(Calendar.YEAR);
    int curmonth = now.get(Calendar.MONTH) + 1;
    int year = 0;
    int k = 0;
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Assets/form.css" rel="stylesheet">
        <link href="../Assets/Template/Temp/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="Noti.css">
        <title>JSP Page</title>
        <style>
            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
        </style>
    </head>
    <body>



        <div id="tab" align="center">
            <form method="post">
                <table align="center" cellpadding='5'>

                    <td><label>SELECT SEMESTER HERE</label> </td>
                    <br>
                    <br>


                    <td>
                        <select name="slctsemester">
                            <option>--select--</option>
                            <%
                                String sel = "select * from tbl_semester";
                                ResultSet rsz = con.selectCommand(sel);
                                while (rsz.next()) {
                            %>
                            <option value="<%=rsz.getString("semester_id")%>"><%=rsz.getString("semester_name")%></option>
                            <%
                                }
                            %>
                        </select>


                    </td>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit"  name="Submit"  class="btn btn-primary ms-2" value="SHOW">
                            <input type="submit" name="Cancel"  class="btn btn-primary ms-2" value="Cancel">
                        </td>
                    </tr>
                </table >

            </form>

            <br>
            <%
                if (request.getParameter("Submit") != null) {

                    int sem = Integer.parseInt(request.getParameter("slctsemester"));

                    if (sem == 1 && curmonth >= 8 && curmonth <= 12) {
                        year = curyear;
                    } else if (sem == 2 && curmonth >= 1 && curmonth <= 5) {
                        year = curyear - 1;
                    } else if (sem == 3 && curmonth >= 8 && curmonth <= 12) {
                        year = curyear - 1;

                    } else if (sem == 4 && curmonth >= 1 && curmonth <= 5) {
                        year = curyear - 2;
                    }

                    select = "select * from tbl_student where student_year = '" + year + "'";
                    ResultSet rs = con.selectCommand(select);
                    ResultSet rs2 = con.selectCommand(select);
                    rs2.next();
                    int i = 0;

            %>
            <form method="post">
                <table align="center" border="1" width="100%" >
                    <tr>
                        <td>SI NO</td>
                        <td>Name</td>
                        <td>Reg No



                            <input type="hidden" name="txt_year" value="<%=year%>">
                            <input type="hidden" name="txt_sem" value="<%=request.getParameter("slctsemester")%>">
                        </td>
                        <%                         sel1 = "select * from tbl_subject where subject_status=0 and  semester_id='" + request.getParameter("slctsemester") + "'";

                            ResultSet rs1 = con.selectCommand(sel1);

                            while (rs1.next()) {
                                k++;
                        %>
                        <td><%=rs1.getString("subject_name")%></td>
                        <%
                            }
                        %>
                    </tr>
                    <%
                        while (rs.next()) {
                            i++;

                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("student_name")%></td>
                        <td><%=rs.getString("student_regno")%></td>
                        <%

                            ResultSet rszs = con.selectCommand(sel1);
                            while (rszs.next()) {
                                String markValue = "";
                                String selQry = "select * from tbl_mark where student_id = '" + rs.getString("student_id") + "' and subject_id = '" + rszs.getString("subject_id") + "'";
                                ResultSet rew = con.selectCommand(selQry);
                                if (rew.next()) {
                                    markValue = rew.getString("mark_mark");
                                }
                        %>
                        <td>
                            <input type="number" value="<%=markValue%>"  min="0" max="100" name="<%=rs.getString("student_id")%>_<%=rszs.getString("semester_id")%>_<%=rszs.getString("subject_id")%>">

                        </td>
                        <%
                            }


                        %>
                    </tr>

                    <%                    }


                    %>

                    <tr>
                        <td colspan="<%=k + 3%>" align="center">
                            <input type="submit"  name="Sub" value="Sumbit">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <%                    }

            if (request.getParameter("Sub") != null) {
                select = "select * from tbl_student where student_year = '" + request.getParameter("txt_year") + "'";

                sel1 = "select * from tbl_subject where  subject_status=0 and  semester_id='" + request.getParameter("txt_sem") + "'";
                ResultSet rs3 = con.selectCommand(select);

                while (rs3.next()) {

                    ResultSet rsc = con.selectCommand(sel1);
                    while (rsc.next()) {
                        String id = rs3.getString("student_id") + "_" + rsc.getString("semester_id") + "_" + rsc.getString("subject_id");
                        int mark = 0;
                        try {
                            mark = Integer.parseInt(request.getParameter(id));
                        } catch (NumberFormatException ex) {
                            mark = 0;
                        }

                        String grade = "";
                        String status = "";

                        if (mark >= 90 && mark <= 100) {
                            grade = "A+";
                            status = "Passed";
                        } else if (mark >= 80 && mark <= 89) {
                            grade = "A";
                            status = "Passed";
                        } else if (mark >= 70 && mark <= 79) {
                            grade = "B+";
                            status = "Passed";
                        } else if (mark >= 60 && mark <= 69) {
                            grade = "B";
                            status = "Passed";
                        } else if (mark >= 50 && mark <= 59) {
                            grade = "C+";
                            status = "Passed";
                        } else if (mark >= 40 && mark <= 49) {
                            grade = "C";
                            status = "Passed";
                        } else if (mark >= 30 && mark <= 39) {
                            grade = "D+";
                            status = "Passed";
                        } else if (mark >= 20 && mark <= 29) {
                            grade = "D";
                            status = "Failed";
                        } else if (mark >= 10 && mark <= 19) {
                            grade = "E";
                            status = "Failed";
                        } else if (mark >= 0 && mark <= 9) {
                            grade = "F";
                            status = "Failed";
                        }

                        String selQry = "select * from tbl_mark where student_id = '" + rs3.getString("student_id") + "' and subject_id = '" + rsc.getString("subject_id") + "'";
                        ResultSet rew = con.selectCommand(selQry);
                        if (rew.next()) {
                            String upQry = "update tbl_mark set mark_mark='" + mark + "',mark_grade='" + grade + "',mark_status='" + status + "' where mark_id='" + rew.getString("mark_id") + "'";
                            con.executeCommand(upQry);
                        } else {
                            String insQry = "insert into tbl_mark(student_id,subject_id,semester_id,mark_mark,mark_grade,mark_status)"
                                    + "values('" + rs3.getString("student_id") + "','" + rsc.getString("subject_id") + "','" + rsc.getString("semester_id") + "','" + mark + "','" + grade + "','" + status + "')";
                            con.executeCommand(insQry);
                        }

                    }
                }

        %>
        <script type="text/javascript">
            alert("Upload Successfully..😍");
            setTimeout(function() {
                window.location.href = 'semexam.jsp';
            }, 40);//40millisecend it go to next page
        </script>
        <%                    }

        %>

        <%@include file="Footer.jsp" %>
    </body>
</html>


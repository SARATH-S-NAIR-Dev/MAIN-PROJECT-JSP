<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet" %>

<%
    String select = "", sel1 = "";
    Calendar now = Calendar.getInstance();
    int curyear = now.get(Calendar.YEAR);
    int curmonth = now.get(Calendar.MONTH) + 1;
    int year = 0;
    int k = 0;
    String selQry1x = "";
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <html lang="en" >
        <head>

            <meta charset="UTF-8">
            <title><%=request.getParameter("mid")%> Semester Mark</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css">
        <style>
            body {
                margin:2em;
            }
        </style>
    </head>

    <body>
        <h1 align="center" id="heading">Sem Result Data</h1>

        <div align="right">
            <input type="radio" style="margin: 6px" id='radio'checked="" name="rdo_mark" onclick="refreshPage()" required="" value="all">All
            <input type="radio" style="margin: 6px" id='radio' name="rdo_mark" required="" value="<%=request.getParameter("mid")%>" onclick="getMark(this.value)">Own
        </div>

        <div id="dataT">
            <table id="example" class="display nowrap" style="width:100%">
                <thead>
                    <tr>
                        <th>SI NO</th>
                        <th>Student Name</th>
                            <%
                                String selQry = "select * from tbl_subject where subject_status=0 and semester_id='" + request.getParameter("mid") + "'";
                                ResultSet rs1 = con.selectCommand(selQry);
                                while (rs1.next()) {
                                    k++;
                            %>
                        <th><%=rs1.getString("subject_short")%></th>
                            <%
                                }

                            %>
                        <th>Grade</th>
                        <th>Status</th>
                        <th>SGPA</th>
                    </tr>
                </thead>
                <tbody>
                    <%                    int sem = Integer.parseInt(request.getParameter("mid"));

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
                        int i = 0;
                        while (rs.next()) {
                            i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("student_name")%></td>
                        <%
                            int total = 0;
                            String selQry1 = "";
                            ResultSet rszs = con.selectCommand(selQry);
                            while (rszs.next()) {
                                int markValue = 0;
                                String markGrade = "";
                                String markStatus = "";
                                selQry1 = "select * from tbl_mark where student_id = '" + rs.getString("student_id") + "' and subject_id = '" + rszs.getString("subject_id") + "'";
                                ResultSet rew = con.selectCommand(selQry1);
                                if (rew.next()) {
                                    markValue = Integer.parseInt(rew.getString("mark_mark"));
                                    markGrade = rew.getString("mark_grade");
                                    markStatus = rew.getString("mark_status");
                                }
                                if (markStatus.equals("Passed")) {
                        %>
                        <td style="background-color: #00cc00;color: white">
                            <%=markValue%> | <%=markGrade%>
                        </td>

                        <%
                        } else if (markStatus.equals("Failed")) {
                        %>
                        <td style="background-color: red;color: white">
                            <%=markValue%> | <%=markGrade%>
                        </td>

                        <%
                                }

                                total += markValue;
                                selQry1x = "select * from tbl_mark where student_id = '" + rs.getString("student_id") + "' and mark_status='Failed'";
                            }
                            String tGrade = "";
                            String tStatus = "";
                            double gp = 0;
                            int Cal = total / k;
                            int t = k * 100;
                            int per = (total * 100) / t;
                            if (per >= 90 && per <= 100) {
                                tGrade = "O";
                                tStatus = "Passed";
                                gp = 10;
                            } else if (per >= 85 && per <= 89) {
                                tGrade = "A+";
                                tStatus = "Passed";
                                gp = 9;
                            } else if (per >= 80 && per <= 84) {
                                tGrade = "A";
                                tStatus = "Passed";
                                gp = 8.5;
                            } else if (per >= 70 && per <= 79) {
                                tGrade = "B+";
                                tStatus = "Passed";
                                gp = 8;
                            } else if (per >= 60 && per <= 69) {
                                tGrade = "B";
                                tStatus = "Passed";
                                gp = 7;
                            } else if (per >= 50 && per <= 59) {
                                tGrade = "C";
                                tStatus = "Passed";
                                gp = 6;
                            } else if (per >= 45 && per <= 49) {
                                tGrade = "P";
                                tStatus = "Passed";
                                gp = 5;
                            } else if (per <= 44) {
                                tGrade = "F";
                                tStatus = "Failed";
                                gp = 0;
                            }

                            ResultSet rewq = con.selectCommand(selQry1x);
                            if (rewq.next()) {
                                tStatus = "Failed";
                                tGrade = "F";
                            }


                        %>
                        <td><%=tGrade%></td>
                        <td>
                            <%=tStatus%>
                        </td>
                        <td>
                            <%=per%>
                        </td>
                    </tr>


                    <%                        }

                    %>  

                </tbody>
            </table>
        </div>
        <!-- partial -->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>

        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

        <script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>

        <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>

        <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>

        <script>
                $(document).ready(function() {
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copy', 'csv', 'excel', 'pdf', 'print'
                        ]
                    });
                });
        </script>
        <script>
            function getMark(id)
            {

                $.ajax({
                    url: "../Assets/AjaxPages/AjaxOwnSubjectMark.jsp?mid=" + id,
                    success: function(html) {
                        $("#dataT").html(html);
                    }
                });
            }
          function refreshPage () {location.reload();}
        </script>
    </body>
</html>



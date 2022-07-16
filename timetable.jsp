<%-- 
    Document   : TableView
    Created on : 10 Mar, 2022, 12:31:03 PM
    Author     : my pc
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet" %>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body align="center">


        <%            String day[] = {"MONDAY", "TUESDAY", "WEDNSEDAY", "THURSDAY", "FRIDAY"};
            String hr[] = {"FIRST", "SECOND", "THIRD", "FOURTH", "FIFTH", "SIXTH"};

            String data[][] = {{"-", "-", "-", "-", "-", "-"},
            {"-", "-", "-", "-", "-", "-"},
            {"-", "-", "-", "-", "-", "-"},
            {"-", "-", "-", "-", "-", "-"},
            {"-", "-", "-", "-", "-", "-"},
            {"-", "-", "-", "-", "-", "-"}};

            Calendar now = Calendar.getInstance();
            int curyear = now.get(Calendar.YEAR);
            int curmonth = now.get(Calendar.MONTH);
            int syear = Integer.parseInt(request.getParameter("year"));

            int diff = curyear - syear;

            String id = "";

            if (diff == 2) {
                if (curmonth >= 8 && curmonth <= 12) {
                    id = "3";
                } else {
                    id = "4";
                }
            } else if (diff == 1) {
                if (curmonth >= 1 && curmonth <= 5) {
                    id = "2";
                } else {
                    id = "1";
                }
            }

            String sel = "";
            for (int i = 0; i < day.length; i++) {

                for (int j = 0; j < hr.length; j++) {
                    sel = "select * from tbl_timetable t inner join tbl_subject s on s.subject_id=t.subject_id where s.semester_id='" + id + "' and t.timetable_day='" + day[i] + "' and timetable_hour='" + hr[j] + "'";

                    ResultSet rs4 = con.selectCommand(sel);
                    if (rs4.next()) {

                        data[i][j] = rs4.getString("subject_short");
                    }
                }

            }


        %>



        <h3 align="center" ><FONT COLOR="DARKCYAN"><CENTER><ul>COLLEGE TIME TABLE</u></FONT></h3>

                    <div id='data'>
                        <table border="2" cellspacing="5" width="90%" cellpadding="15" align="center">
                            <tr>
                                <td align="center">Period Day</td>
                                <td>9:00-10:00</td>
                                <td>10:05-11:05</td>
                                <td>11:05-11:20</td>
                                <td>11:20-12:30</td>
                                <td>12:30-01:20</td>
                                <td>1:20-2:20</td>
                                <td>2:20-2:30</td>
                                <td>2:30-3:30</td>
                                <td>3:30-4:30</td>
                            </tr>
                            <tr>
                                <td align="center">MONDAY</td>
                                <td align="center"><font color="blue"><%=data[0][0]%><br>
                                <td align="center"><font color="blue"><%=data[0][1]%><br>
                                <td rowspan="5"align="center">B<br>R<br>E<br>A<br>K
                                <td align="center"><font color="blue"><%=data[0][2]%><br>
                                <td rowspan="5"align="center">L<br>U<br>N<br>C<br>H
                                <td align="center"><font color="blue"><%=data[0][3]%><br>
                                <td rowspan="5"align="center">B<br>R<br>E<br>A<br>K
                                <td align="center"><font color="blue"><%=data[0][4]%><br>
                                <td align="center"><font color="blue"><%=data[0][5]%><br>

                            </tr>
                            <tr>
                                <td align="center">TUESDAY
                                <td align="center"><font color="blue"><%=data[1][0]%><br>
                                <td align="center"><font color="blue"><%=data[1][1]%><br>
                                <td align="center"><font color="blue"><%=data[1][2]%><br>
                                <td align="center"><font color="blue"><%=data[1][3]%><br>
                                <td align="center"><font color="blue"><%=data[1][4]%><BR>
                                <td align="center"><font color="blue"><%=data[1][5]%><br>

                            </tr>
                            <tr>
                                <td align="center">WEDNESDAY
                                <td align="center"><font color="blue"><%=data[2][0]%><br>
                                <td align="center"><font color="blue"><%=data[2][1]%><BR>
                                <td align="center"><font color="blue"><%=data[2][2]%><br>
                                <td align="center"><font color="blue"><%=data[2][3]%><br>
                                <td align="center"><font color="blue"><%=data[2][4]%><br>
                                <td align="center"><font color="blue"><%=data[2][5]%><br>
                            </tr>
                            <tr>
                                <td align="center">THURSDAY
                                <td align="center"><font color="blue"><%=data[3][0]%><br>
                                <td align="center"><font color="blue"><%=data[3][1]%><br>
                                <td align="center"><font color="blue"><%=data[3][2]%><BR>
                                <td align="center"><font color="blue"><%=data[3][3]%><br>
                                <td align="center"><font color="blue"><%=data[3][4]%><br>
                                <td align="center"><font color="blue"><%=data[3][5]%><br>

                            </tr>
                            <tr>
                                <td align="center">FRIDAY
                                <td align="center"><font color="blue"><%=data[4][0]%><BR>
                                <td align="center"><font color="blue"><%=data[4][1]%><br>
                                <td align="center"><font color="blue"><%=data[4][2]%><br>
                                <td align="center"><font color="blue"><%=data[4][3]%><br>
                                <td align="center"><font color="blue"><%=data[4][4]%><br>
                                <td align="center"><font color="blue"><%=data[4][5]%><br>

                            </tr>

                            <tr>
                                <td align="center">Friday Timing</td>
                                <td>9:00-10:00</td>
                                <td>10:05-11:05</td>
                                <td>11:05-11:20</td>
                                <td>11:20-12:30</td>
                                <td>12:30-02:00</td>
                                <td>2:00-2:45</td>
                                <td>2:45-2:55</td>
                                <td>2:55-3:40</td>
                                <td>3:40-4:30</td>
                            </tr>
                        </table>
                    </div>
                    </body>
                    </html>
                    <script src="Assets/JQ/jQuery.js"></script>
                    <script>
                        function getSem(id)
                        {

                            $.ajax({
                                url: "Assets/AjaxPages/Ajaxtable.jsp?did=" + id,
                                success: function(html) {
                                    $("#data").html(html);
                                }
                            });
                        }
                    </script>
<%-- 
    Document   : TableView
    Created on : 10 Mar, 2022, 12:31:03 PM
    Author     : my pc
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Arrays"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="header.jsp" %>
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    </head>
    <body align="center">


        <%            String day[] = {"MONDAY", "TUESDAY", "WEDNSEDAY", "THURSDAY", "FRIDAY"};
            String hr[] = {"FIRST", "SECOND", "THIRD", "FOURTH", "FIFTH", "SIXTH"};

            String data[][]
                    = {{"-", "-", "-", "-", "-", "-"},
                    {"-", "-", "-", "-", "-", "-"},
                    {"-", "-", "-", "-", "-", "-"},
                    {"-", "-", "-", "-", "-", "-"},
                    {"-", "-", "-", "-", "-", "-"},
                    {"-", "-", "-", "-", "-", "-"}};

            String[] array = new String[100];

            String id = "1";
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
            Calendar calendar = Calendar.getInstance();
            Date date = calendar.getTime();
            String Day = new SimpleDateFormat("EEEE", Locale.ENGLISH).format(date.getTime()).toString();

            int q = 0;
            String selSub = "select * from tbl_subject s inner join tbl_assign a on a.subject_id=s.subject_id inner join tbl_teacher t on t.teacher_id=a.teacher_id where t.teacher_id='" + session.getAttribute("Teacherid") + "'";
            ResultSet rsx = con.selectCommand(selSub);
            while (rsx.next()) {
                array[q] = rsx.getString("subject_short");
                q++;
            }

            boolean contains = Arrays.asList(array).contains("ADM");

        %>



        <h3 align="center" style="font-size: 60px"><FONT COLOR="DARKCYAN"><CENTER><ul>COLLEGE TIME TABLE</u></FONT></h3>
                    <table align="center" cellspacing="20" style="font-size:30px">


                        <td><label>SELECT SEMESTER HERE</label> </td>
                        <br>
                        <br>
                        <%                           
                            String sele = "select * from tbl_semester";
                            ResultSet ress = con.selectCommand(sele);
                            int k = 0;
                            while (ress.next()) {
                                k++;

                        %>

                        <td>
                            <input type="radio" id='radio' name="SELSEM" required="" value="<%=ress.getString("semester_id")%>" onchange="getSem(this.value)"><%=ress.getString("semester_name")%>

                        </td>
                        <%
                            }
                        %>

                        </tr>
                    </table>
                    <br>
                    <div id='data'>
                        <table border="2" cellspacing="5" cellpadding="15" align="center">
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
                            <tr <%if (Day.equals("Monday")) {%>style="background-color: #ccccff"<%}%>>
                                <td align="center">MONDAY</td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[0][0])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[0][0]%></span></</td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[0][1])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[0][1]%></span></td>
                                <td style="background-color: #F3F6F9" rowspan="5" align="center">B<br>R<br>E<br>A<br>K
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[0][2])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[0][2]%></span></td>
                                <td rowspan="5"align="center" style="background-color: #F3F6F9">L<br>U<br>N<br>C<br>H
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[0][3])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[0][3]%></span></td>
                                <td rowspan="5"align="center" style="background-color: #F3F6F9">B<br>R<br>E<br>A<br>K
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[0][4])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[0][4]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[0][5])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[0][5]%></span></td>

                            </tr>
                            <tr <%if (Day.equals("Tuesday")) {%>style="background-color: #ccccff"<%}%>>
                                <td align="center">TUESDAY</td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[1][0])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[1][0]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[1][1])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[1][1]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[1][2])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[1][2]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[1][3])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[1][3]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[1][4])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[1][4]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[1][5])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[1][5]%></span></td>

                            </tr>
                            <tr <%if (Day.equals("Wednesday")) {%>style="background-color: #ccccff"<%}%>>
                                <td align="center">WEDNESDAY</td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[2][0])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[2][0]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[2][1])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[2][1]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[2][2])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[2][2]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[2][3])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[2][3]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[2][4])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[2][4]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[2][5])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[2][5]%></span></td>
                            </tr>
                            <tr <%if (Day.equals("Thursday")) {%>style="background-color: #ccccff"<%}%>>
                                <td align="center">THURSDAY</td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[3][0])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[3][0]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[3][1])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[3][1]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[3][2])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[3][2]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[3][3])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[3][3]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[3][4])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[3][4]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[3][5])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[3][5]%></span></td>

                            </tr>
                            <tr <%if (Day.equals("Friday")) {%>style="background-color: #ccccff"<%}%>>
                                <td align="center">FRIDAY</td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[4][0])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[4][0]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[4][1])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[4][1]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[4][2])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[4][2]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[4][3])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[4][3]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[4][4])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[4][4]%></span></td>
                                <td align="center"><span <%if (Arrays.asList(array).contains(data[4][5])) {
                                        out.println("style='color:red'");
                                    }%>><%=data[4][5]%></span></td>

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
                    <%@include file="footer.jsp" %>
                    </body>
                    </html>
                    <script src="../Assets/JQ/jQuery.js"></script>
                    <script>
                                function getSem(id)
                                {

                                    $.ajax({
                                        url: "../Assets/AjaxPages/Ajaxtable.jsp?did=" + id,
                                        success: function(html) {
                                            $("#data").html(html);
                                        }
                                    });
                                }
                    </script>
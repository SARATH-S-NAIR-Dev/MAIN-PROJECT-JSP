<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%

            String day[] = {"MONDAY", "TUESDAY", "WEDNSEDAY", "THURSDAY", "FRIDAY"};
            String hr[] = {"FIRST", "SECOND", "THIRD", "FOURTH", "FIFTH", "SIXTH"};

            String data[][] = {{"-", "-", "-", "-", "-", "-"},
            {"-", "-", "-", "-", "-", "-"},
            {"-", "-", "-", "-", "-", "-"},
            {"-", "-", "-", "-", "-", "-"},
            {"-", "-", "-", "-", "-", "-"},
            {"-", "-", "-", "-", "-", "-"}};

           

            String id = request.getParameter("did");

          

            String sel = "",SemId="";
            for (int i = 0; i < day.length; i++) {

                for (int j = 0; j < hr.length; j++) {
                    sel = "select * from tbl_timetable t inner join tbl_subject s on s.subject_id=t.subject_id where s.semester_id='" + id + "' and t.timetable_day='" + day[i] + "' and timetable_hour='" + hr[j] + "'";
                   out.println();
                    ResultSet rs = con.selectCommand(sel);
                    if (rs.next()) {

                        data[i][j] = rs.getString("subject_short");
                        SemId=rs.getString("semester_id");
                    }
                }

            }

        %>
        
 
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
       

   





















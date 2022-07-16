<%-- 
    Document   : TeacherAssign
    Created on : 9 Mar, 2022, 2:25:27 PM
    Author     : my pc
--%>
<%@include file="Header.jsp" %>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String tid = "", sid = "", sbid = "", aid = "",hid="";
            if (request.getParameter("btnsave") != null) {

                
                  String select = "select * from tbl_timetable t inner join tbl_subject s on s.subject_id= t.subject_id where timetable_day='" +request.getParameter("slctday")+ "' and timetable_hour='" + request.getParameter("slcthour") + "' and s.subject_id='" + request.getParameter("slctsub") + "' and semester_id='" + request.getParameter("slctsem")+ "'";
                    ResultSet resss = con.selectCommand(select);
                    if(resss.next()) {
                        
                        %>
                        
                        <script>alert('Alredy Assigned😬')</script>
                        <%
                    } else{ 

                    String insert = "insert into tbl_timetable(timetable_day,timetable_hour,subject_id)values('" + request.getParameter("slctday") + "','" + request.getParameter("slcthour") + "','" + request.getParameter("slctsub") + "')";
                    con.executeCommand(insert);
                                
        %>


        <script>alert('inserted😍')</script>  

        <%   
            
            }}
            if (request.getParameter("did") != null) {

                String del = "delete from tbl_timetable where timetable_id='" + request.getParameter("did") + "'";
                con.executeCommand(del);
                response.sendRedirect("TimeTable.jsp");

            }
        %>




        <h1 align="center">Assign TimeTable!</h1>
        <form method="post">
            <table align="center" border="1" cellpadding="10" style="border-collapse: collapse" class="table text-start align-middle table-bordered table-hover mb-0">
                <input type="hidden" name="txthidden" value="<%=aid%>">


                <tr>
                    <td>Day</td>
                    <td>
                        <select name="slctday">
                            <option value="" hidden>--select--</option>
                            <option value="MONDAY"<%if (tid.equals("MONDAY")) {
                                        out.println("selected");
                                    }%>>MONDAY</option>
                            <option value="TUESDAY"<%if (tid.equals("TUESDAY")) {
                                        out.println("selected");
                                    }%>>TUESDAY</option>
                             <option value="WEDNESDAY"<%if (tid.equals("WEDNESDAY")) {
                                        out.println("selected");
                                    }%>>WEDNESDAY</option>
                            <option value="THURSDAY"<%if (tid.equals("THURSDAY")) {
                                        out.println("selected");
                                    }%>>THURSDAY</option>
                              <option value="FRIDAY"<%if (tid.equals("FRIDAY")) {
                                        out.println("selected");
                                    }%>>FRIDAY</option>
                            
                            
                        </select>

                    </td>
                </tr>
                <tr>
                    <td>Hour</td>
                    <td>
                        <select name="slcthour">
                            <option value="" hidden>--select--</option>
                            <option value="FIRST"<%if (hid.equals("FIRST")) {
                                        out.println("selected");
                                    }%>>FIRST</option>
                            <option value="SECOND"<%if (hid.equals("SECOND")) {
                                        out.println("selected");
                                    }%>>SECOND</option>
                             <option value="THIRD"<%if (hid.equals("THIRD")) {
                                        out.println("selected");
                                    }%>>THIRD</option>
                            <option value="FOURTH"<%if (hid.equals("FORTH")) {
                                        out.println("selected");
                                    }%>>FOURTH</option>
                              <option value="FIFTH"<%if (hid.equals("FIFTH")) {
                                        out.println("selected");
                                    }%>>FIFTH</option>
                             <option value="SIXTH"<%if (hid.equals("SIXTH")) {
                                        out.println("selected");
                                    }%>>SIXTH</option>
                                                      
                        </select>

                    </td>
                </tr>
                <tr>
                    <td><label>Semester</label></td>
                    <td>
                        <div class="custom-select" style="width:200px;">
                            <select name="slctsem" class="select"    onchange="getSub(this.value)">
                                <option value="">--select--</option>
                                <%
                                    String selec = "select * from tbl_semester";
                                    ResultSet ress = con.selectCommand(selec);
                                    while (ress.next()) {
                                %>
                                        <option value="<%=ress.getString("semester_id")%>"<%if (sid.equals(ress.getString("semester_id"))) {
                                        out.println("selected");
                                    }%>><%=ress.getString("semester_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label>Subject</label></td>
                    <td>
                        <div class="custom-select" style="width:200px;">
                            <select name="slctsub" id="subject"  >
                                <option value="">--select--</option>

                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave"  class="btn btn-primary ms-2" value="SAVE">
                        <input type="reset" name="reset" class="btn btn-primary ms-2" value="RESET"
                    </td>
                </tr>
            </table>
            <br>
            <iframe style="border: none; border-radius: 15px; width: 100%; height: 710px ;" src = "TimeTableFrame.jsp" ></iframe>
            




        </form>
 <%@include file="Footer.jsp" %>
    </body>
</html>
<script src="../Assets/JQ/jQuery.js"></script>


<script>
                                function getSub(did)
                                {

                                    $.ajax({
                                        url: "../Assets/AjaxPages/AjaxSub.jsp?did=" + did,
                                        success: function(html) {
                                            $("#subject").html(html);
                                        }
                                    });
                                }
</script>
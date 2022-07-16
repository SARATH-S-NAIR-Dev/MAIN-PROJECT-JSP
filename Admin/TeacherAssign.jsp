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
            String tid = "", sid = "", sbid = "", aid = "";
            if (request.getParameter("btnsave") != null) {

                if (!request.getParameter("txthidden").equals("")) {
                    String upd = "update tbl_assign set teacher_id='" + request.getParameter("slctteacher") + "',subject_id='" + request.getParameter("slctsub") + "',assign_date=curdate() where assign_id='" + request.getParameter("txthidden") + "'";
                    con.executeCommand(upd);
                    out.println(upd);

                } else {

                    String insert = "insert into tbl_assign(teacher_id,subject_id,assign_date)values('" + request.getParameter("slctteacher") + "','" + request.getParameter("slctsub") + "',curdate())";
                    con.executeCommand(insert);

        %>


        <script>alert('inserted😍')</script>  

        <%   }
            }

            if (request.getParameter("eid") != null) {
                String sel1 = "select * from tbl_assign a inner join tbl_subject s on s.subject_id=a.subject_id inner join tbl_teacher t on t.teacher_id=a.teacher_id inner join tbl_semester sm on sm.semester_id=s.semester_id where assign_id='" + request.getParameter("eid") + "'";
                ResultSet rsedit = con.selectCommand(sel1);
                rsedit.next();
                tid = rsedit.getString("teacher_id");
                sid = rsedit.getString("semester_id");
                sbid = rsedit.getString("subject_id");
                aid = rsedit.getString("assign_id");
            }
        %>




        <h1 align="center">Assign Teachers!</h1>
        <form>
            <table align="center" border="1" cellpadding="10" style="border-collapse: collapse" class="table text-start align-middle table-bordered table-hover mb-0">
                <input type="hidden" name="txthidden" value="<%=aid%>">


                <tr>
                    <td>Teachers</td>
                    <td>
                        <select name="slctteacher">
                            <option>--select--</option>
                            <%
                                String sel = "select * from tbl_teacher";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("teacher_id")%>" <%if (tid.equals(rs.getString("teacher_id"))) {
                                    out.println("selected");
                                }%>><%=rs.getString("teacher_name")%></option>
                            <%
                                }
                            %>
                        </select>

                    </td>
                </tr>
                <tr>
                    <td style="color: #201e88"><label>Semester</label></td>
                    <td>
                        <div class="custom-select" style="width:200px;">
                            <select name="slctsem" class="select"    onchange="getSub(this.value)">
                                <option>--select--</option>
                                <%
                                    String sele = "select * from tbl_semester";
                                    ResultSet res = con.selectCommand(sele);
                                    while (res.next()) {
                                %>
                                        <option value="<%=res.getString("semester_id")%>"<%if (tid.equals(res.getString("semester_id"))) {
                                        out.println("selected");
                                    }%>><%=res.getString("semester_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="color: #201e88"><label>Subject</label></td>
                    <td>
                        <div class="custom-select" style="width:200px;">
                            <select name="slctsub" id="subject"  >
                                <option>--select--</option>

                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave"  class="btn btn-primary ms-2" value="SAVE">
                        <input type="reset" name="reset"  class="btn btn-primary ms-2" value="RESET"
                    </td>
                </tr>
            </table>
            <br>
            <table align="center" border="1" class="table text-start align-middle table-bordered table-hover mb-0">
                <tr>
                    <td>Si No</td>
                    <td>Teacher Name</td>
                    <td>Semester</td>
                    <td>Subject Assigned</td>
                    <td>Date Assigned</td>
                    <td>Action</td>


                </tr>

                <%
                    String select = "select * from tbl_assign a inner join tbl_teacher t on t.teacher_id=a.teacher_id inner join tbl_subject s on s.subject_id=a.subject_id inner join tbl_semester k on k.semester_id=s.semester_id";
                    ResultSet ress = con.selectCommand(select);
                    int i = 0;
                    while (ress.next()) {
                        i++;
                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=ress.getString("teacher_name")%></td>
                    <td><%=ress.getString("semester_name")%></td>
                    <td><%=ress.getString("subject_name")%></td>
                    <td><%=ress.getString("assign_date")%></td>
                    <td><a href="TeacherAssign.jsp?eid=<%=ress.getString("assign_id")%>">Edit</a></td>
                </tr>
                <%

                    }


                %>
            </table>




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
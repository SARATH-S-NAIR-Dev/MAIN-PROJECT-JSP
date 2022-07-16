<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String selQry = "select * from tbl_chat where peer_id='" + session.getAttribute("pid") + "' order by chat_date_time";
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {
        if (rs.getString("teacher_id").equals("0")) {
            String sel1 = "select * from tbl_student where student_id='" + rs.getString("student_id") + "'";
            ResultSet x = con.selectCommand(sel1);
            if (x.next()) {
%>

<div class="chat-message is-received">
    <img src="../../Assets/Files/StudentPhoto/<%=x.getString("student_photo")%>" alt="">
    <div class="message-block">
        <span><%=x.getString("student_name")%>(Student)</span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px">

</div>   
<%
    }

} else if (rs.getString("teacher_id").equals(session.getAttribute("Teacherid"))) {
    String sel11 = "select * from tbl_teacher where teacher_id='" + rs.getString("teacher_id") + "'";
    ResultSet x1 = con.selectCommand(sel11);
    if (x1.next()) {
%>
<div class="chat-message is-sent">
    <img src="../../Assets/Files/Teacher/TeacherPhoto/<%=x1.getString("teacher_photo")%>" alt="">
    <div class="message-block">
        <span><%=x1.getString("teacher_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>
<%

    }

} else {
    String sel111 = "select * from tbl_teacher where teacher_id='" + rs.getString("teacher_id") + "'";
    ResultSet x11 = con.selectCommand(sel111);
    if (x11.next()) {
%>
<div class="chat-message is-received">
    <img src="../../Assets/Files/Teacher/TeacherPhoto/<%=x11.getString("teacher_photo")%>" alt="">
    <div class="message-block">
        <span><%=x11.getString("teacher_name")%>(Teacher)</span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>
<%

            }

        }
    }
%>
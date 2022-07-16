<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    
    String insQry="insert into tbl_chat(student_id,chat_content,chat_date_time,peer_id) values('"+session.getAttribute("Studentid") +"','"+request.getParameter("chat") +"',DATE_FORMAT(sysdate(), '%M %d %Y, %h:%i %p'),'" + session.getAttribute("pid") + "')";
    if(con.executeCommand(insQry))
    {
        out.println("sended");
    }
    else
    {
        out.println("failed");
        System.out.println(insQry);
    }
    
%>

<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<option>--select--</option>
<%
    String sel="select * from tbl_subject where semester_id='"+request.getParameter("did")+"'";
    ResultSet rs=con.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("subject_id")%>"><%=rs.getString("subject_name")%></option>
        <%
    }
%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%
    
    

    


    
    out.println(request.getAttribute("javax.servlet.forward.request_uri"));

    JSONArray ja=new JSONArray();
    JSONObject job=new JSONObject();
    job.put("user_name", "Sarath");
    ja.put(job);
    out.print(job);

%>
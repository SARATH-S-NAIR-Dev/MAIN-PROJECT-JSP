<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("Studentid") == null)
        {
            response.sendRedirect("../");
        }
    %>
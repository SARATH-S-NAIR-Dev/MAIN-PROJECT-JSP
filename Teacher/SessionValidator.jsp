<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("Teacherid") == null)
        {
            response.sendRedirect("../");
        }
    %>
<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("Adminid") == null)
        {
            response.sendRedirect("../");
        }
    %>
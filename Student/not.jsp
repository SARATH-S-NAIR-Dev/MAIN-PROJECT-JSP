




        <link rel="stylesheet" href="Noti.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <div class = "notification"style="margin-left: -40px">

                
        <a href = "#">
                    <div class = "notBtn" href = "#">
                        <!--Number supports double digets and automaticly hides itself when there is nothing between divs -->
                        <div class = "number">0</div>
                        <i class="fas fa-bell"></i>
                        <div class = "box">
                            <div class = "display">
                                <div class = "nothing"> 
                                    <i class="fas fa-child stick"></i> 
                                    <div class = "cent">Looks Like your all caught up!</div>
                                </div>
                                <div class = "cont"><!-- Fold this div and try deleting evrything inbetween -->
                                    <div class = "sec new">
                                        Notifications
                                    </div>


                                    <%
                                        String select = "select * from tbl_notification";
                                        ResultSet rs = con.selectCommand(select);
                                        int i = 0;
                                        while (rs.next()) {
                                            if (rs.getString("notification_type").equals(session.getAttribute("Type"))) {
                                    %>
                                    <div class = "sec" >
                                        <div class = "txt"><%  out.println(rs.getString("notification_title"));%></div>
                                    </div>
                                    <%
                                        }

                                        if (rs.getString("notification_type").equals("both")) {
                                    %>
                                    <div class = "sec" >
                                        <div class = "txt"><%  out.println(rs.getString("notification_title"));%></div>
                                    </div>
                                    <%
                                            }

                                        }


                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
                                
                                
        </div>
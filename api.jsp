<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    if (request.getParameter("action") != null) {
        if (request.getParameter("action").equals("hai")) {

            out.println("Hello");

        }
        if (request.getParameter("action").equals("login")) {

            String email = request.getParameter("email");
            String pass = request.getParameter("pass");

            JSONObject job = new JSONObject();

            String sel = "select * from tbl_student where student_email='" + email + "' and student_password='" + pass + "'";
            ResultSet rs = con.selectCommand(sel);
            if (rs.next()) {

                job.put("sname", rs.getString("student_name"));
                job.put("sid", rs.getString("student_id"));
                job.put("syear", rs.getString("student_year"));
                job.put("status", true);

                out.print(job);

            } else {
                job.put("status", false);
                out.print(job);
            }

        }
        if (request.getParameter("action").equals("Profile")) {

            String StudId = request.getParameter("StudentId");

            JSONArray ja = new JSONArray();
            JSONObject job = new JSONObject();

            String sel = "select * from tbl_student where student_id='" + StudId + "'";
            ResultSet rm = con.selectCommand(sel);
            if (rm.next()) {

                job.put("sprofile", rm.getString("student_photo"));
                job.put("sid", rm.getString("student_id"));
                job.put("sname", rm.getString("student_name"));
                job.put("semail", rm.getString("student_email"));
                job.put("scontact", rm.getString("student_contact"));
                job.put("sdob", rm.getString("student_dob"));
                job.put("sroll", rm.getString("student_roll"));
                job.put("sreg", rm.getString("student_regno"));
                job.put("saddress", rm.getString("student_address"));

                out.println(job);
            }

        }

        if (request.getParameter("action").equals("AssignNoti")) {

            JSONArray ja = new JSONArray();
            JSONObject job;

            String sel = "select * from tbl_assignnoti a inner join tbl_subject s on s.subject_id=a.subject_id";
            ResultSet rm = con.selectCommand(sel);
            while (rm.next()) {
                job = new JSONObject();
                job.put("title", rm.getString("noti_title"));
                job.put("details", rm.getString("noti_details"));
                job.put("date", rm.getString("noti_date"));
                job.put("subdate", rm.getString("noti_subdate"));
                job.put("subject", rm.getString("subject_name"));

                ja.put(job);

            }
            out.println(ja);
        }

        if (request.getParameter("action").equals("Noti")) {

            JSONArray ja = new JSONArray();
            JSONObject job;

            String sel = "select * from tbl_notification";
            ResultSet rm = con.selectCommand(sel);
            while (rm.next()) {
                job = new JSONObject();
                if (rm.getString("notification_type").equals("student")) {

                    job.put("title", rm.getString("notification_title"));
                    job.put("details", rm.getString("notification_content"));
                    ja.put(job);
                }
                if (rm.getString("notification_type").equals("both")) {

                    job.put("title", rm.getString("notification_title"));
                    job.put("details", rm.getString("notification_content"));
                    ja.put(job);
                }

            }
            out.println(ja);
        }

        if (request.getParameter("action").equals("Peer")) {
            JSONArray ja = new JSONArray();
            JSONObject job;

            String sel = "select * from tbl_peer";
            ResultSet rm = con.selectCommand(sel);
            while (rm.next()) {
                job = new JSONObject();
                if (rm.getString("student_id").equals("0")) {
                    String selT = "select * from tbl_teacher where teacher_id='" + rm.getString("teacher_id") + "'";
                    ResultSet res = con.selectCommand(selT);
                    while (res.next()) {
                        job.put("id", rm.getString("peer_id"));
                        job.put("content", rm.getString("peer_content"));
                        job.put("name", res.getString("teacher_name")+"(Teacher)");
                        ja.put(job);
                    }
                }
                if (rm.getString("teacher_id").equals("0")) {

                    String selS = "select * from tbl_student where student_id='" + rm.getString("student_id") + "'";
                    ResultSet res = con.selectCommand(selS);
                    while (res.next()) {
                        job.put("id", rm.getString("peer_id"));
                        job.put("content", rm.getString("peer_content"));
                        job.put("name", res.getString("student_name")+"(Student)");
                        ja.put(job);
                    }
                }

            }
              out.println(ja);
        }

    }


%>
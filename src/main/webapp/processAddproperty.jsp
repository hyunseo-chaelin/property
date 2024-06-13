<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");

    String realFolder="C:\\Users\\고현서\\workspace_webServer\\property\\src\\main\\webapp\\resources\\images";
    int maxSize=5 * 1024 * 1024;
    String encType="utf-8";

    MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

    String b_id = multi.getParameter("propertyId");
    String b_name = multi.getParameter("name");
    String b_unitPrice = multi.getParameter("unitPrice");
    String b_description = multi.getParameter("description");
    String b_city = multi.getParameter("city");
    String b_district = multi.getParameter("district");
    String b_area = multi.getParameter("area");
    String b_condition = multi.getParameter("condition");
    String b_kind = multi.getParameter("kind");

    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String b_fileName = multi.getFilesystemName(fname);

    PreparedStatement pstmt = null;

    try {
        String sql = "INSERT INTO property (b_id, b_name, b_kind, b_condition, b_unitPrice, b_description, b_city, b_district, b_area, b_fileName) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, b_id);
        pstmt.setString(2, b_name);
        pstmt.setString(3, b_kind);
        pstmt.setString(4, b_condition);
        pstmt.setString(5, b_unitPrice);
        pstmt.setString(6, b_description);
        pstmt.setString(7, b_city);
        pstmt.setString(8, b_district);
        pstmt.setString(9, b_area);
        pstmt.setString(10, b_fileName);

        int result = pstmt.executeUpdate();

        if(result > 0) {
            response.sendRedirect("propertyforsale.jsp");
        } else {
            out.println("Failed to insert data");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("SQLException: " + e.getMessage());
    } finally {
        try {
            if (pstmt != null) pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

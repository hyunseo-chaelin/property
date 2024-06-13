<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");

    String realFolder = "C:\\Users\\rin75\\git\\property\\src\\main\\webapp\\resources\\images";
    int maxSize = 5 * 1024 * 1024;
    String encType = "utf-8";

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

    String b_fileName = null;
    
    Enumeration files = multi.getFileNames();
    if (files.hasMoreElements()) {
        String fname = (String) files.nextElement();
        b_fileName = multi.getFilesystemName(fname);
    }

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Check if property exists
        String sql = "SELECT * FROM property WHERE b_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, b_id);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            if (b_fileName != null) {
                // Update with new file name
                sql = "UPDATE property SET b_name=?, b_kind=?, b_condition=?, b_unitPrice=?, b_description=?, b_city=?, b_district=?, b_area=?, b_fileName=? WHERE b_id=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, b_name);
                pstmt.setString(2, b_kind);
                pstmt.setString(3, b_condition);
                pstmt.setString(4, b_unitPrice);
                pstmt.setString(5, b_description);
                pstmt.setString(6, b_city);
                pstmt.setString(7, b_district);
                pstmt.setString(8, b_area);
                pstmt.setString(9, b_fileName);
                pstmt.setString(10, b_id);
            } else {
                // Update without file name
                sql = "UPDATE property SET b_name=?, b_kind=?, b_condition=?, b_unitPrice=?, b_description=?, b_city=?, b_district=?, b_area=? WHERE b_id=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, b_name);
                pstmt.setString(2, b_kind);
                pstmt.setString(3, b_condition);
                pstmt.setString(4, b_unitPrice);
                pstmt.setString(5, b_description);
                pstmt.setString(6, b_city);
                pstmt.setString(7, b_district);
                pstmt.setString(8, b_area);
                pstmt.setString(9, b_id);
            }
            
            // SQL 쿼리와 파라미터 값 출력
            out.println("Executing SQL: " + sql);
            out.println("Parameters:");
            out.println("b_name: " + b_name);
            out.println("b_kind: " + b_kind);
            out.println("b_condition: " + b_condition);
            out.println("b_unitPrice: " + b_unitPrice);
            out.println("b_description: " + b_description);
            out.println("b_city: " + b_city);
            out.println("b_district: " + b_district);
            out.println("b_area: " + b_area);
            out.println("b_fileName: " + b_fileName);
            out.println("b_id: " + b_id);
            
            pstmt.executeUpdate();
            out.println("Update successful!"); // 성공 메시지 출력
        } else {
            out.println("Property with ID " + b_id + " not found."); // 속성 없음 메시지 출력
        }

        // Redirect after update
        response.sendRedirect("editProperty.jsp?edit=update");
    } catch (SQLException e) {
        out.println("SQL Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>

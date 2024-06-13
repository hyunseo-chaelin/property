<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="dbconn.jsp" %>

<%
    String propertyId = request.getParameter("id");
    if (propertyId == null || propertyId.trim().equals("")) {
        response.sendRedirect("propertyforsale.jsp");
        return;
    }
    String userId = (String) session.getAttribute("sessionId");
    if (userId == null || userId.trim().equals("")) {
        response.sendRedirect("./member/loginMember.jsp?redirect=" + URLEncoder.encode("addBookmark.jsp?id=" + propertyId, "UTF-8"));
        return;
    }
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        String checkSql = "SELECT * FROM bookmarks WHERE user_id = ? AND property_id = ?";
        pstmt = conn.prepareStatement(checkSql);
        pstmt.setString(1, userId);
        pstmt.setString(2, propertyId);
        rs = pstmt.executeQuery();
        if (!rs.next()) {
            String insertSql = "INSERT INTO bookmarks (user_id, property_id) VALUES (?, ?)";
            pstmt = conn.prepareStatement(insertSql);
            pstmt.setString(1, userId);
            pstmt.setString(2, propertyId);
            pstmt.executeUpdate();
        }
        response.sendRedirect("bookmark.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

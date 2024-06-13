<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="dbconn.jsp" %>

<%
    // 요청 매개변수에서 매물 ID 가져오기
    String propertyId = request.getParameter("id");
    if (propertyId == null || propertyId.trim().equals("")) {
        response.sendRedirect("propertyforsale.jsp");
        return;
    }

    // 세션에서 사용자 ID 가져오기
    String userId = (String) session.getAttribute("sessionId");
    if (userId == null || userId.trim().equals("")) {
        // 로그인 페이지로 리다이렉트하고, 로그인 후 다시 돌아올 수 있도록 원래 URL을 파라미터로 전달
        response.sendRedirect("./member/loginMember.jsp?redirect=" + URLEncoder.encode("addBookmark.jsp?id=" + propertyId, "UTF-8"));
        return;
    }

    // 데이터베이스 연결 변수 초기화
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // 북마켓 리스트에 매물이 이미 있는지 확인
        String checkSql = "SELECT * FROM bookmarks WHERE user_id = ? AND property_id = ?";
        pstmt = conn.prepareStatement(checkSql);
        pstmt.setString(1, userId);
        pstmt.setString(2, propertyId);
        rs = pstmt.executeQuery();

        if (!rs.next()) {
            // 매물이 없으면 새 레코드 삽입
            String insertSql = "INSERT INTO bookmarks (user_id, property_id) VALUES (?, ?)";
            pstmt = conn.prepareStatement(insertSql);
            pstmt.setString(1, userId);
            pstmt.setString(2, propertyId);
            pstmt.executeUpdate();
        }

        // 북마켓 페이지로 리다이렉트
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

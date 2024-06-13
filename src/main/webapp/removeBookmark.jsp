<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="dbconn.jsp" %>

<%
    // 요청 매개변수에서 매물 ID 가져오기
    String propertyId = request.getParameter("propertyId");
    if (propertyId == null || propertyId.trim().equals("")) {
        out.println("매물 ID가 설정되지 않았습니다.");  // 디버깅 메시지
        response.sendRedirect("bookmark.jsp");
        return;
    } else {
        out.println("매물 ID: " + propertyId + "<br>");  // 디버깅 메시지
    }

    // 세션에서 사용자 ID 가져오기
    String userId = (String) session.getAttribute("sessionId");
    if (userId == null || userId.trim().equals("")) {
        // 로그인 페이지로 리다이렉트하고, 로그인 후 다시 돌아올 수 있도록 원래 URL을 파라미터로 전달
        String redirectUrl = "./member/loginMember.jsp?redirect=" + URLEncoder.encode("deleteBookmark.jsp?propertyId=" + propertyId, "UTF-8");
        out.println("로그인되지 않음, 리다이렉트 URL: " + redirectUrl + "<br>");  // 디버깅 메시지
        response.sendRedirect(redirectUrl);
        return;
    } else {
        out.println("로그인된 사용자 ID: " + userId + "<br>");  // 디버깅 메시지
    }

    // 데이터베이스 연결 변수 초기화
    PreparedStatement pstmtDelete = null;

    try {
        // 북마크 항목 삭제
        String deleteSql = "DELETE FROM bookmarks WHERE user_id = ? AND property_id = ?";
        pstmtDelete = conn.prepareStatement(deleteSql);
        pstmtDelete.setString(1, userId);
        pstmtDelete.setString(2, propertyId);
        int rowsAffected = pstmtDelete.executeUpdate();
        out.println("북마크 삭제 성공, 삭제된 행 수: " + rowsAffected + "<br>");  // 디버깅 메시지

        // 북마크 페이지로 리다이렉트
        response.sendRedirect("bookmark.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("데이터베이스 오류: " + e.getMessage() + "<br>");  // 디버깅 메시지
    } finally {
        try {
            if (pstmtDelete != null) pstmtDelete.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

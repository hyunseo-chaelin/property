<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="dbconn.jsp" %>

<%

    String propertyId = request.getParameter("propertyId");
    if (propertyId == null || propertyId.trim().equals("")) {
        out.println("매물 ID가 설정되지 않았습니다.");  // 디버깅 메시지
        response.sendRedirect("bookmark.jsp");
        return;
    } else {
        out.println("매물 ID: " + propertyId + "<br>");  // 디버깅 메시지
    }


    String userId = (String) session.getAttribute("sessionId");
    if (userId == null || userId.trim().equals("")) {

        String redirectUrl = "./member/loginMember.jsp?redirect=" + URLEncoder.encode("deleteBookmark.jsp?propertyId=" + propertyId, "UTF-8");
        out.println("로그인되지 않음, 리다이렉트 URL: " + redirectUrl + "<br>");  
        response.sendRedirect(redirectUrl);
        return;
    } else {
        out.println("로그인된 사용자 ID: " + userId + "<br>");  
    }


    PreparedStatement pstmtDelete = null;

    try {

        String deleteSql = "DELETE FROM bookmarks WHERE user_id = ? AND property_id = ?";
        pstmtDelete = conn.prepareStatement(deleteSql);
        pstmtDelete.setString(1, userId);
        pstmtDelete.setString(2, propertyId);
        int rowsAffected = pstmtDelete.executeUpdate();
        out.println("북마크 삭제 성공, 삭제된 행 수: " + rowsAffected + "<br>");  // 디버깅 메시지


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

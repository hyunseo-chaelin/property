<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../dbconn.jsp" %>
<%
    String userId = request.getParameter("id");
    boolean isDuplicate = false;

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql = "SELECT COUNT(*) FROM MEMBER WHERE ID = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        if (rs.next() && rs.getInt(1) > 0) {
            isDuplicate = true;
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }

    response.setContentType("text/plain");
    response.getWriter().write(isDuplicate ? "duplicate" : "available");
%>

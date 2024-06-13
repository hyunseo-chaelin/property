<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="menu.jsp" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<!doctype html>
<html lang="ko" data-bs-theme="auto">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>BookMark</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <!-- Bootstrap CSS 파일 포함 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body>
    <main>
        <section class="py-3 text-center container">
            <div class="row py-lg-3">
                <div class="col-lg-6 col-md-8 mx-auto">
                    <h1 class="fw-light">찜한 매물</h1>
                </div>
            </div>

            <div class="row align-items-md-stretch">
                <div class="row">
                    <table width="100%">
                    </table>
                </div>
            </div>
        </section>

        <div class="album py-5 bg-body-tertiary">
            <div class="container">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                    <%
                        String userId = (String) session.getAttribute("sessionId");
                        if (userId == null || userId.trim().equals("")) {
                            response.sendRedirect("loginMember.jsp");
                            return;
                        }

                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        try {
                            String sql = "SELECT p.* FROM bookmarks b JOIN property p ON b.property_id = p.b_id WHERE b.user_id = ?";
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, userId);
                            rs = pstmt.executeQuery();

                            while (rs.next()) {
                                String bId = rs.getString("b_id");
                                String bName = rs.getString("b_name");
                                String bDescription = rs.getString("b_description");
                                String bFilename = rs.getString("b_filename");
                    %>
                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="./resources/images/<%= bFilename %>" class="card-img-top" alt="Property Image" width="100%" height="400">
                            <div class="card-body">
                                <p class="card-text"><%= bDescription %></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <a href="./propertydetail.jsp?id=<%= bId %>" class="btn btn-sm btn-outline-secondary">자세히 보기 &raquo;</a>
                                    </div>
                                    <a href="./removeBookmark.jsp?propertyId=<%= bId %>" class="btn btn-sm btn-outline-danger">삭제하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                            }
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
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>

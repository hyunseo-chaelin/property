<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="menu.jsp" %>
<%@ include file="dbconn.jsp" %>

<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<head>

    <title>Detail</title>
    
    <script type="text/javascript">
        function addToBookmark(propertyId) {
            if (confirm("찜한 매물에 추가하시겠습니까?")) {
                if (confirm("찜한 매물 페이지로 이동하시겠습니까?")) {
                    window.location.href = "addBookmark.jsp?id=" + propertyId;
                } else {
                    document.addForm.reset();
                }
            }
        }
    </script>
    

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    

    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    

    <link href="css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        .form-group {
            display: flex;
            align-items: center;
        }
        select {
            border-radius: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            font-size: 16px;
            appearance: none; /* 브라우저 기본 스타일 제거 */
            -webkit-appearance: none;
            -moz-appearance: none;
            margin-right: 10px;
            width: 200px; /* 선택 상자의 너비를 넓힘 */
        }
        select:focus {
            outline: none;
            border-color: #007bff;
        }
        .price {
            font-size: 18px;
            font-weight: bold;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<%
    String id = request.getParameter("id");

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        String sql = "SELECT * FROM property WHERE b_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if (rs.next()) {
%>
<!-- Product section -->
<section class="py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-5">
                <img class="card-img-top mb-5 mb-md-0" src="./resources/images/<%= rs.getString("b_fileName") %>" alt="<%= rs.getString("b_name") %>" />
            </div>
            <div class="col-md-6">
                <span class="px-2 py-1"><%= rs.getString("b_district") %></span>
                <h1 class="display-5 fw-bolder"><%= rs.getString("b_name") %></h1>
                <div class="fs-5 mb-5">
                    <div class="form-group">
                        <span class="condition" id="condition"><%= rs.getString("b_condition") %></span>
                        <span class="price" id="price"><%= rs.getString("b_unitPrice") %></span>
                    </div>
                </div>
                <p class="lead"><%= rs.getString("b_description") %></p>
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="d-flex">
                                <form name="addForm" action="./addBookmark.jsp?id=<%= rs.getString("b_id") %>" method="post">
                                    <a href="./propertyforsale.jsp?id=<%= rs.getString("b_id") %>" class="btn btn-sm btn-outline-secondary me-2" style="font-size: 16px;">매물 목록 &raquo;</a>                
                                    <a href="javascript:void(0);" class="btn btn-sm btn-outline-dark" onclick="addToBookmark('<%= rs.getString("b_id") %>')">
                                        <i class="fa fa-heart" style="color: red;"></i> 찜하기
                                    </a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%
        } else {
            out.println("No property found with the given ID.");
        }
    } catch (SQLException e) {
        out.println("SQL Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>

<jsp:include page="footer.jsp" />

<!-- Bootstrap core JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS -->
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</body>
</html>

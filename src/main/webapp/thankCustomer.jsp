<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="menu.jsp"%>
<html lang="ko" data-bs-theme="auto">
<head>
    <title>주문 완료</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container py-4">
        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold">결제 완료</h1>
                <p class="cil-md-8 fs-4">Payment Completed</p>
            </div>
        </div>
        <div class="row align-items-md-stretch">
            <div class="col-md-12">
                <h2 class="alert alert-danger">감사합니다.</h2>
            </div>
        </div>
        <div class="container">
            <p> <a href="./propertyforsale.jsp" class="btn btn-secondary"> &laquo;매물 목록</a>
        </div>
        <%@ include file="footer.jsp" %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

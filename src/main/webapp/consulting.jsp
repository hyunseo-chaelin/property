<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="menu.jsp" %>
<html lang="ko" data-bs-theme="auto">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Consulting</title>
    <style>
        .section-title {
            margin-top: 40px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body class="bg-body-tertiary">
    <div class="container">
        <form action="./processConsulting.jsp" class="form-horizontal" method="post">
            <div class="py-5 text-center">
                <h2>컨설팅 신청</h2>
            </div>
            <div class="row my-3">
                <p>* 컨설팅 신청 비용은 50,000원 입니다.
                <p>* 컨설팅 신청 후 정확한 금액 상담 도와드리겠습니다. 
            </div>
            <div class="row my-3">
                <div class="mb-3">
                    <label for="name" class="form-label">이름</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
            </div>
            <div class="row my-3">
                <label for="phone1" class="form-label">연락처<span class="text-body-secondary"></span></label>
                <div class="col-md-4">
                    <select class="form-select" id="num1" name="phone1" required>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="019">019</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <input type="text" maxlength="4" size="4" name="phone2" class="form-control" id="num2" required>
                </div>
                <div class="col-md-4">
                    <input type="text" maxlength="4" size="4" name="phone3" class="form-control" id="num3" required>
                </div>
            </div>
            <div class="row my-3">
                <div class="mb-3">
                    <label for="investmentGoal" class="form-label">투자 목적 및 목표</label>
                    <input type="text" class="form-control" id="investmentGoal" name="investmentGoal" required>
                </div>
            </div>
            <div class="row my-3">
                <div class="mb-3">
                    <label for="budget" class="form-label">예산</label>
                    <input type="text" class="form-control" id="budget" name="budget" required>
                </div>
            </div>
            <div class="row my-3">    
                <div class="mb-3">
                    <label for="additionalRequests" class="form-label">기타 요청 사항</label>
                    <textarea class="form-control" id="additionalRequests" name="additionalRequests" rows="4"></textarea>
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary flex-fill">신청하기</button>
            </div>
        </form>
    </div>
    <jsp:include page="footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>

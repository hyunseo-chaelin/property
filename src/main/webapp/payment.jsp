<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="menu.jsp"%>
<html lang="ko" data-bs-theme="auto">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>결제 페이지</title>
</head>
<body class="bg-body-tertiary">
    <div class="container">
    	<div class="py-5 text-center">
        	<h2>결제 페이지</h2>
        </div>

        <div class="card mb-4">
            <div class="card-body">
            	<div class="text-center">
                	<h5 class="card-title"><strong>결제 정보를 확인해주세요</strong></h5>
                </div>
                <p class="card-text-center">
                    이름: <%= request.getParameter("name") %><br>
                    연락처: <%= request.getParameter("phone") %><br>
                    투자 목적 및 목표: <%= request.getParameter("investmentGoal") %><br>
                    예산: <%= request.getParameter("budget") %><br>
                    기타 요청 사항: <%= request.getParameter("additionalRequests") %><br>
                </p>
                <form action="processPayment.jsp" method="post">
                    <input type="hidden" name="name" value="<%= request.getParameter("name") %>">
                    <input type="hidden" name="phone" value="<%= request.getParameter("phone") %>">
                    <input type="hidden" name="investmentGoal" value="<%= request.getParameter("investmentGoal") %>">
                    <input type="hidden" name="budget" value="<%= request.getParameter("budget") %>">
                    <input type="hidden" name="additionalRequests" value="<%= request.getParameter("additionalRequests") %>">
                </form>
                <div class="text-center">
                	<p>최종 결제 금액 : 50,000원
            	</div>
                <div class="text-center">
    				<a href="thankCustomer.jsp" class="btn btn-primary flex-fill">결제하기</a>
				</div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>

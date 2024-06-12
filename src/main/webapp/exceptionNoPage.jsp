<%@ page contentType="text/html; charset=utf-8"%>
<html lang="ko" data-bs-theme="auto">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>페이지 오류</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<div class  ="container py-4">
   	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h1>
		</div>
	</div>

	<div class="row align-items-md-stretch ">
		<div class="col-md-12">
			<div class="h-100 p-5">
				<p><%=request.getRequestURL()%></p>
           		<p><a href="propertyforsale.jsp" class="btn btn-secondary"> 매물 목록 &raquo;</a>    
			</div>
		</div>
		<%@include file="footer.jsp" %>
	</div>
</div>
</body>
</html>
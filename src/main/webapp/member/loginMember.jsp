<%@ page contentType="text/html; charset=utf-8"%>
<html lang="ko" data-bs-theme="auto">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>LoginMember</title>
</head>
<body>
<jsp:include page="/menu.jsp" />
	<div class="container py-4">
 	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">회원 로그인</h1>
        <p class="col-md-8 fs-4">Membership Login</p>      
      </div>
    </div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">로그인 해주세요.</h3>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
  			<form class="form-signin" action="processLoginMember.jsp" method="post">
  
    			<div class="form-floating mb-3 row">     
      				<input type="text" class="form-control" name='id' id="floatingInput" placeholder="ID" required autofocus>
      				<label for="floatingInput">아이디</label>      
    			</div>
    			<div class="form-floating  mb-3 row">     
     	 			<input type="password" class="form-control" name='password' placeholder="Password">
    				 <label for="floatingPassword">비밀번호</label>
				</div>
  				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>			
  			</form>
		</div>
	</div>
	<jsp:include page="/footer.jsp" />  
  </div>	
  </body>			
</html>
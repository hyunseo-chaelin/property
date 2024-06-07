<%@ page contentType="text/html; charset=utf-8"%>
<html lang="ko" data-bs-theme="auto">
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.0/color-modes.js"></script>
<title>Login</title>
</head>
<body>
 <%@ include file="menu.jsp" %>
<div class="container py-4">
    <div class="row align-items-md-stretch text-center ">
      <div class="row justify-content-center align-items-center ">
        <div class="h-100 p-5 col-md-6" style="margin-top: 60px;">
            <h3>로그인 해주세요</h3>    
            <%
            String error=request.getParameter("error");
            if(error!=null){
               out.println("<div class='alert alert-danger'>");
               out.println("아이디와 비밀번호를 확인해 주세요");
               out.println("</div>");
            }
            %>
             <form class="form-signin" action="j_security_check" method="post">
             <div class="form-floating  mb-3 row">     
                  <input type="text"  class="form-control" name='j_username' required autofocus>
                  <label for="floatingInput">아이디</label>      
             </div>
             <div class="form-floating  mb-3 row">      
                  <input type="password" class="form-control" name='j_password' >
                <label for="floatingInput">비밀번호</label>
             </div>
             <div class="form-check text-start my-3">
                   <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
                   <label class="form-check-label" for="flexCheckDefault">
                     로그인 정보 기억하기
                   </label>
              </div>  
              <button class="btn btn-lg btn-success" type="submit">로그인</button>
           </form>
         </div>  
       </div>   
    </div> 
      
    <%@ include file="footer.jsp" %>
  </div>
  </body>         
</html>
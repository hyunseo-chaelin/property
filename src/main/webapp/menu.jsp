<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<html lang="ko" data-bs-theme="auto">
<head>
    <script src="/docs/5.3/assets/js/color-modes.js"></script>
    <meta charset="utf-8">
    <title>main</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#712cf9">

    <style>
    .bd-placeholder-img {
        font-size: 18px; /* 고정 크기 사용 */
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
    }

    .nav-scroller {
        position: relative;
        z-index: 2;
        height: 44px; /* 고정 높이 사용 */
        overflow-y: hidden;
    }

    .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 0;
        margin-top: 0;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
    }

    .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;
        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: #495057;
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
    }

    .navbar-nav .nav-link {
        margin-right: 1rem;
    }

    .navbar-brand img {
        height: 60px; /* 이미지 높이를 60px로 조정 */
        margin-right: 10px;
        object-fit: cover; /* 이미지를 비율에 맞게 자름 */
    }

    .navbar {
        height: 60px; /* 네비게이션 바 높이를 조정 */
        display: flex;
        align-items: center; /* 세로 중앙 정렬 */
    }

    .navbar-nav {
        display: flex;
        align-items: center; /* 세로 중앙 정렬 */
    }

    .offcanvas-header {
        height: 60px; /* 오프캔버스 헤더 높이 조정 */
    }

    .navbar-brand {
        display: flex;
        align-items: center;
    }

    .navbar-toggler {
        display: flex;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center;
    }

    .container-fluid {
        display: flex;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: space-between; /* 요소들을 양쪽 끝으로 배치 */
    }
    </style>
    
    <!-- Custom styles for this template -->
    <link href="product.css" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-expand-md sticky-top border-bottom" style="background-color: #adb5bd;">
      <div class="container-fluid">
        <a class="navbar-brand" href="main.jsp">
          <img src="<%= request.getContextPath() %>/resources/images/image2.png" alt="Logo">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">메뉴</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">                  
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/info.jsp"/>">소개</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/propertyforsale.jsp"/>">매물 목록</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/bookmark.jsp"/>">찜한 매물</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/addProperty.jsp"/>">매물 등록</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/editProperty.jsp?edit=update"/>">매물 수정</a></li>
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/consulting.jsp"/>">컨설팅</a></li>               
                    </ul>
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <c:choose>
                    	<c:when test="${empty sessionId}">
                        	<li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인</a></li>
                        	<li class="nav-item"><a class="nav-link" href="<c:url value="/member/addMember.jsp" />">회원가입</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>	
                    		<li class="nav-item"><a class="nav-link" href='<c:url value="/member/logoutMember.jsp"/>'>로그 아웃</a></li>
                        	<li class="nav-item"><a class="nav-link" href='<c:url value="/member/updateMember.jsp" />'>회원 수정</a></li>
                    	</c:otherwise>
                    </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>

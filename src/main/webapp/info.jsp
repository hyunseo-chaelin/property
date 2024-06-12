<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="menu.jsp" %>
<html lang="ko" data-bs-theme="auto">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>소개 페이지</title>
    <style>
        .section-title {
            margin-top: 40px;
            margin-bottom: 20px;
        }
        .ceo-image {
            max-width: 20%;
            height: auto;
            margin-bottom: 20px;
        }
    </style>
</head>
<body class="bg-body-tertiary">
    <div class="container mt-4">
        <!-- 대표 소개 섹션 -->
        <div id="ceo-introduction">
            <h2 class="section-title">대표/공인중개사 소개</h2>
            <img src="<%= request.getContextPath() %>/resources/images/info_ceo.png" alt="대표 소개 이미지" class="ceo-image">
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title"><strong>고준석</strong></h5>
                    <p class="card-text">
                        <p>📱 010-XXXX-XXXX</p>
                        <p>📞 031-XXX-XXXX</p>
                        <p>📧 cmostech@naver.com</p>
                        <br />
                        <p> &lt;대표의 한 마디&gt;
                        <p> 안녕하세요 공인중개사 고준석입니다.
                        <p> 번잡한 도시를 벗어나 양평 전원의 정취를 느낄 전원주택을 원하신다면,
                        <p> 남한강 뷰를 시원하게 누릴 아파트를 찾으신다면 바로 연락 주세요~
                        <p> 다세대/다가구, 상가, 토지 등 언제든 상담 가능 :D
                    </p>
                </div>
            </div>
        </div>
        
        <!-- 사무실 소개 섹션 -->
        <div id="office-introduction">
            <h2 class="section-title">사무실 소개</h2>
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">사무실 위치 및 정보</h5>
                    <p class="card-text">
                        사무실의 위치, 연락처, 주요 업무 등을 여기에 작성합니다.
                    </p>
                </div>
            </div>
        </div>

        <!-- 길 안내 섹션 -->
        <div id="directions">
            <h2 class="section-title">길 안내</h2>
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">방문 방법</h5>
                    <p class="card-text">
                        사무실로 오는 방법을 설명합니다. 대중교통, 자동차 등 다양한 경로를 안내합니다.
                    </p>
                    <!-- 예시로 지도 삽입 -->
                    <div id="map" style="width: 100%; height: 300px; background-color: #eee;">
                        <!-- 여기에는 실제 지도를 삽입할 수 있습니다. 예: 구글 지도 API -->
                        <p class="text-center">지도는 여기에 표시됩니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>

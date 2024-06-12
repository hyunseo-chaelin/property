<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="menu.jsp" %>
<html lang="ko" data-bs-theme="auto">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Info</title>
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
        .office-images img {
            width: 100%;
            height: 300px; /* 고정된 높이 설정 */
            object-fit: cover; /* 이미지를 비율에 맞게 조정 */
            margin-bottom: 15px;
        }
        #map {
            width: 100%;
            height: 500px;
            background-color: #eee;
        }
    </style>
</head>
<body class="bg-body-tertiary">
    <div class="container mt-4">
        <!-- 대표 소개 섹션 -->
        <div id="ceo-introduction">
            <h3 class="section-title">○ 대표/공인중개사 소개</h3>
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
            <h3 class="section-title">○ 사무실 소개</h3>
            <div class="card mb-4">
                <div class="card-body">
                    <!-- 사진 삽입 -->
                     <div class="row office-images">
                        <div class="col-md-4">
                            <img src="<%= request.getContextPath() %>/resources/images/office1.jpg" alt="사무실 이미지 1">
                        </div>
                        <div class="col-md-4">
                            <img src="<%= request.getContextPath() %>/resources/images/office2.jpg" alt="사무실 이미지 2">
                        </div>
                        <div class="col-md-4">
                            <img src="<%= request.getContextPath() %>/resources/images/office3.jpg" alt="사무실 이미지 3">
                        </div>
                    </div>
                    <p class="card-text">
                    	<br />
                    	- 2022년 1월 개업 
                    	<br />
                        - 남한강 뷰 양평휴먼빌리버파크 아파트 입구 상가 위치 
                        <br />
                        - 대기 시 착석 가능한 의자 구비 
                        <br />
                        - 상담 시 커피 및 간식 제공
                    </p>
                </div>
            </div>
        </div>

        <!-- 길 안내 섹션 -->
        <div id="directions">
            <h3 class="section-title">○ 길 안내</h3>
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">주소: 12562 경기도 양평군 양평읍 양군로 310(창대리 696-2)</h5>
                    <a href="https://map.naver.com/p/entry/place/1423129319?placePath=%2Fhome&c=15.00,0,0,0,dh" target="_blank">네이버 지도로 이동</a>
                    <br />
                    <br />
                    <div id="map"></div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <!-- 구글 지도 API 스크립트 -->
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhqDTkMRZbBl9jfLs57nSxJo2OO7cJVR0&callback=initMap"></script>
    <script>
        function initMap() {
            var officeLocation = { lat: 37.493378, lng: 127.493594 }; // 네이버 지도에서 얻은 좌표
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15,
                center: officeLocation
            });
            var marker = new google.maps.Marker({
                position: officeLocation,
                map: map
            });
        }
    </script>
    <jsp:include page="footer.jsp" />
</body>
</html>

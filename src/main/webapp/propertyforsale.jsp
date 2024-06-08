<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import='java.util.*' %>
<%@ page import="dto.Property" %>
<%@ page import="dao.PropertyRepository" %>
<jsp:useBean id="propertyDAO" class="dao.PropertyRepository" scope="session" />
<%@ include file="menu.jsp" %>

<!doctype html>
<html lang="ko" data-bs-theme="auto">
<head>
    <script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title>Propertyforsale</title>
    
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#712cf9">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            width: 100%;
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
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
            --bs-btn-bg: var(--bd-violet-bg);
            --bs-btn-border-color: var(--bd-violet-bg);
            --bs-btn-hover-color: var(--bs-white);
            --bs-btn-hover-bg: #6528e0;
            --bs-btn-hover-border-color: #6528e0;
            --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
            --bs-btn-active-color: var(--bs-btn-hover-color);
            --bs-btn-active-bg: #5a23c8;
            --bs-btn-active-border-color: #5a23c8;
        }

        .bd-mode-toggle {
            z-index: 1500;
        }

        .bd-mode-toggle .dropdown-menu .active .bi {
            display: block !important;
        }

        .border-left {
            border-left: 1px solid #ccc;
        }
        
        .transparent-box {
  background-color: rgba(255, 255, 255, 0.5); /* 투명한 배경색 */
  border-color: rgba(0, 0, 0, 0.1); /* 연한 테두리 */
  border-width: 2px; /* 테두리 굵기 */
} /* 면적 네모칸 */
        
    </style>
</head>
<body>
    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
        <symbol id="check2" viewBox="0 0 16 16">
            <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
        </symbol>
        <symbol id="circle-half" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"/>
        </symbol>
        <symbol id="moon-stars-fill" viewBox="0 0 16 16">
            <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"/>
            <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
        </symbol>
        <symbol id="sun-fill" viewBox="0 0 16 16">
            <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
        </symbol>
    </svg>

    <div class="container">
        <div class="row my-3">
            <form class="d-flex" method="get" action="propertyforsale.jsp">
                <select class="form-select me-2" id="city" name="city" required onchange="updateDistricts()">
                    <option value="">시/도 선택</option>
                    <option value="seoul">서울시</option>
                    <option value="gyeonggi">경기도</option>
                </select>
                <select class="form-select me-2" id="district" name="district" required>
                    <option value="">구/군 선택</option>
                </select>
                <button type="submit" class="btn btn-sm btn-outline-secondary">필터링</button>
            </form>
        </div>
    </div>

    <script>
        const districts = {
        		seoul: [
        		    { value: "강남구", text: "강남구" },
        		    { value: "강동구", text: "강동구" },
        		    { value: "강북구", text: "강북구" },
        		    { value: "강서구", text: "강서구" },
        		    { value: "관악구", text: "관악구" },
        		    { value: "광진구", text: "광진구" },
        		    { value: "구로구", text: "구로구" },
        		    { value: "금천구", text: "금천구" },
        		    { value: "노원구", text: "노원구" },
        		    { value: "도봉구", text: "도봉구" },
        		    { value: "동대문구", text: "동대문구" },
        		    { value: "동작구", text: "동작구" },
        		    { value: "마포구", text: "마포구" },
        		    { value: "서대문구", text: "서대문구" },
        		    { value: "서초구", text: "서초구" },
        		    { value: "성동구", text: "성동구" },
        		    { value: "성북구", text: "성북구" },
        		    { value: "송파구", text: "송파구" },
        		    { value: "양천구", text: "양천구" },
        		    { value: "영등포구", text: "영등포구" },
        		    { value: "용산구", text: "용산구" },
        		    { value: "은평구", text: "은평구" },
        		    { value: "종로구", text: "종로구" },
        		    { value: "중구", text: "중구" },
        		    { value: "중랑구", text: "중랑구" }
        		],
        		gyeonggi: [
        		    { value: "가평군", text: "가평군" },
        		    { value: "고양시 덕양구", text: "고양시 덕양구" },
        		    { value: "고양시 일산동구", text: "고양시 일산동구" },
        		    { value: "고양시 일산서구", text: "고양시 일산서구" },
        		    { value: "과천시", text: "과천시" },
        		    { value: "광명시", text: "광명시" },
        		    { value: "광주시", text: "광주시" },
        		    { value: "구리시", text: "구리시" },
        		    { value: "군포시", text: "군포시" },
        		    { value: "김포시", text: "김포시" },
        		    { value: "남양주시", text: "남양주시" },
        		    { value: "동두천시", text: "동두천시" },
        		    { value: "부천시 소사구", text: "부천시 소사구" },
        		    { value: "부천시 원미구", text: "부천시 원미구" },
        		    { value: "부천시 오정구", text: "부천시 오정구" },
        		    { value: "성남시 분당구", text: "성남시 분당구" },
        		    { value: "성남시 수정구", text: "성남시 수정구" },
        		    { value: "성남시 중원구", text: "성남시 중원구" },
        		    { value: "수원시 권선구", text: "수원시 권선구" },
        		    { value: "수원시 영통구", text: "수원시 영통구" },
        		    { value: "수원시 장안구", text: "수원시 장안구" },
        		    { value: "수원시 팔달구", text: "수원시 팔달구" },
        		    { value: "시흥시", text: "시흥시" },
        		    { value: "안산시 단원구", text: "안산시 단원구" },
        		    { value: "안산시 상록구", text: "안산시 상록구" },
        		    { value: "안성시", text: "안성시" },
        		    { value: "안양시 동안구", text: "안양시 동안구" },
        		    { value: "안양시 만안구", text: "안양시 만안구" },
        		    { value: "양주시", text: "양주시" },
        		    { value: "양평군", text: "양평군" },
        		    { value: "여주시", text: "여주시" },
        		    { value: "연천군", text: "연천군" },
        		    { value: "오산시", text: "오산시" },
        		    { value: "용인시 기흥구", text: "용인시 기흥구" },
        		    { value: "용인시 수지구", text: "용인시 수지구" },
        		    { value: "용인시 처인구", text: "용인시 처인구" },
        		    { value: "의왕시", text: "의왕시" },
        		    { value: "의정부시", text: "의정부시" },
        		    { value: "이천시", text: "이천시" },
        		    { value: "파주시", text: "파주시" },
        		    { value: "평택시", text: "평택시" },
        		    { value: "포천시", text: "포천시" },
        		    { value: "하남시", text: "하남시" },
        		    { value: "화성시", text: "화성시" }
        		]


        };

        function updateDistricts() {
            const city = document.getElementById('city').value;
            const districtSelect = document.getElementById('district');

            // 기존 옵션 삭제
            districtSelect.innerHTML = '<option value="">구/군 선택</option>';

            // 새로운 옵션 추가
            if (city && districts[city]) {
                districts[city].forEach(district => {
                    const option = document.createElement('option');
                    option.value = district.value;
                    option.text = district.text;
                    districtSelect.add(option);
                });
            }
        }
    </script>

    <div class="album py-5 bg-body-tertiary">
        <div class="container">
            <div class="row">
                <%
                String city = request.getParameter("city");
                String district = request.getParameter("district");
                List<Property> listOfproperty = propertyDAO.getFilteredProperty(city, district);

                if (listOfproperty != null && !listOfproperty.isEmpty()) {
                    for (Property property : listOfproperty) {
                %>
                <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                    <div class="card mb-4 shadow-sm">
                        <img src="<%= request.getContextPath() %>/resources/images/<%=property.getFilename() %>" class="card-img-top" alt="<%= property.getName() %>"/>
                        <div class="card-body">
						<h5 class="card-title">
  						<span style="font-size: 0.8em;"><%= property.getName() %></span><br>
  						<b><%= property.getCondition() %></b>
  						<b><%= property.getUnitPrice() %></b>
						</h5>
                            <p class="card-text"><%= property.getDescription() %></p>
							<p class="card-text">
  							<span class="transparent-box px-2 py-1 border rounded"><%= property.getDistrict() %></span>
  							<span class="transparent-box px-2 py-1 border rounded"><%= property.getArea() %>㎡</span>
							</p>


                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="./propertydetail.jsp?id=<%= property.getPropertyID() %>" class="btn btn-sm btn-outline-secondary">자세히 보기 &raquo;</a>
                                </div>
							<a href="<%= request.getContextPath() %>/bookmark.jsp?id=<%= property.getPropertyID() %>" class="btn btn-sm btn-outline-dark" type="button">
                  			<i class="fa fa-heart" style="color: red;"></i> 찜하기
                			</a>
                            </div>
                        </div>
                    </div>
                </div>
                <% 
                    }
                } else { 
                %>
                <p>찾으시는 지역에서 나온 매물이 없습니다</p>
                <% 
                } 
                %>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <!-- Bootstrap JS -->
    <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>

<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="menu.jsp" %>
<%@ include file="dbconn.jsp" %>
<html lang="ko" data-bs-theme="auto">
<head>
    <title>Edit</title>
    <%
        String edit = request.getParameter("edit");
    %>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
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
            background-color: rgba(255, 255, 255, 0.5);
            border-color: rgba(0, 0, 0, 0.1);
            border-width: 2px; 
        }

        .fixed-size-img {
            max-width: 300px;
            max-height: 300px;
            width: auto;
            height: auto;
        }
        
    </style>
</head>
<body>
    <div class="container">
        <div class="row my-3">
            <form class="d-flex" method="get" action="propertyforsale.jsp">
                <select class="form-select me-2" id="city" name="city" required onchange="updateDistricts()">
                    <option value="">시/도 선택</option>
                    <option value="서울시">서울시</option>
                    <option value="경기도">경기도</option>
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
            "서울시": [
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
            "경기도": [
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

            districtSelect.innerHTML = '<option value="">구/군 선택</option>';

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
			    PreparedStatement pstmt = null;
			    ResultSet rs = null;
			
			    try {
			        String city = request.getParameter("city");
			        String district = request.getParameter("district");
			        String sql = "";
			
			        if (city != null && district != null && !city.isEmpty() && !district.isEmpty()) {
			            sql = "SELECT * FROM property WHERE b_city = ? AND b_district = ?";
			            pstmt = conn.prepareStatement(sql);
			            pstmt.setString(1, city);
			            pstmt.setString(2, district);
			        } else {
			            sql = "SELECT * FROM property";
			            pstmt = conn.prepareStatement(sql);
			        }
			
			        rs = pstmt.executeQuery();
			
			        if (rs != null && rs.next()) {
			            do {
			%>
		    <div class="col-12 col-sm-6 col-md-4 col-lg-3">
		        <div class="card mb-4 shadow-sm">
		            <img src="<%= request.getContextPath() %>/resources/images/<%= rs.getString("b_fileName") %>" class="card-img-top fixed-size-img" alt="<%= rs.getString("b_name") %>"/>
		
		            <div class="card-body">
		                <h5 class="card-title">
		                    <span style="font-size: 0.8em;"><%= rs.getString("b_condition") %> <%= rs.getString("b_unitPrice") %></span><br>
		                    <b><%= rs.getString("b_name") %></b>
		                </h5>
		                <p class="card-text"><%= rs.getString("b_description").substring(0,60) %>...</p>
		                <p class="card-text">
		                    <span class="transparent-box px-2 py-1 border rounded"><%= rs.getString("b_district") %></span>
		                    <span class="transparent-box px-2 py-1 border rounded"><%= rs.getString("b_area") %>㎡</span>
		                </p>
		                
		                <%
		                    if (edit.equals("update")) {
		                %>
		                <div class="d-flex justify-content-between align-items-center">
		                    <div class="btn-group">
		                    </div>
		                    <a href="./updateProperty.jsp?id=<%=rs.getString("b_id")%>" class="btn btn-sm btn-outline-dark" role="button"> 수정 &raquo;</a>
		                </div>
		                <%
		                    }
		                %>
		            </div>
		        </div>
		    </div>
			<%
			            } while (rs.next());
			        } else {
			%>
			    <p>찾으시는 지역에서 나온 매물이 없습니다</p>
			<%
			        }
			    } catch (SQLException e) {
			        e.printStackTrace();
			        out.println("<p>데이터베이스 오류가 발생했습니다.</p>");
			    } finally {
			        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
			        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
			        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
			    }
			%>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>

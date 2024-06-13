<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="menu.jsp" %>
<%@ include file="dbconn.jsp" %>

<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Detail</title>
    
    <script>
    const districts = {
        서울시: [
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
        경기도: [
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

    window.onload = function() {
        const district = '<%= b_district.replace("\\", "\\\\").replace("\'", "\\\'").replace("\"", "\\\"") %>';
        updateDistricts(district);
    }

    function updateDistricts(selectedDistrict) {
        const city = document.getElementById('city').value;
        const districtSelect = document.getElementById('district');

        districtSelect.innerHTML = '<option value="">구/군 선택</option>';

        if (city && districts[city]) {
            districts[city].forEach(district => {
                const option = document.createElement('option');
                option.value = district.value;
                option.text = district.text;
                if (district.value === selectedDistrict) {
                    option.selected = true;
                }
                districtSelect.add(option);
            });
        }
    }
    </script>
    
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    
    <link href="css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        .form-group {
            display: flex;
            align-items: center;
        }
        select {
            border-radius: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            font-size: 16px;
            appearance: none; /* 브라우저 기본 스타일 제거 */
            -webkit-appearance: none;
            -moz-appearance: none;
            margin-right: 10px;
            width: 200px; /* 선택 상자의 너비를 넓힘 */
        }
        select:focus {
            outline: none;
            border-color: #007bff;
        }
        .price {
            font-size: 18px;
            font-weight: bold;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<%
    String id = request.getParameter("id");

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        String sql = "SELECT * FROM property WHERE b_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            String city = rs.getString("b_city");
            String district = rs.getString("b_district");
%>


<section class="py-5">
    <div class="container px-4 px-lg-5 my-5">
        <form name="newProperty" action="./processUpdateProperty.jsp" method="post" enctype="multipart/form-data">
        <input type="hidden" name="propertyId" value="<%= id %>">
        
            <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-5">
                    <img class="card-img-top mb-5 mb-md-0" src="./resources/images/<%= rs.getString("b_fileName") %>" alt="<%= rs.getString("b_name") %>" />
                </div>
          <div class="col-md-6">
    <div class="row g-3 mb-3">
        <div class="col-12">
            <label for="cityselect" class="form-label fw-bold">매물 위치</label>
            <div class="d-flex">
 <select class="form-select form-select-sm me-2" id="city" name="city" required onchange="updateDistricts()">
    <option value="">도시 선택</option>
    <option value="서울시" <%= "서울시".equals(city) ? "selected" : "" %>>서울시</option>
    <option value="경기도" <%= "경기도".equals(city) ? "selected" : "" %>>경기도</option>
</select>
<select class="form-select form-select-sm" id="district" name="district" required>
    <option value="">구 선택</option>
</select>

            </div>
        </div>
    </div>
                    <div class="form-group row mb-3">
                        <label for="name" class="col-sm-2 col-form-label fw-bold">매물명</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" id="name" class="form-control" value='<%= rs.getString("b_name") %>'>
                        </div>
                    </div>
                    <div class="form-group row mb-3">
                        <label for="condition" class="col-sm-2 col-form-label fw-bold">거래 조건</label>
                        <div class="col-sm-10">
                            <div class="mt-2">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="condition" value="매매" id="sale" <%= "매매".equals(rs.getString("b_condition")) ? "checked" : "" %>>
                                    <label class="form-check-label" for="sale">매매</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="condition" value="전세" id="jeonse" <%= "전세".equals(rs.getString("b_condition")) ? "checked" : "" %>>
                                    <label class="form-check-label" for="jeonse">전세</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="condition" value="월세/렌트" id="monthly" <%= "월세/렌트".equals(rs.getString("b_condition")) ? "checked" : "" %>>
                                    <label class="form-check-label" for="monthly">월세/렌트</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row mb-3">
                        <label for="unitPrice" class="col-sm-2 col-form-label fw-bold">가격</label>
                        <div class="col-sm-10">
                            <input type="text" name="unitPrice" id="unitPrice" class="form-control" value='<%= rs.getString("b_unitPrice") %>'>
                        </div>
                    </div>
                    
<div class="form-group row mb-3">
  <label for="area" class="col-sm-2 col-form-label fw-bold">면적<span class="text-body-secondary"></label>
  <div class="col-sm-10">
<input type="text" name="area" id="area" class="form-control" value='<%= rs.getString("b_area") %>'>
</div>
                
                    <div class="form-group row mb-3">
                        <label for="description" class="col-sm-2 col-form-label fw-bold">상세설명</label>
                        <div class="col-sm-10">
                            <textarea name="description" id="description" class="form-control" rows="5"><%= rs.getString("b_description") %></textarea>
                        </div>
                        
                                      <div class="form-group row mb-3">
                      <label for="filename" class="col-sm-2 col-form-label fw-bold">이미지</label>
                      
                      <input type="file" class="form-control custom-width mb-custom" name="filename" id="filename" class="form-control">
                </div>
                       
                    </div>

<div class="form-group row mb-3">
    <div class="col-sm-10 offset-sm-2">
        <input type="submit" class="btn btn-primary" value="등록">
    </div>
</div>
                    
                </div>
            </div>
            <div class="d-flex">
            </div>
        </form>
    </div>
</section>
<%
        } else {
            out.println("No property found with the given ID.");
        }
    } catch (SQLException e) {
        out.println("SQL Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</body>
</html>

<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Property" %>
<jsp:useBean id="propertyDAO" class="dao.PropertyRepository" scope="session" />
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Detail</title>
    
    <!-- Bootstrap CSS 파일 포함 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    
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
	String id=request.getParameter("id");
	Property property=propertyDAO.getPropertyById(id);
%>
    <!-- Product section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
            
                <div class="col-md-5"><img class="card-img-top mb-5 mb-md-0" src="<%= request.getContextPath() %>/resources/images/<%=property.getFilename() %>" alt="<%= property.getName() %>" /></div>
                
                
                
                <div class="col-md-6">
				<span class="px-2 py-1"><%= property.getDistrict() %></span>
                    <h1 class="display-5 fw-bolder"><%=property.getName() %></h1>
                    <div class="fs-5 mb-5">
                        <div class="form-group">
                        <span class="condition" id="condition"><%=property.getCondition() %> </span>
                            <span class="price" id="price"><%=property.getUnitPrice() %></span>
                        </div>
                    </div>
                    <p class="lead"><%=property.getDescription() %></p>
     <div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="d-flex">
<a href="./propertyforsale.jsp?id=<%= property.getPropertyID() %>" class="btn btn-sm btn-outline-secondary me-2" style="font-size: 16px;">매물 목록 &raquo;</a>                <button class="btn btn-outline-dark flex-shrink-0" type="button">
                    <i class="bi bi-heart-fill me-1" style="color: red;"></i>
                    찜하기
                </button>
            </div>
        </div>
    </div>
</div>

                </div>
            </div>
        </div>
    </section>
    
<jsp:include page="footer.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    
</body>
</html>

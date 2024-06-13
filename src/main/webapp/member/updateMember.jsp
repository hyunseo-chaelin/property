<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ include file="../dbconn.jsp" %>
<html lang="ko" data-bs-theme="auto">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<%
    String sessionId = (String) session.getAttribute("sessionId");
%>

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>    
<title>회원 수정</title>
</head>
<body onload="init()">
<jsp:include page="/menu.jsp" />
<div class="container py-4">
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">회원 수정</h1>
            <p class="col-md-8 fs-4">Membership Updating</p>      
        </div>
    </div>
    
    <c:forEach var="row" items="${resultSet.rows}">
    <c:set var="mail" value="${row.mail}" />
    <c:set var="mail1" value="${mail.split('@')[0]}" />
    <c:set var="mail2" value="${mail.split('@')[1]}" />

    <c:set var="birth" value="${row.birth}" />
    <c:set var="year" value="${birth.split('/')[0]}" />
    <c:set var="month" value="${birth.split('/')[1]}" />
    <c:set var="day" value="${birth.split('/')[2]}" />
    
    <c:set var="card_type" value="${row.cardType}" />
    <c:set var="cc_name" value="${row.cardName}" />
    <c:set var="cc_num_1" value="${row.cardNumber.split('-')[0]}" />
    <c:set var="cc_num_2" value="${row.cardNumber.split('-')[1]}" />
    <c:set var="cc_num_3" value="${row.cardNumber.split('-')[2]}" />
    <c:set var="cc_num_4" value="${row.cardNumber.split('-')[3]}" />
    <c:set var="cc_expiration_yy" value="${row.cardExpiration.split('/')[0]}" />
    <c:set var="cc_expiration_mm" value="${row.cardExpiration.split('/')[1]}" />
    <c:set var="CVC" value="${row.cvc}" />

    <div class="container">
        <form name="newMember" action="processUpdateMember.jsp" method="post" onsubmit="return checkForm()">
            <div class="row g-3 mb-3">
                <div class="col-6">
                    <label for="username" class="form-label">아이디</label>
                    <div class="input-group">
                        <input type="text" class="form-control custom-width" id="username" name="id" placeholder="ID" value="${row.id}" required readonly>
                        <button class="btn btn-outline-secondary" type="button" id="username-check">중복 검색</button>
                    </div>
                    <div class="invalid-feedback">
                        아이디를 입력해주세요.
                    </div>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-6">
                    <label for="password" class="form-label">비밀번호<span class="text-body-secondary"></span></label>
                    <input type="password" class="form-control custom-width" id="password" name="password" placeholder="password" required>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-6">
                    <label for="password_confirm" class="form-label">비밀번호 확인<span class="text-body-secondary"></span></label>
                    <input type="password" class="form-control custom-width" id="password_confirm" name="password_confirm" placeholder="password confirm" required>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-6">
                    <label for="name" class="form-label">성명<span class="text-body-secondary"></span></label>
                    <input type="text" class="form-control custom-width" id="name" name="name" placeholder="name" value="${row.name}" required>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <label for="gender" class="form-label">성별<span class="text-body-secondary"></span></label>
                <div class="col-sm-2">
                    <input name="gender" type="radio" value="남" <c:if test="${row.gender == '남'}">checked</c:if> /> 남
                </div>
                <div class="col-sm-2">
                    <input name="gender" type="radio" value="여" <c:if test="${row.gender == '여'}">checked</c:if> /> 여
                </div>
            </div>

            <div class="row g-3 mb-3">
                <label for="birthday" class="form-label">생일<span class="text-body-secondary"></span></label>
                <div class="col-md-2">
                    <input type="text" name="birthyy" maxlength="4" class="form-control" placeholder="년(4자)" value="${year}" required>
                </div>
                <div class="col-md-2">
                    <select name="birthmm" class="form-select" required>
                        <option value="">월</option>
                        <option value="01" <c:if test="${month == '01'}">selected</c:if>>1</option>
                        <option value="02" <c:if test="${month == '02'}">selected</c:if>>2</option>
                        <option value="03" <c:if test="${month == '03'}">selected</c:if>>3</option>
                        <option value="04" <c:if test="${month == '04'}">selected</c:if>>4</option>
                        <option value="05" <c:if test="${month == '05'}">selected</c:if>>5</option>
                        <option value="06" <c:if test="${month == '06'}">selected</c:if>>6</option>
                        <option value="07" <c:if test="${month == '07'}">selected</c:if>>7</option>
                        <option value="08" <c:if test="${month == '08'}">selected</c:if>>8</option>
                        <option value="09" <c:if test="${month == '09'}">selected</c:if>>9</option>
                        <option value="10" <c:if test="${month == '10'}">selected</c:if>>10</option>
                        <option value="11" <c:if test="${month == '11'}">selected</c:if>>11</option>
                        <option value="12" <c:if test="${month == '12'}">selected</c:if>>12</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <input type="text" name="birthdd" maxlength="2" class="form-control" placeholder="일" value="${day}" required>
                </div>
            </div>

            <div class="row g-3 mb-3 align-items-center">
                <label for="email" class="form-label">이메일<span class="text-body-secondary"></span></label>
                <div class="col-md-2">
                    <input type="text" class="form-control" id="mail1" name="mail1" placeholder="you" value="${mail1}" required>
                </div>
                <div class="col-auto align-self-center">
                    @
                </div>
                <div class="col-md-3">
                    <select name="mail2" class="form-select" id="mail2">
                        <option value="naver.com" <c:if test="${mail2 == 'naver.com'}">selected</c:if>>naver.com</option>
                        <option value="daum.net" <c:if test="${mail2 == 'daum.net'}">selected</c:if>>daum.net</option>
                        <option value="gmail.com" <c:if test="${mail2 == 'gmail.com'}">selected</c:if>>gmail.com</option>
                        <option value="nate.com" <c:if test="${mail2 == 'nate.com'}">selected</c:if>>nate.com</option>
                    </select>
                </div>
            </div>
            
            <div class="row g-3 mb-3">
                <label for="phone1" class="form-label">전화번호<span class="text-body-secondary"></span></label>
                <div class="col-md-2">
                    <select class="form-select" id="num1" name="phone1" required>
                        <option value="010" <c:if test="${row.phone.split('-')[0] == '010'}">selected</c:if>>010</option>
                        <option value="011" <c:if test="${row.phone.split('-')[0] == '011'}">selected</c:if>>011</option>
                        <option value="016" <c:if test="${row.phone.split('-')[0] == '016'}">selected</c:if>>016</option>
                        <option value="017" <c:if test="${row.phone.split('-')[0] == '017'}">selected</c:if>>017</option>
                        <option value="019" <c:if test="${row.phone.split('-')[0] == '019'}">selected</c:if>>019</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <input type="text" maxlength="4" size="4" name="phone2" class="form-control" id="num2" value="${row.phone.split('-')[1]}" required>
                </div>
                <div class="col-md-2">
                    <input type="text" maxlength="4" size="4" name="phone3" class="form-control" id="num3" value="${row.phone.split('-')[2]}" required>
                </div>
            </div>
                
            <div class="row g-3 mb-3">
                <div class="col-6">
                    <label for="address" class="form-label">주소<span class="text-body-secondary"></span></label>
                    <input type="text" class="form-control custom-width mb-custom" id="address2" name="address1" placeholder="주소" value="${row.address}" required>
                </div>
            </div>
            <div class="row g-3 mb-3">
                <div class="col-6">
                    <input type="text" class="form-control custom-width" id="address3" name="address2" placeholder="상세주소" value="${row.detail_address}" required>
                </div>
            </div>
            <hr class="my-4">
            <h4 class="mb-3">결제정보(선택)</h4>
            <div class="my-3">
                <div class="form-check">
                    <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked>
                    <label class="form-check-label" for="credit">신용카드</label>
                </div>
                <div class="container">
                    <div class="row gy-3 my-3">
                        <div class="row my-3">
                            <div class="col-md-3">
                                <label for="card-type" class="form-label">카드 종류<span class="text-body-secondary"></span></label>
                                <select class="form-select" id="card-type" name="card_type">
                                    <option value="KB" <c:if test="${card_type == 'KB'}">selected</c:if>>KB국민카드</option>
                                    <option value="SH" <c:if test="${card_type == 'SH'}">selected</c:if>>신한카드</option>
                                    <option value="HA" <c:if test="${card_type == 'HA'}">selected</c:if>>하나카드</option>
                                    <option value="RD" <c:if test="${card_type == 'RD'}">selected</c:if>>롯데카드</option>
                                    <option value="BC" <c:if test="${card_type == 'BC'}">selected</c:if>>BC카드</option>
                                    <option value="NH" <c:if test="${card_type == 'NH'}">selected</c:if>>NH농협카드</option>
                                    <option value="SS" <c:if test="${card_type == 'SS'}">selected</c:if>>삼성카드</option>
                                    <option value="HD" <c:if test="${card_type == 'HD'}">selected</c:if>>현대카드</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label for="cc_name" class="form-label">카드 별명</label>
                                <input type="text" class="form-control" id="cc_name" name="cc_name" placeholder="" value="${cc_name}">
                                <div class="invalid-feedback">
                                    Name on card is required
                                </div>
                            </div>
                        </div>  
                    </div>

                    <div class="col-md-6">
                        <label for="cc_number" class="form-label">카드 번호</label>
                        <div class="d-flex">
                            <input type="text" maxlength="4" size="4" name="cc_num_1" class="form-control me-2" id="cc_num_1" value="${cc_num_1}">
                            <span class="mx-2">-</span>
                            <input type="password" maxlength="4" size="4" name="cc_num_2" class="form-control me-2" id="cc_num_2" value="${cc_num_2}">
                            <span class="mx-2">-</span>
                            <input type="password" maxlength="4" size="4" name="cc_num_3" class="form-control me-2" id="cc_num_3" value="${cc_num_3}">
                            <span class="mx-2">-</span>
                            <input type="text" maxlength="4" size="4" name="cc_num_4" class="form-control" id="cc_num_4" value="${cc_num_4}">
                        </div>
                    </div>

                    <div class="row gy-3 my-3">
                        <div class="col-md-3">
                            <label for="cc_expiration" class="form-label">만기일</label>
                            <div class="d-flex">
                                <select class="form-select me-2" id="cc_expiration_yy" name="cc_expiration_yy">
                                    <option value="">년</option>
                                    <option value="2024" <c:if test="${cc_expiration_yy == '2024'}">selected</c:if>>2024</option>
                                    <option value="2025" <c:if test="${cc_expiration_yy == '2025'}">selected</c:if>>2025</option>
                                    <option value="2026" <c:if test="${cc_expiration_yy == '2026'}">selected</c:if>>2026</option>
                                    <option value="2027" <c:if test="${cc_expiration_yy == '2027'}">selected</c:if>>2027</option>
                                    <option value="2028" <c:if test="${cc_expiration_yy == '2028'}">selected</c:if>>2028</option>
                                </select>
                                <select class="form-select" id="cc_expiration_mm" name="cc_expiration_mm">
                                    <option value="">월</option>
                                    <option value="01" <c:if test="${cc_expiration_mm == '01'}">selected</c:if>>01</option>
                                    <option value="02" <c:if test="${cc_expiration_mm == '02'}">selected</c:if>>02</option>
                                    <option value="03" <c:if test="${cc_expiration_mm == '03'}">selected</c:if>>03</option>
                                    <option value="04" <c:if test="${cc_expiration_mm == '04'}">selected</c:if>>04</option>
                                    <option value="05" <c:if test="${cc_expiration_mm == '05'}">selected</c:if>>05</option>
                                    <option value="06" <c:if test="${cc_expiration_mm == '06'}">selected</c:if>>06</option>
                                    <option value="07" <c:if test="${cc_expiration_mm == '07'}">selected</c:if>>07</option>
                                    <option value="08" <c:if test="${cc_expiration_mm == '08'}">selected</c:if>>08</option>
                                    <option value="09" <c:if test="${cc_expiration_mm == '09'}">selected</c:if>>09</option>
                                    <option value="10" <c:if test="${cc_expiration_mm == '10'}">selected</c:if>>10</option>
                                    <option value="11" <c:if test="${cc_expiration_mm == '11'}">selected</c:if>>11</option>
                                    <option value="12" <c:if test="${cc_expiration_mm == '12'}">selected</c:if>>12</option>
                                </select>
                            </div>
                            <div class="invalid-feedback">
                                Expiration date required
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label for="cvc" class="form-label">CVC</label>
                            <input type="text" maxlength="3" size="3" name="cvc" class="form-control me-2" id="cvc" pattern="\d{3}" inputmode="numeric" value="${CVC}">
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="mb-3 row">
                <div class="col-sm-offset-2 col-sm-10 ">
                    <input type="submit" class="btn btn-primary" value="회원수정"> 
                    <a href="deleteMember.jsp" class="btn btn-primary">회원탈퇴</a>
                </div>
            </div>
        </form>    
    </div>
    </c:forEach>
    <jsp:include page="/footer.jsp" />  
</div>    
</body>
</html>
<script type="text/javascript">
    function init() {
        setComboMailValue("${mail2}");
        setComboBirthValue("${month}");
    }

    function setComboMailValue(val) {
        var selectMail = document.getElementById('mail2');
        for (i = 0, j = selectMail.length; i < j; i++) {
            if (selectMail.options[i].value == val) {
                selectMail.options[i].selected = true; 
                break;
            }
        }
    }
    function setComboBirthValue(val) {
        var selectBirth = document.getElementById('birthmm'); 
        for (i = 0, j = selectBirth.length; i < j; i++){
            if (selectBirth.options[i].value == val){
                selectBirth.options[i].selected = true; 
                break;
            }
        }
    }
    function checkForm() {
        if (!document.newMember.id.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
        if (!document.newMember.password.value) {
            alert("비밀번호를 입력하세요.");
            return false;
        }
        if (document.newMember.password.value != document.newMember.password_confirm.value) {
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
        }
    }
</script>

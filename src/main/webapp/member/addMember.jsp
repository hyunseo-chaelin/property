<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../dbconn.jsp" %>
<%@ include file="../menu.jsp" %>
<!-- 회원가입 -->
<html lang="ko" data-bs-theme="auto">
<head>
  <meta charset="utf-8">
  <title>addMember</title>

  <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/checkout/">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

  <!-- Bootstrap CSS 파일 포함 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
	
  <style>
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
    .custom-width {
      width: 100%;
    }
    .mb-custom1 {
      margin-bottom: 0.7rem; /* 원하는 간격으로 조정 */
    }
    .mb-custom2 {
      margin-bottom: 1.0rem; /* 원하는 간격으로 조정 */
    }
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    function checkForm() {
      if (!document.getElementById('id').value) {
        alert("아이디를 입력하세요.");
        return false;
      }
      if (!document.getElementById('password').value) {
        alert("비밀번호를 입력하세요.");
        return false;
      }
      if (document.getElementById('password').value != document.getElementById('password_confirm').value) {
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
      }
    }

    $(document).ready(function() {
      $('#newMemberForm').on('submit', function() {
        return checkForm();
      });

      $('#id-check').on('click', function() {
        checkId();
      });
    });

    function checkId() {
      var userId = document.getElementById('id').value;
      if (!userId) {
        alert("아이디를 입력하세요.");
        return;
      }

      $.ajax({
        url: 'checkId.jsp', // 아이디 중복 검사를 처리하는 서버 엔드포인트
        type: 'POST',
        data: { id: userId },
        success: function(response) {
          if (response.trim() === 'duplicate') {
            alert("아이디가 중복되었습니다.");
          } else {
            alert("사용 가능한 아이디입니다.");
          }
        },
        error: function() {
          alert("아이디 중복 검사에 실패했습니다. 나중에 다시 시도해주세요.");
        }
      });
    }
  </script>
</head>

<body class="bg-body-tertiary">
  <div class="container">
    <div class="py-5 text-center">
      <h2>회원가입</h2>
      <p class="lead">안녕하세요. 사이트를 이용하고 싶으시면 회원가입을 진행해 주세요.</p>
    </div>
    <div class="container">
      <main>
        <form name="newMember" id="newMemberForm" method="post" action="processAddMember.jsp">
		  <div class="row g-3 mb-3">
		    <div class="col-6">
		      <label for="username" class="form-label">아이디</label>
		      <div class="input-group">
		        <input type="text" class="form-control custom-width" id="id" name="id" placeholder="ID" required>
		        <button class="btn btn-outline-secondary" type="button" id="id-check">중복 검색</button>
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
			    <input type="text" class="form-control custom-width" id="name" name="name" placeholder="name" required>
			    <div class="invalid-feedback">
			      성명을 입력해주세요.
			    </div>
			  </div>
		  </div>

		
		  <div class="row g-3 mb-3">
		    <label for="gender" class="form-label">성별<span class="text-body-secondary"></span></label>
		    <div class="col-sm-2">
		      <input name="gender" type="radio" value="남" /> 남
		    </div>
		    <div class="col-sm-2">
		      <input name="gender" type="radio" value="여" /> 여
		    </div>
		    <div class="invalid-feedback">
		      성별을 선택해주세요.
		    </div>
		  </div>
		
		  <div class="row g-3 mb-3">
		    <label for="birthday" class="form-label">생일<span class="text-body-secondary"></span></label>
		    <div class="col-md-2">
		      <input type="text" name="birthyy" maxlength="4" class="form-control" placeholder="년(4자)" required>
		    </div>
		    <div class="col-md-2">
		      <select name="birthmm" class="form-select" required>
		        <option value="">월</option>
		        <option value="01">01</option>
		        <option value="02">02</option>
		        <option value="03">03</option>
		        <option value="04">04</option>
		        <option value="05">05</option>
		        <option value="06">06</option>
		        <option value="07">07</option>
		        <option value="08">08</option>
		        <option value="09">09</option>
		        <option value="10">10</option>
		        <option value="11">11</option>
		        <option value="12">12</option>
		      </select>
		    </div>
		    <div class="col-md-2">
		      <input type="text" name="birthdd" maxlength="2" class="form-control" placeholder="일" required>
		    </div>
		    <div class="invalid-feedback">
		      생일을 입력해주세요.
		    </div>
		  </div>
		
		  <div class="row g-3 mb-3 align-items-center">
		    <label for="email" class="form-label">이메일<span class="text-body-secondary"></span></label>
		    <div class="col-md-2">
		      <input type="text" class="form-control" id="mail1" name="mail1" placeholder="you" required>
		    </div>
		    <div class="col-auto align-self-center">
		      @
		    </div>
		    <div class="col-md-3">
		      <select name="mail2" class="form-select" id="mail2">
		        <option value="naver.com">naver.com</option>
		        <option value="daum.net">daum.net</option>
		        <option value="gmail.com">gmail.com</option>
		        <option value="nate.com">nate.com</option>
		      </select>
		    </div>
		    <div class="invalid-feedback">
		      이메일을 입력해주세요.
		    </div>
		  </div>
		
		  <div class="row g-3 mb-3">
		    <label for="phone1" class="form-label">전화번호<span class="text-body-secondary"></span></label>
		    <div class="col-md-2">
		      <select class="form-select" id="num1" name="phone1" required>
		        <option value="010">010</option>
		        <option value="011">011</option>
		        <option value="016">016</option>
		        <option value="017">017</option>
		        <option value="019">019</option>
		      </select>
		    </div>
		    <div class="col-md-2">
		      <input type="text" maxlength="4" size="4" name="phone2" class="form-control" id="phone2" required>
		    </div>
		    <div class="col-md-2">
		      <input type="text" maxlength="4" size="4" name="phone3" class="form-control" id="phone3" required>
		    </div>
		    <div class="invalid-feedback">
		      전화번호를 입력해주세요.
		    </div>
		  </div>
		
		  <div class="row g-3 mb-3">
		    <div class="col-6">
		      <label for="address" class="form-label">주소<span class="text-body-secondary"></span></label>
		      <input type="text" class="form-control custom-width mb-custom" id="address1" name="address1" placeholder="주소" required>
		    </div>
		  </div>
		  <div class="row g-3 mb-3">
		    <div class="col-6">
		      <input type="text" class="form-control custom-width" id="address2" name="address2" placeholder="상세주소" required>
		    </div>
		    <div class="invalid-feedback">
		      주소를 입력해주세요.
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
		        <!-- 카드 종류와 카드 별명을 나란히 배치 -->
		        <div class="row my-3">
		          <div class="col-md-3">
		            <label for="card_type" class="form-label">카드 종류<span class="text-body-secondary"></span></label>
		            <select class="form-select" id="card_type" name="card_type">
		              <option value="KB">KB국민카드</option>
		              <option value="SH">신한카드</option>
		              <option value="HA">하나카드</option>
		              <option value="RD">롯데카드</option>
		              <option value="BC">BC카드</option>
		              <option value="NH">NH농협카드</option>
		              <option value="SS">삼성카드</option>
		              <option value="HD">현대카드</option>
		            </select>
		          </div>
		          <div class="col-md-3">
		            <label for="cc_name" class="form-label">카드 별명</label>
		            <input type="text" class="form-control" id="cc-name" name="cc-name" placeholder="">
		          </div>
		        </div>
		      </div>
		      <div class="col-md-6">
		        <label for="cc_number" class="form-label">카드 번호</label>
		        <div class="d-flex">
		          <input type="text" maxlength="4" size="4" name="cc_num_1" class="form-control me-2" id="cc_num_1">
		          <span class="mx-2">-</span>
		          <input type="password" maxlength="4" size="4" name="cc_num_2" class="form-control me-2" id="cc_num_2">
		          <span class="mx-2">-</span>
		          <input type="password" maxlength="4" size="4" name="cc_num_3" class="form-control me-2" id="cc_num_3">
		          <span class="mx-2">-</span>
		          <input type="text" maxlength="4" size="4" name="cc_num_4" class="form-control" id="cc_num_4">
		        </div>
		      </div>
		
		      <div class="row gy-3 my-3">
		        <!-- 만기일과 CVC를 나란히 배치 -->
		        <div class="col-md-3">
		          <label for="cc_expiration" class="form-label">만기일</label>
		          <div class="d-flex">
		            <select class="form-select me-2" id="cc_expiration_yy" name="cc_expiration_yy">
		              <option value="">년</option>
		              <option value="2024">2024</option>
		              <option value="2025">2025</option>
		              <option value="2026">2026</option>
		              <option value="2027">2027</option>
		              <option value="2028">2028</option>
		            </select>
		            <select class="form-select" id="cc_expiration_mm" name="cc_expiration_mm">
		              <option value="">월</option>
		              <option value="01">01</option>
		              <option value="02">02</option>
		              <option value="03">03</option>
		              <option value="04">04</option>
		              <option value="05">05</option>
		              <option value="06">06</option>
		              <option value="07">07</option>
		              <option value="08">08</option>
		              <option value="09">09</option>
		              <option value="10">10</option>
		              <option value="11">11</option>
		              <option value="12">12</option>
		            </select>
		          </div>
		        </div>
		        <div class="col-md-3">
		          <label for="cvc" class="form-label">CVC</label>
		          <input type="text" maxlength="3" size="3" name="cvc" class="form-control me-2" id="cvc" pattern="\d{3}" inputmode="numeric">
		        </div>
		      </div>
		    </div>
		    <div class="form-check">
		      <input type="checkbox" class="form-check-input" id="save-info">
		      <label class="form-check-label" for="save-info">기본결제정보로 저장합니다.</label>
		    </div>
		    <hr class="my-4">
		    <button class="w-100 btn btn-primary btn-lg" type="submit">회원가입</button>
		</form>

      </main>
    </div>
    <jsp:include page="../footer.jsp" />
  </div>
  <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script src="checkout.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
  <script type'"text/javascript">
  function checkId() {
	    var userId = document.getElementById('id').value;
	    if (!userId) {
	        alert("아이디를 입력하세요.");
	        return;
	    }

	    $.ajax({
	        url: 'checkId.jsp', // 아이디 중복 검사를 처리하는 서버 엔드포인트
	        type: 'POST',
	        data: { id: userId },
	        success: function(response) {
	            if (response.trim() === 'duplicate') {
	                alert("이미 사용 중인 아이디입니다.");
	            } else {
	                alert("사용 가능한 아이디입니다.");
	            }
	        },
	        error: function() {
	            alert("아이디 중복 검사에 실패했습니다. 나중에 다시 시도해주세요.");
	        }
	    });
	}

  </script>
</body>
</html>

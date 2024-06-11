<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../menu.jsp" %>
<!-- 회원가입 -->
<html lang="ko" data-bs-theme="auto">
  <head>
  	<script src="text/javascript">
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

    
    <!-- Custom styles for this template -->
    <link href="checkout.css" rel="stylesheet">
  </head>
  
  <body class="bg-body-tertiary"> 
	<div class="container">
    	<div class="py-5 text-center">
      		<h2>회원가입</h2>
      		<p class="lead">안녕하세요. 사이트를 이용하고 싶으시면 회원가입을 진행해 주세요.</p>
    	</div>
  	<div class="container">
    	<main>
	<div class="row g-3 mb-3">
  		<div class="col-6">
    		<label for="username" class="form-label">아이디</label>
    		<div class="input-group">
      			<input type="text" class="form-control custom-width" id="username" placeholder="ID" required>
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
          <input type="password" class="form-control custom-width" id="password" placeholder="password" required>
        </div>
	</div>
	<div class="row g-3 mb-3">
        <div class="col-6">
          <label for="password_confirm" class="form-label">비밀번호 확인<span class="text-body-secondary"></span></label>
          <input type="text" class="form-control custom-width" id="password" placeholder="password confirm" required>
        </div>
	</div>
	<div class="row g-3 mb-3">
        <div class="col-6">
          	<label for="name" class="form-label">성명<span class="text-body-secondary"></span></label>
          	<input type="text" class="form-control custom-width" id="name" placeholder="name" required>
        </div>
	</div>
	<div class="mb-3 row">
		<label for="gender" class="form-label">성별<span class="text-body-secondary"></span></label>
			<div class="col-sm-2">
				<input name="gender" type="radio" value="남" /> 남
			</div>
			<div class="col-sm-2">
				<input name="gender" type="radio" value="여" /> 여
			</div>
	</div>
	<div class="mb-3 row">
        <div class="col-sm-4">
          	<label for="birthday" class="form-label">생일<span class="text-body-secondary"></span></label>
          	<div class="col-sm-10">
				  <div class="row">
				  	<div class="col-sm-4">
						<input type="text" name="birthyy" maxlength="4"  class="form-control" placeholder="년(4자)" size="10"> 
					</div>
					<div class="col-sm-4">
					<select name="birthmm" class="form-select">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> 
					</div>
					<div class="col-sm-4">
					<input type="text" name="birthdd" maxlength="2" class="form-control" placeholder="일" size="10">
					</div>
				</div>
				</div>
        </div>
	</div>
	<div class="row g-3 mb-3">
        <div class="col-6">
          <label for="email" class="form-label">이메일<span class="text-body-secondary"></span></label>
          <input type="email" class="form-control custom-width" id="email" placeholder="you@example.com" required>
        </div>
    </div>
    <div class="mb-3 row">
        <div class="col-sm-4">
          <label for="phone1" class="form-label">전화번호<span class="text-body-secondary"></span></label>
          <div class="d-flex">
            <select class="form-select custom-width" id="num1" required>
              <option value="010">010</option>
              <option value="011">011</option>
              <option value="016">016</option>
              <option value="017">017</option>
              <option value="019">019</option>
            </select>
            <span class="mx-2">-</span>
            <input type="text" maxlength="4" size="4" name="phone2" class="form-control custom-width me-2" id="num2" required>
            <span class="mx-2">-</span>
            <input type="text" maxlength="4" size="4" name="phone3" class="form-control custom-width" id="num3" required>
          </div>
        </div>
    </div>
    <div class="row g-3 mb-3">
        <div class="col-6">
          <label for="address" class="form-label">주소<span class="text-body-secondary"></span></label>
          <input type="text" class="form-control custom-width mb-custom" id="address2" placeholder="주소" required>
        </div>
    </div>
	<div class="row g-3 mb-3">
        <div class="col-6">
          <input type="text" class="form-control custom-width" id="address3" placeholder="상세주소" required>
        </div>
    </div>         
    </main>
  </div>
  
	<hr class="my-4">
		<h4 class="mb-3">결제정보(선택)</h4>
        	<div class="my-3">
            	<div class="form-check">
              		<input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
              		<label class="form-check-label" for="credit">신용카드</label>
            	</div>
				<div class="container">
				<div class="row gy-3 my-3">
    			<!-- 카드 종류과 카드 별명를 나란히 배치 -->
    				<div class="row my-3">
    					<div class="col-md-3">
      						<label for="card-type" class="form-label">카드 종류<span class="text-body-secondary"></span></label>
      						<select class="form-select" id="card-type" required>
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
      						<input type="text" class="form-control" id="cc-name" placeholder="" required>
      						<div class="invalid-feedback">
        						Name on card is required
      						</div>
    					</div>
    				</div>	
  				</div>
  				<div class="col-md-6">
      					<label for="cc_number" class="form-label">카드 번호</label>
      					<div class="d-flex">
        					<input type="text" maxlength="4" size="4" name="cc_num_1" class="form-control me-2" id="cc-number-1" required>
        					<span class="mx-2">-</span>
        					<input type="password" maxlength="4" size="4" name="cc_num_2" class="form-control me-2" id="cc-number-2" required>
        					<span class="mx-2">-</span>
        					<input type="password" maxlength="4" size="4" name="cc_num_3" class="form-control me-2" id="cc-number-3" required>
        					<span class="mx-2">-</span>
        					<input type="text" maxlength="4" size="4" name="cc_num_4" class="form-control" id="cc-number-4" required>
      					</div>
    			</div>
				<div class="row gy-3 my-3">
    			<!-- 만기일과 CVC를 나란히 배치 -->
    				<div class="col-md-3">
      					<label for="cc_expiration" class="form-label">만기일</label>
      						<div class="d-flex">
        						<select class="form-select me-2" id="cc_expiration_yy" required>
							          <option value="">년</option>
							          <option value="2024">2024</option>
							          <option value="2025">2025</option>
							          <option value="2026">2026</option>
							          <option value="2027">2027</option>
							          <option value="2028">2028</option>
							        </select>
						        <select class="form-select" id="cc_expiration_mm" required>
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
					      <div class="invalid-feedback">
					        Expiration date required
					      </div>
					 </div>
				    <div class="col-md-3">
				      <label for="CVC" class="form-label">CVC</label>
				      <input type="text" maxlength="3" size="3" name="CVC" class="form-control me-2" id="CVC" required pattern="\d{3}" inputmode="numeric">
				      <div class="invalid-feedback">
				        Security code required
				      </div>
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
      </div>
    </div>
  </main>
  <jsp:include page="../footer.jsp" />
</div>
	<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="checkout.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
  </body>
</html>
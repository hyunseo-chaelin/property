function CheckAddProperty() {
	
	var propertyId=document.getElementById("propertyId");
	var name = document.getElementById("name");
	var unitPrice=document.getElementById("unitPrice");
	var area=document.getElementById("area");
	var description = document.getElementById("description");
	
	if(!check(/^PROP[0-9]{4,11}$/, propertyId, "[매물 코드]\nPROP와 숫자를 조합하여 8-15자까지 입력하세요 \n첫 글자는 반드시 PROP로 시작하세요."))
		return false;
	
	if(name.value.length < 4 || name.value.length > 50) {
		alert("[매물명]\n최소 4자에서 최대 50자까지 입력하세요");
		name.focus();
		return false;
	}
	
	if (!check(/^\d+(\.\d+)?\/\d+(\.\d+)?$/, area, "[면적]\n숫자/숫자 형식으로 입력하세요")) {
    	return false;
	}
	
	if(description.value.length < 100) {
		alert("[상세설명]\n최소 100자 이상 입력하세요");
		description.focus();
		return false;
	}
	
	function check(regExp, e, msg) {
		if(regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.focus();
		return false;
	}
	
	document.newBook.submit()
}
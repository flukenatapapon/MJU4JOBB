function validate(formCheck){
	var regexFullname = /[ก-๙a-zA-Z]+[\s]+[ก-๙a-zA-Z]+[\s]+[ก-๙a-zA-Z]|[ก-๙a-zA-Z]+[\s]+[ก-๙a-zA-Z]/;
	var regexNickname = /^[a-zA-Zก-๙]+$/;
	var regexTell = /^[0-9]+$/;
	if(formCheck.prefix.value == ""){
		alert("กรุราเลือกคํานําหน้า");
		return false;
	}
	if(formCheck.fullname.value == ""){
		alert("กรุณากรอกชื่อ-นามสกุล");
		formCheck.id.focus = true;
		return false;
	}else if(!regexFullname.test(formCheck.fullname.value)){
		alert("กรุณากรอกชื่อนามสกุลให้ถูกรูปแบบ");
		return false;
	}
	if(formCheck.nickname.value == ""){
		alert("กรุณากรอกชื่อเล่น");
		formCheck.id.focus = true;
		return false;
	}else{
		if(!regexNickname.test(formCheck.nickname.value)){
			alert("กรุณากรอกชื่อเล่นให้ถูกรูปแบบ");
			return false;
		}		
	}
	

	
}
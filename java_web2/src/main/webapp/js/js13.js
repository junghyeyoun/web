/**
 	window.onload = function() {
		document.querySelector("#btnSend").onclick = chkData;
		document.querySelector("#btnClear").onclick = clsData;
	}
	function chkData(e) {
		// console.log("summit 버튼")
		e.preventDefault(); // 자바 스크립트의 submit 버튼의 적용된 자바스크립트의 기본 기능 해제
	// 입력 자료 검사
	if(frm.name.value === "" || isNaN(frm.name.value) === false){
		frm.name.focus();
		alert("이름을 입력하시오(순수 숫자는 안됨)");
		return;
		}
		if(frm.id.value.length <4){
			alert("아이디는 4글자 이상 입력하시오")
		}
		// 정규 표현식
		let regExp = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/; // 이메일 형식 
		if(!frm.email.value.match(regExp)){ 
			alert("이메일을 정확히 입력하세요");
			return;
		}
		
		 
		let regExp2 = /^[0-9]{1,2}$/; 
		if(!frm.age.value.match(regExp2)){ 
			alert("나이를 정확히 입력하세요");
			return;
		}
		// frm.action="js13.jsp"
		frm.method="get";
		frm.submit();
	}
		
	function clsData(event) {
		// console.log("reset 버튼", event)
		e.preventDefault(); 
		// 원하는 프로그램을 기술
	}
	
 * 
 */
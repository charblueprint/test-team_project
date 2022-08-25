function info_check() {
	var reserv_number = document.getElementById("reser_num").value;
	var reserv_name = document.getElementById("reser_nm").value;
	var reserv_tel = document.getElementById("reser_tel").value;
	var reserv_email = document.getElementById("reser_email").value;

	if (reserv_number == "") {
		alert("예약번호를 입력해주세요.");
	} else if (reserv_name == "") {
		alert("예약자 이름을 입력해주세요.");
	} else if (reserv_tel == "") {
		alert("예약자 연락처를 입력해주세요.");
	} else if (reserv_email == "") {
		alert("예약자 이메일을 입력해주세요.");
	} else {
		if (reserv_email != "") {
			var eck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,8}$/i;
			if (eck.test(reserv_email) == false) {
				alert("정상적인 이메일 주소를 입력해 주세요.");
			} else {
				if (isNaN(reserv_tel) == true) {
					alert("정상적인 연락처를 입력해 주세요.");
				} else if (reserv_tel.length != 11) {
					alert("정상적인 연락처를 입력해 주세요.");
				} else {
					location.href="./reserve_Ischecked.jsp";
					fm.submit();
				}
			}

		}
	}
	
}
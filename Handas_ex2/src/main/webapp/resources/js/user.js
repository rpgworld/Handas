
// 로그인
function login() {
	var userID = $('.login_form input[name=userID]').val();
	var userPW = $('.login_form input[name=userPW]').val();
	
	
	
	/*
	// 로그인을 ajax 로 하는 방식
	// POST 방식일 경우, contentType:'application/json; charset=utf-8' 로 하면 컨트롤러에서 값을 못받음
	$.ajax({
		type : 'POST',
		data : {'userID' : userID, 'userPW' : userPW},
		url : '/handas/user/login',
		dataType : 'json',
		success : function(result) {
			if (result > 0) { // 아이디가 존재한다면
				location.href="/handas/index";
			} else {
				if(result == -100) {
					modal_alert('경고창', '비밀번호가 일치하지 않습니다.');
				} else if(result == -200) {
					modal_alert('경고창', '아이디가 존재하지 않습니다.');
				} else {
					modal_alert('경고창', '데이터베이스 오류');
				}
			}
		},
		error : function(error) {
			alert('error : ' + error);
		}
	});*/
}



// 아이디 중복체크 후 아이디를 변경시 처리
function id_check_reset() {
	idCheck = false;
}

// 아이디 중복체크
function id_check() {
	
	var userID = $('.join_id').val();
	
	if(userID == '') {
		modal_alert('경고창', '아이디를 입력해주세요.');
		return false;
	}
	
	// 영 숫자만 입력 가능한 정규식
    var numPattern = /^[A-Za-z0-9+]*$/;
    if (!numPattern.test(userID)) {
        alert("영숫자만 입력할 수 있습니다.");
        return false;
    }
	
	$.ajax({
		type : 'GET',
		data : {'userID' :  userID},
		url : '/handas/user/idCheck',
		dataType : 'json',
		contentType:'application/json; charset=utf-8',
		success : function(result) {
			
			if (result > 0) { // 아이디가 존재한다면
				modal_alert('경고창', '이미 존재하는 아이디 입니다.');
				
			
			} else {
				modal_alert('성공', '사용가능한 아이디 입니다.');
				idCheck = true;
			}
		}
	});
}
// 비밀번호 확인
function pw_check() {
var pw1 = $('.join_pw1').val();
var pw2 = $('.join_pw2').val();

	if(pw1 != pw2) {
		$('.pw_check').html('비밀번호 불일치');
		$('.pw_check').css('color', '#ff0000');
		$('.pw_check').css('font-size', '12px');
		pwCheck = false;
	} else {
		$('.pw_check').html('비밀번호 일치');
		$('.pw_check').css('color', '#0000ff');
		$('.pw_check').css('font-size', '12px');
		pwCheck = true;
	}
}

// 다음 주소 API 사용하기
function addr_check() {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        	$('table input[name=address1]').val(data.zonecode);
        	$('table input[name=address2]').val(data.address);
        }
    }).open();
}


// 회원가입 버튼 클릭시 체크
function join_check() {
	var form = $('.join_form form');
	var num = form.length - 1;

	if(idCheck == false) {
		message_alert('경고창', '아이디 중복체크를 해주세요.');
		event.preventDefault();
	} else if(pwCheck == false){
		message_alert('경고창', '비밀번호가 일치하지 않습니다.');
		event.preventDefault();
	} else {
		var form = $('.form-control');
		var num = form.length;
		for(var i = 0; i < num; i++) {
			if($('.form-control')[i].value == '') {
				modal_alert('경고창', '입력하지 않은 정보가 있습니다.');
				event.preventDefault();
			}
		}
	}
}

// 회원 정보수정 비밀번호 보기
function pw_view() {
	$('.join_pw1').attr('type', 'text');
}

// 회원 정보수정 버튼 클릭시 체크
function update_check() {
	var form = $('.join_form form');
	var num = form.length - 1;
	if($('join_pw1').val() == $('join_pw2').val()) {pwCheck = true;}
	
	if(pwCheck == false){
		message_alert('경고창', '비밀번호가 일치하지 않습니다.');
		event.preventDefault();
	} else {
		var form = $('.form-control');
		var num = form.length;
		for(var i = 0; i < num; i++) {
			if($('.form-control')[i].value == '') {
				message_alert('경고창', '입력하지 않은 정보가 있습니다.');
				event.preventDefault();
			}
		}
	}
}

// 경고창, 성공 메시지 팝업
function modal_alert(msgType, msgContent) {
    $('.modal-title').html(msgType);
    $('.modal-body').html(msgContent);
    if(msgType == '경고창') {
        $('.modal-header').css('background', '#ff0000');
        $('.modal-title').css('color', '#ffffff');
    } else if (msgType == '성공') {
    	$('.modal-header').css('background', '#0000FF');
        $('.modal-title').css('color', '#ffffff');
    }
    
    $('#myModal').modal();
}

// 토스트 메시지 팝업
function toast_alert(target, top_value, left_value, msgTop, msgBody) {
	// 장바구니 메세지 출력
	$('.toast strong').html(msgTop);
    $('.toast .toast-body').html(msgBody);
    
    var left = $(target).offset().left;
    var top = $(target).offset().top;

    $('.toast').css('left', left + left_value);
    $('.toast').css('top', top + top_value);
    
	$('.toast').toast('show');
}

// 메시지 팝업
function message_alert(msgType, msgContent){
	if(msgType == '성공') {
		$('#alert_body').html('<strong>Success!</strong>&nbsp;&nbsp;' + msgContent);
		$('.alert').attr('class', 'alert alert-primary alert-dismissible fade show');
		$('.alert').slideDown();
	} else {
		$('#alert_body').html('<strong>Warning!</strong>&nbsp;&nbsp;' + msgContent);
		$('.alert').slideDown();
	}
}
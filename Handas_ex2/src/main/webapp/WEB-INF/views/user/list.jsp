<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@ include file="../header.jsp" %>
    <title>Handas</title>
<style>
.userList {
width: 80%;
margin: 30px auto;
}
.userList th, td{
text-align: center;
}
.dummy_id {
width: 80%;
margin: 10px auto;
}
.dummy_id h1, .userList h1 {
font-size: 1.4em;
font-weight: bold;
margin-bottom: 10px;
}
.dummy_id input{
height: 25px;
margin-right: 10px;
}
.dummy_id input[type=text]{
width: 20%;
}
.dummy_id input[type=email]{
width: 35%;
}
.dummy_id input[type=submit]{
width: 5%;
margin-right: 0;
}
</style>
<script>
$('document').ready(function(){
	
	// 권한 등급 변경
	$('.roleUpdate').click(function(){
		var tr = $(this).parent().parent().parent();
		var td = tr.children();
		
		var role = td.eq(6).children().children('option:selected').text().toLowerCase();
		var userID = td.eq(1).text();
		
		$.ajax({
			type : 'POST',
			data : {'role' : role, 'userID' : userID},
			//url : '/shop/cartDelete',
			url : '${path}/user/roleUpdate', 
			dataType : 'json',
			success : function(result) {
				if(result == true) {
					modal_alert('성공', '해당 회원의 등급이 성공적으로 변경되었습니다.');
					
				} else {
		
					window.location.href = '${path}/index';
				}
			},
			error : function(error) {
				alert('error : ' + error);
			}
		});
		
	});
	
	// 회원 탈퇴
	$('#userDelete').click(function(){
		
		alert($(this).attr('uID'));
		return false;

	});
});

</script>
</head>
<body>
	<div class="container">
		<%@ include file="../menu.jsp" %>
		<div class="row">
            <div class="col-sm-12">
            	<div class="dummy_id">
            		<form action="dummyJoin" method="post">
	            	<h1>아이디 생성</h1>
	                <div style="display: flex">
	                	<input class="form-control" type="text" name="userID" placeholder="아이디">
	                	<input class="form-control" type="text" name="userPW" placeholder="비밀번호">
	                	<input class="form-control" type="text" name="userName" placeholder="이름">
	                	<input class="form-control" type="email" name="userEmail" placeholder="이메일">
	                	<input class="btn btn-primary form-control" type="submit" value="생성">
	                </div>
	                </form>
	            </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
            	<div class="userList">
            		<h1>회원 리스트</h1>
		    		<table class="table table-striped">
		    			<thead>
		    				<tr>
		    					<th>회원번호</th>
		    					<th>아이디</th>
		    					<th>비밀번호</th>
		    					<th>이메일</th>
		    					<th>가입일자</th>
		    					<th>구매금액</th>
		    					<th>회원등급</th>
		    					<th>비고</th>
		    				</tr>
		    			</thead>
		    				<c:forEach items="${userList }" var="dto">
		    					<tr>
			    					<td>${dto.num }</td>
			    					<td>${dto.userID }</td>
			    					<td>${dto.userPW }</td>
			    					<td>${dto.userEmail }</td>
			    					<td>${dto.joinDate }</td>
			    					<td><fmt:formatNumber value="${dto.totalPurchase }" pattern="#,###" />원</td>
			    					<td style="padding: 5px;">
			    						<c:if test="${dto.userID eq 'aaa' }">
			    							<select class="form-control" id="${dto.userID }" style="height: 30px;" disabled>
												<option>MASTER</option>
											</select>
			    						</c:if>
			    						<c:if test="${dto.userID ne 'aaa' }">
											<select class="form-control" id="${dto.userID }" style="height: 30px;">
												<option ${dto.role eq 'user' ? 'selected' : '' }>USER</option>
												<option ${dto.role eq 'vip' ? 'selected' : '' }>VIP</option>
												<option ${dto.role eq 'admin' ? 'selected' : '' }>ADMIN</option>
											</select>
										</c:if>
									</td>
			    					<td style="padding: 5px;">
			    						<div>
			    							<c:if test="${dto.userID eq 'aaa' }">
			    								<button class="btn btn-primary btn-sm" disabled>수정</button> &nbsp;
			    								<button class="btn btn-outline-primary btn-sm" disabled>X</button>
			    							</c:if>
			    							<c:if test="${dto.userID ne 'aaa' }">
				    							<button type="button" class="btn btn-primary btn-sm roleUpdate">수정</button> &nbsp;
				    							<a href="${path }/user/delete?userID=${dto.userID}" class="btn btn-outline-primary btn-sm">X</a>
			    							</c:if>
			    						</div>
			    					</td>
				    			</tr>
		    				</c:forEach>
		    			</tbody>
		    		</table>
		    	</div>
	    	</div>
        </div>
        <div class="row">
            <div class="col-sm-12">

            </div>
        </div>
    </div>
    <%@ include file="../modal.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@ include file="../header.jsp" %>
    <title>Handas</title>
</head>
<body>
	<div class="container">
		<%@ include file="../menu.jsp" %>
		<div class="row">
            <div class="col-sm-12">
                
            </div>
        </div>
        <div class="row" style="margin-top: 50px;">
            <div class="col-sm-12" style="padding: 0;">
                <div class="jumbotron join_form">
                    <h1 style="font-size: 1.6em; font-weight: bold; text-align: center; padding-bottom: 10px;">회원정보수정</h1>
                    <form action="update" method="post"> 
                        <table class="table table-hover">
                            <tr>
                                <th>아이디</th>
                                <td><input type="text" class="form-control join_id" name="userID" id="join_id" value="${dto.userID }" readOnly></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td><input type="password" class="form-control join_pw1" name="userPW" onKeyUp="pw_check()" id="text" value="${dto.userPW }"></td>
                            	<td><input type="button" class="btn btn-primary pw_view_btn" onclick="pw_view()" value="비밀번호보기"></td>
                            </tr>
                            <tr>
                                <th>비밀번호 확인</th>
                                <td><input type="password" class="form-control join_pw2" onKeyUp="pw_check()" id="text" value="${dto.userPW }"></td>
                                <td class="pw_check"></td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" class="form-control join_name" name="userName" id="text" value="${dto.userName }"></td>
                            	<td></td>
                            </tr>
                            <tr>
                                <th rowspan="3">주소</th>
                                <td><input type="text" class="form-control join_addr1" name="address1" id="text" placeholder="우편번호" value="${dto.address1 }"></td>
                                <td><input type="button" class="btn btn-primary addr_check_btn" onclick="addr_check()" value="우편번호찾기"></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="text" class="form-control join_addr2" name="address2" id="text" placeholder="주소" value="${dto.address2 }"></td>
                            </tr>
                            <tr>
                            	<td colspan="2"><input type="text" class="form-control join_addr3" name="address3" id="text" placeholder="상세주소" value="${dto.address3 }"></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input type="email" class="form-control join_email" name="userEmail" id="text" value="${dto.userEmail }"></td>
                            	<td></td>
                            </tr>
                        </table>
                        <div class="join_btn_group">
                            <input type="submit" class="btn btn-primary join_btn" id="join_btn" onClick="update_check()" value="수정하기">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
            </div>
        </div>
    </div>
    
    
    <%@ include file="../footer.jsp" %>
</body>
</html>
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
                <div class="userRead_form" style="border: 1px solid #d9d9d9">
                    <h1 style="font-size: 1.6em; font-weight: bold; text-align: center; padding-bottom: 10px;">회원정보</h1>
                    <form action="update" method="post"> 
                        <table class="table table-hover">
                            <tr>
                                <th>아이디</th>
                                <td><input type="text" class="form-control join_id" name="userID" id="join_id" value="${dto.userID }" readOnly></td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" class="form-control join_name" name="userName" id="text" value="${dto.userName }" readOnly></td>
                            </tr>
                            <tr>
                                <th rowspan="3">주소</th>
                                <td><input type="text" class="form-control join_addr1" name="address1" id="text" placeholder="우편번호" value="${dto.address1 }" readOnly></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="text" class="form-control join_addr2" name="address2" id="text" placeholder="주소" value="${dto.address2 }" readOnly></td>
                            </tr>
                            <tr>
                            	<td colspan="2"><input type="text" class="form-control join_addr3" name="address3" id="text" placeholder="상세주소" value="${dto.address3 }" readOnly></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input type="email" class="form-control join_email" name="userEmail" id="text" value="${dto.userEmail }" readOnly></td>
                            </tr>
                        </table>
                        <div class="join_btn_group">
                            <a href="updateForm" class="btn btn-primary updateForm_btn">회원정보 수정하기</a>
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
    
    
    <%@ include file="../modal.jsp" %>
</body>
</html>
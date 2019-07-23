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
                <div class="jumbotron login_form">
                    <h1 style="font-size: 1.6em; font-weight: bold; text-align: center; padding-bottom: 10px;">로그인</h1>
                    <form action="login" method="post">
                        <div class="form-group">
                            <label for="text">아이디</label>
                            <input type="text" class="form-control login_id" name="userID" id="text" maxlength="20">
                        </div>
                        <div class="form-group">
                            <label for="pwd">비밀번호</label>
                            <input type="password" class="form-control login_pw" name="userPW" id="pwd" maxlength="20">
                        </div>
                        <div class="form-group form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox"> 아이디 기억하기
                            </label>
                        </div>
                        <button type="submit" onclick="login()" class="btn btn-primary form-control login_btn">로그인하기</button>
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
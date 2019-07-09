<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>menu</title>
</head>
<body>
	<div class="row">
        <div class="col-sm-12 header" style="padding: 0;">
            <div class="navbar navbar-expand-md navbar-dark">
                <!-- Brand -->
                <a class="navbar-brand logo" href="/handas/index"><img src="/handas/resources/images/s_images/Handas.png"></a>
                
                <!-- Toggler/collapsibe Button -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span><img src="/handas/resources/images/s_images/menu_18dp.png" alt=""></span>
                </button>
                
                <!-- Navbar links -->
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="nav nav-tabs nav-justified" style="width: 300px;">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="">메인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/handas/shop/list">상품목록</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/handas/bbs/list">고객센터</a>
                        </li>
                    </ul>
                    <!-- Dropdown -->
                    <div class="nav-item dropdown">
                    	<c:choose>
                    		<c:when test="${sessionScope.userID eq null }">
		                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		                        접속하기
		                        </a>
		                        <div class="dropdown-menu">
		                            <a class="dropdown-item" href="/handas/user/loginForm">로그인</a>
		                            <a class="dropdown-item" href="/handas/user/joinForm">회원가입</a>
		                        </div>
		                    </c:when>
		                    <c:otherwise>
		                    	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		                        회원관리
		                        </a>
		                        <div class="dropdown-menu">
		                            <a class="dropdown-item" href="/handas/user/read">회원정보보기</a>
		                            <a class="dropdown-item" href="/handas/user/logout">로그아웃</a>
		                        </div>
		                    </c:otherwise>
		                </c:choose>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</body>
</html>
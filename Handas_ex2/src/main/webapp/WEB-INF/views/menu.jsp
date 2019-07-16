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
                <a class="navbar-brand logo" href="${path }/index"><img src="${path }/resources/images/s_images/Handas.png"></a>
                
                <!-- Toggler/collapsibe Button -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span><img src="${path }/resources/images/s_images/menu_18dp.png" alt=""></span>
                </button>
                
                <!-- Navbar links -->
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="nav nav-tabs nav-justified" style="width: 300px;">
                        <li class="nav-item">
                        	<c:if test="${menu eq 'index'}">
                        		<a class="nav-link active" href="${path }/index" >메인</a>
                        	</c:if>
                            <c:if test="${menu ne 'index'}">
                        		<a class="nav-link " href="${path }/index" >메인</a>
                        	</c:if>
                        </li>
                        <li class="nav-item">
                        	<c:if test="${menu eq 'shop'}">
                        		<a class="nav-link active" href="${path }/shop">상품목록</a>
                        	</c:if>
                            <c:if test="${menu ne 'shop'}">
                        		<a class="nav-link" href="${path }/shop">상품목록</a>
                        	</c:if>
                        </li>
                        <li class="nav-item">
                        	<c:if test="${menu eq 'bbs'}">
                        		<a class="nav-link active" href="${path }/bbs">고객센터</a>
                        	</c:if>
                            <c:if test="${menu ne 'bbs'}">
                        		<a class="nav-link" href="${path }/bbs">고객센터</a>
                        	</c:if>
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
		                            <a class="dropdown-item" href="${path }/user/loginForm">로그인</a>
		                            <a class="dropdown-item" href="${path }/user/joinForm">회원가입</a>
		                        </div>
		                    </c:when>
		                    <c:otherwise>
		                    	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		                        <c:if test="${sessionScope.role eq 'admin' }">
		                        <img style="width: 17px;" src="${path}/resources/images/s_images/admin.png"> 
		                        </c:if>
		                        <c:if test="${sessionScope.role ne 'admin' }">
		                        <img style="width: 17px;" src="${path}/resources/images/s_images/user.png"> 
		                        </c:if>
		                        &nbsp;${sessionScope.userID } 님
		                        </a>
		                        <div class="dropdown-menu">
		                       	 	<a class="dropdown-item" href="${path }/shop/cartForm">장바구니</a>
		                            <a class="dropdown-item" href="${path }/user/read">회원정보보기</a>
		                            <a class="dropdown-item" href="${path }/user/logout">로그아웃</a>
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
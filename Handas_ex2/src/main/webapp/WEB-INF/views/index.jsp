<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@ include file="header.jsp" %>
    <title>Handas</title>
</head>
<body>
	<div class="container">
		<div class="row message">
        </div>
		<%@ include file="menu.jsp" %>
		<div class="row">
            <div class="col-sm-12" id="test">
                
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div id="demo" class="carousel slide" data-ride="carousel">

                    <!-- Indicators -->
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                    </ul>
                    
                    <!-- The slideshow -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                        <img src="${path }/resources/images/s_images/bxslider1.png" alt="">
                        </div>
                        <div class="carousel-item">
                        <img src="${path }/resources/images/s_images/bxslider2.png" alt="">
                        </div>
                        <div class="carousel-item">
                        <img src="${path }/resources/images/s_images/bxslider3.png" alt="">
                        </div>
                    </div>
                    
                    <!-- Left and right controls -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                    
                 </div>
                 <div id="sub_slider" style="display:flex; flex-flow: row nowrap">
                 	<div style="width: 33.33%; height: 210px; background: red;">
                 		<iframe style="width: 100%; height: 210px;" src="https://www.youtube.com/embed/BIbTM4bZHUM?list=PLhVQllHgkD4a9pes__-_PSdN-5uhVCEfX" frameborder="0" allowfullscreen></iframe>
                 	</div>
                 	<div style="width: 33.33%; height: 210px; background: blue;">
                 		<iframe style="width: 100%; height: 210px;" src="https://www.youtube.com/embed/BIbTM4bZHUM?list=PLhVQllHgkD4a9pes__-_PSdN-5uhVCEfX" frameborder="0" allowfullscreen></iframe>
                 	</div>
                 	<div style="width: 33.33%; height: 210px; background: yellow;">
                 		<iframe style="width: 100%; height: 210px;" src="https://www.youtube.com/embed/BIbTM4bZHUM?list=PLhVQllHgkD4a9pes__-_PSdN-5uhVCEfX" frameborder="0" allowfullscreen></iframe>
                 	</div>
                 </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
            </div>
        </div>
    </div>
    
    <%@ include file="modal.jsp" %>
</body>
</html>
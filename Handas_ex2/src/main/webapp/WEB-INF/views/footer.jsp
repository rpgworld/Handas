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
	<div class="footer">
		<p style="padding-top: 20px;">copyright&copy;1995.주식회사 한다스 </p>
		<p>대표이사 강백호, 서울 영등포구 양평로 21길 10 한다스빌딩 </p>
		<p>사업자등록번호 : 117-82-04549 통신판매업신고 : 제 2010-영등포-0281호</p>
		<p style="padding-bottom: 20px;">이메일 : rpgworld@naver.com 개인정보 보호책임자 : 락토프리</p>
    </div>

	<!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        
            <!-- Modal body -->
            <div class="modal-body">
            </div>
        
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        
            </div>
        </div>
    </div>
    
    
	<div class="toast " data-autohide="false" style="z-index: 30; position: absolute;">
		<div class="toast-header">
			<strong class="mr-auto text-primary"></strong>
    		<button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
		</div>
		<div class="toast-body">
		</div>
	</div>
</body>
</html>
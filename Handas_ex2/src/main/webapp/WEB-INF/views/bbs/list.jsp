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
<style>
.bbsList, .bbsList_bottom {
width: 80%;
margin: 0 auto;
}
.bbsList {
margin-top: 30px;
}
.bbsList table th {
border-top: none; 
border-bottom: none;
}
</style>
<script>
var userID = '${sessionScope.userID}';

$('document').ready(function(){
	// 글쓰기 버튼 클릭시
	$('#bbsWriteForm_btn').click(function(){
		if(userID == '') {
			msgType = '글쓰기 권한이 없습니다.';
			msgContent = '글쓰기는 로그인 상태에서 가능합니다. <br><br> 이동하시겠습니까?  <a href="${path}/user/loginForm">로그인페이지 이동하기</a>';
			modal_alert(msgType, msgContent);
			return false;
		}
		
		window.location.href = '${path}/bbs/writeForm';
	});
});

</script>
</head>
<body>
	<div class="container">
		<%@ include file="../menu.jsp" %>
		<div class="row">
            <div class="col-sm-12">
                
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
            	<div class="bbsList">
	            	<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link active" href="#">전체</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">상품</a>
						</li>
						<li class="nav-item">
					    	<a class="nav-link" href="#">배송</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">환불</a>
						</li>
					</ul>
		    		<table class="table table-striped">
		    			<thead>
		    				<tr>
		    					<th>글번호</th>
		    					<th>제목</th>
		    					<th>작성자</th>
		    					<th>작성일</th>
		    					<th>조회수</th>
		    				</tr>
		    			</thead>
		    				<c:forEach items="${bbsList }" var="list">
		    					<tr>
			    					<td>${list.bnum }</td>
			    					<td class="bbs_title"><a href="${path}/bbs/read?bnum=${list.bnum}">${list.title }</a></td>
			    					<td>${list.writer }</td>
			    					<td>${list.writeDate }</td>
			    					<td>${list.hit }</td>
				    			</tr>
		    				</c:forEach>
		    			</tbody>
		    		</table>
		    	</div>
	    	</div>
        </div>
        <div class="row">
            <div class="col-sm-12">
            	<div class="bbsList_bottom">
	            	<div style="display: flex; justify-content: flex-end;">
	                	<input type="button" id="bbsWriteForm_btn" class="btn btn-primary" value="글쓰기">
	                </div>
	            	<div style="display: flex; justify-content: center; margin-top: 15px;">
	               		<ul class="pagination">
	               			<c:if test="${paging.curPage eq 1 }">
	               				<li class="page-item disabled"><a class="page-link" href="${path }/bbs/list?curPage=${paging.curPage - 1}">Previous</a></li>
	               			</c:if>
	               			<c:if test="${paging.curPage ne 1 }">
	               				<li class="page-item"><a class="page-link" href="${path }/bbs/list?curPage=${paging.curPage - 1}">Previous</a></li>
	               			</c:if>
	                		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }" >
	                			<c:if test="${paging.curPage eq i }">
	                				<li class="page-item active"><a class="page-link" href="${path }/bbs/list?curPage=${i}">${i }</a></li>
	                			</c:if>
	                			<c:if test="${paging.curPage ne i }">
	                				<li class="page-item"><a class="page-link" href="${path }/bbs/list?curPage=${i}">${i }</a></li>
	                			</c:if>
	                		</c:forEach>
	               			<c:if test="${paging.curPage eq paging.totalPage }">
	               				<li class="page-item disabled"><a class="page-link" href="${path }/bbs/list?curPage=${paging.curPage + 1}">Next</a></li>
	               			</c:if>
	               			<c:if test="${paging.curPage ne paging.totalPage }">
	               				<li class="page-item"><a class="page-link" href="${path }/bbs/list?curPage=${paging.curPage + 1}">Next</a></li>
	               			</c:if>
	               		</ul> 
	               	</div>
	            </div>
            </div>
        </div>
    </div>
    <%@ include file="../modal.jsp" %>
</body>
</html>
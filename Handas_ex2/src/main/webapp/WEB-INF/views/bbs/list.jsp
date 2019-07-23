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
text-align: center;
}
.bbsList th:first-child {
width: 10%;
}
.bbsList th:nth-child(2), .bbsList th:nth-child(4) {
width: 30%;
}
.bbsList th:nth-child(3) {
width: 16%;
}
.bbsList th:last-child {
width: 14%;
}
.bbsList table td {
text-align: center;
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
							<c:if test="${sessionScope.category eq 'all' }">
								<a class="nav-link active" href="${path }/bbs/list">전체</a>
							</c:if>
							<c:if test="${sessionScope.category ne 'all' }">
								<a class="nav-link" href="${path }/bbs/list">전체</a>
							</c:if>
						</li>
						<li class="nav-item">
							<c:if test="${sessionScope.category eq 'product' }">
								<a class="nav-link active" href="${path }/bbs/list?category=product">상품</a>
							</c:if>
							<c:if test="${sessionScope.category ne 'product' }">
								<a class="nav-link" href="${path }/bbs/list?category=product">상품</a>
							</c:if>
						</li>
						<li class="nav-item">
							<c:if test="${sessionScope.category eq 'shipping' }">
					    		<a class="nav-link active" href="${path }/bbs/list?category=shipping">배송</a>
							</c:if>
							<c:if test="${sessionScope.category ne 'shipping' }">
					    		<a class="nav-link" href="${path }/bbs/list?category=shipping">배송</a>
							</c:if>
						</li>
						<li class="nav-item">
							<c:if test="${sessionScope eq 'refund' }">
								<a class="nav-link active" href="${path }/bbs/list?category=refund">환불</a>
							</c:if>
							<c:if test="${sessionScope ne 'refund' }">
								<a class="nav-link" href="${path }/bbs/list?category=refund">환불</a>
							</c:if>
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
			    					<td class="bbs_title" style="text-align: left;">
			    						<c:if test="${list.secret == 1 }"><i class="fas fa-lock" ></i>&nbsp;</c:if>
			    						<c:if test="${list.lev > 0 }">└&nbsp;</c:if>
			    						<a href="${path}/bbs/read?bnum=${list.bnum}&writer=${list.writer }&secret=${list.secret }">${list.title }</a>
			    					</td>
			    					<td>
			    						<c:if test="${list.lev > 0 }">
			    							관리자
			    						</c:if>
			    						<c:if test="${list.lev eq 0 }">
			    							${list.writer }
			    						</c:if>	
			    					</td>
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
	               				<li class="page-item disabled"><a class="page-link" href="${path }/bbs/list?curPage=${paging.curPage - 1}&category=${paging.category }">Previous</a></li>
	               			</c:if>
	               			<c:if test="${paging.curPage ne 1 }">
	               				<li class="page-item"><a class="page-link" href="${path }/bbs/list?curPage=${paging.curPage - 1}&category=${paging.category }">Previous</a></li>
	               			</c:if>
	                		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }" >
	                			<c:if test="${paging.curPage eq i }">
	                				<li class="page-item active"><a class="page-link" href="${path }/bbs/list?curPage=${i}&category=${paging.category }">${i }</a></li>
	                			</c:if>
	                			<c:if test="${paging.curPage ne i }">
	                				<li class="page-item"><a class="page-link" href="${path }/bbs/list?curPage=${i}&category=${paging.category }">${i }</a></li>
	                			</c:if>
	                		</c:forEach>
	               			<c:if test="${paging.curPage eq paging.totalPage }">
	               				<li class="page-item disabled"><a class="page-link" href="${path }/bbs/list?curPage=${paging.curPage + 1}&category=${paging.category }">Next</a></li>
	               			</c:if>
	               			<c:if test="${paging.curPage ne paging.totalPage }">
	               				<li class="page-item"><a class="page-link" href="${path }/bbs/list?curPage=${paging.curPage + 1}&category=${paging.category }">Next</a></li>
	               			</c:if>
	               		</ul> 
	               	</div>
	            </div>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</body>
</html>
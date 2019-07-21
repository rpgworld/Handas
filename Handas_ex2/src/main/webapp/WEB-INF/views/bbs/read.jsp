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

#read_form, #read_bottom {
width: 70%;
margin: 0 auto;
}

#read_form table {
width: 100%;
}
#read_form table th{
width: 20%;
text-align: center;
vertical-align: middle;
}
#read_form table td{
width: 30%;
}
#read_form textarea{
resize: none;
height : 250px;
}

#read_bottom {
display: flex;
justify-content: space-between;
}
#read_bottom div:last-child .btn {
margin-left: 10px;
}

</style>
<script>
var userID = '${sessionScope.userID}';
var writer = '${dto.writer}';

$('document').ready(function(){
	// 업데이트 버튼 클릭 이벤트
	$('#read_update').click(function(){
		if(userID != writer) {
			model_alert('경고창', '해당 글수정 권한이 없습니다.');
			return false;
		}
	})
	
	// 삭제 버튼 클릭 이벤트
	$('#read_delete').click(function(){
		if(userID != writer) {
			model_alert('경고창', '해당 글삭제 권한이 없습니다.');
			return false; 
		}
	})
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
            	<div id="read_form">
	            	<form action="delete" method="get">
	            		<table class="table table-bordered">
	            			<tr>
	            				<th>카테고리</th>
	            				<td>
	            					<c:choose>
	            						<c:when test="${dto.category == 'product' }">
	            							상품
	            						</c:when>
	            						<c:when test="${dto.category == 'shipping' }">
	            							배송
	            						</c:when>
	            						<c:when test="${dto.category == 'refund' }">
	            							환불
	            						</c:when>
	            						<c:otherwise>
	            							전체
	            						</c:otherwise>
	            					</c:choose>
	            				</td>
	            				<th colspan="2">
		            				<div class="form-check-inline">
										<label class="form-check-label">
											비밀글 체크&nbsp;&nbsp;<input style="margin-top: 3px;" type="checkbox" name="secret" class="form-check-input" value="1" ${dto.secret == 1 ? 'checked' : '' } disabled>
										</label>
									</div>
		            			</th>
	            			</tr>
	            			<tr>
	            				<th>글제목</th>
	            				<td>${dto.title }</td>
	            				<th>작성일자</th>
	            				<td>${dto.getWriteDate() }</td>
	            			</tr>    
	            			<tr>
	            				<th>작성자</th>
	            				<td>${dto.writer }</td>
	            				<th>조회수</th>
	            				<td>${dto.hit }</td>
	            			</tr> 
	            			<tr>
	            				<th>내용</th>
	            				<td colspan="3"><textarea class="form-control" name="content" disabled>${dto.content }</textarea></td>
	            			</tr>            		
	            		</table>
		            </form>
		         </div>
		         <div id="read_bottom">
		         	<div><a href="${path }/bbs/list" class="btn btn-primary">목록으로</a></div>
		         	<div>
			         	<a href="${path }/bbs/updateForm?bnum=${dto.bnum}&writer=${dto.writer}" class="btn btn-primary" id="read_update">수정하기</a>
			         	<a href="${path }/bbs/delete?bnum=${dto.bnum}&writer=${dto.writer}" class="btn btn-primary" id="read_delete">삭제하기</a>
			         	<c:if test="${sessionScope.role == 'admin' }">
			         		<a href="${path }/bbs/replyForm?bnum=${dto.bnum}&ref=${dto.ref}" class="btn btn-primary">답글달기</a>
			         	</c:if>
			         </div>
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
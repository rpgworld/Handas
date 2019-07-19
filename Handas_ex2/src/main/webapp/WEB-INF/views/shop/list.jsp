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
<script>
var curPage = ${paging.curPage};

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
            <div class="col-sm-12 items_list">
                <ul>
                	<c:forEach items="${list }" var="dto">
                		<li>
	                        <div class="card" style="border: none;">
	                            <a href="${path }/shop/read?pnum=${dto.pnum }"><img class="card-img-top rounded" style="border: 1px solid #d9d9d9;" src="/resources/images/shop_images/${dto.img}" alt="Card image"></a>
	                            <div class="card-body">
	                                <h3 class="card-title"><a style="color:#000000; text-decoration:none; font-weight: bold;" href="${path }/shop/read?pnum=${dto.pnum }">${dto.pname }</a><c:if test="${dto.dateDiff < 30}">&nbsp;<span class="badge badge-primary">New</span></c:if><c:if test="${dto.totalVol < 1 }">&nbsp;<span class="badge badge-danger">품절</span></c:if></h3>
	                                <p class="card-text">${dto.getPriceFormat() }원</p>
	                            </div>
	                        </div>
	                    </li>
                	</c:forEach>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
            	<div style="display: flex; justify-content: flex-end;">
                	
                	<c:if test="${sessionScope.role == 'admin' }">
                		<a href="${path }/shop/writeForm" class="btn btn-primary">상품등록</a>
                	</c:if>
                	
                </div>
            	<div style="display: flex; justify-content: center; margin-top: 15px;">
               		<ul class="pagination">
               			<c:if test="${paging.curPage eq 1 }">
               				<li class="page-item disabled"><a class="page-link" href="${path }/shop/list?curPage=${paging.curPage - 1}">Previous</a></li>
               			</c:if>
               			<c:if test="${paging.curPage ne 1 }">
               				<li class="page-item"><a class="page-link" href="${path }/shop/list?curPage=${paging.curPage - 1}">Previous</a></li>
               			</c:if>
                		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }" >
                			<c:if test="${paging.curPage eq i }">
                				<li class="page-item active"><a class="page-link" href="${path }/shop/list?curPage=${i}">${i }</a></li>
                			</c:if>
                			<c:if test="${paging.curPage ne i }">
                				<li class="page-item"><a class="page-link" href="${path }/shop/list?curPage=${i}">${i }</a></li>
                			</c:if>
                		</c:forEach>
               			<c:if test="${paging.curPage eq paging.totalPage }">
               				<li class="page-item disabled"><a class="page-link" href="${path }/shop/list?curPage=${paging.curPage + 1}">Next</a></li>
               			</c:if>
               			<c:if test="${paging.curPage ne paging.totalPage }">
               				<li class="page-item"><a class="page-link" href="${path }/shop/list?curPage=${paging.curPage + 1}">Next</a></li>
               			</c:if>
               		</ul> 
               	</div>
            </div>
        </div>
    </div>
    <%@ include file="../modal.jsp" %>
</body>
</html>
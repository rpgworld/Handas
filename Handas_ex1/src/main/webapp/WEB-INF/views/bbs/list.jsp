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
        <div class="row">
            <div class="col-sm-12">
            	<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" href="#">전체</a>
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
		    					<td class="bbs_title">${list.title }</td>
		    					<td>${list.writer }</td>
		    					<td>${list.writeDate }</td>
		    					<td>${list.hit }</td>
			    			</tr>
	    				</c:forEach>
	
	    			</tbody>
	    		</table>
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
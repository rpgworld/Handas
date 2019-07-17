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

</style>
</head>
<body>
	<div class="container">
		<%@ include file="../menu.jsp" %>
		<div class="row">
            <div class="col-sm-12">
                
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 user_list">
                <div class="bbsList">
		    		<table class="table table-striped">
		    			<thead>
		    				<tr>
		    					<th>날짜</th>
		    					<th></th>
		    					<th>상품</th>
		    					<th>총금액</th>
		    					<th>비고</th>
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
    </div>
    <%@ include file="../modal.jsp" %>
</body>
</html>
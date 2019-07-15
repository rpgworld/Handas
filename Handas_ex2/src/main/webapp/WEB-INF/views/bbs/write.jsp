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
#write_form, #write_btn_group{
width: 60%;
margin: 0 auto;
}
#write_form table{
width: 100%;
}
#write_form table th{
text-align: center;
padding: 20px 0;
vertical-align: middle;
}
#write_form input[type=text] {
width: 95%;
height: 25px;
}
#write_form tr td {
padding: 10px;
}
#write_form textarea {
resize: none;
width: 100%;
height: 300px;
}
#write_btn_group {
display: flex;
justify-content: flex-end;
}
#write_btn_group input {
margin-top: 10px;
}
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
            <div class="col-sm-12">
            	<form action="write" method="get">
            	<div id="write_form">
	            	<table class="table-bordered">
	            		<tr>
	            			<th>제목</th>
	            			<td><input type="text" class="form-control" name="title"></td>
	            		</tr>
	            		<tr>
	            			<th>내용</th>
	            			<td><textarea class="form-control" name="content"></textarea></td>
	            		</tr>
	            	</table>
	            </div>
	            <div id="write_btn_group">
	            	<input type="submit" class="btn btn-primary" value="글쓰기">
	            </div>
	            </form>
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
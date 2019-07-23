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
var maxUploadSize = 10485760;

$('document').ready(function(){
	$('#file').change(function(){
		if($('#file').val() != null) {
			if($('#file')[0].files[0].size > maxUploadSize) {
				modal_alert('경고창', '첨부 파일 용량은 10메가 바이트 이내로 등록가능 합니다.');
				$('#file')[0].value = '';
			}
		}
	});
});

</script>

<style>
.writeForm {
width: 50%;
margin: 0 auto;
margin-top: 30px;
}
.writeForm table {
border: 1px solid #d9d9d9;
}
.writeForm h1 {
text-align: center;
font-size: 1.6em;
font-weight: bold;
}
.writeForm th {
text-align: center;
vertical-align: middle;
}
.writeForm td input {
height: 27px;
width: 85%;
}
.writeForm textarea {
height: 170px;
}
.writeForm .write_btn {
width: 100%;
display: flex;
justify-content: flex-end;
padding-right: 10px;
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
         	<div class="col-sm-12 shop">
				<form action="write" method="post" enctype="multipart/form-data" class="writeForm">
					
					<table class="table table-striped">
						<tr>
							<td colspan="2" class="table-primary"><h1>상품등록</h1></td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input type="text" class="form-control" id="pname" name="pname"></td>
						</tr>
						<tr>
							<th>옵션</th>
							<td><input type="text" class="form-control" id="item" name="item"></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><input type="text" class="form-control" id="price" name="price"></td>
						</tr>
						<tr>
							<th>재고수량</th>
							<td><input type="text" class="form-control" id="volume" name="totalVol"></td>
						</tr>
						<tr>
							<th>이미지</th>
							<td><input type="file" class="form-control" id="file" name="file"></td>
						</tr>
						<tr>
							<th>상세설명</th>
							<td><textarea class="form-control" id="pdesc" name="pdesc" style="resize: none;"></textarea></td>
						</tr>
					</table>
					<div class="write_btn" >
						<button type="submit" class="btn btn-primary">상품등록</button>
					</div>
				</form>
	        </div>
	    </div>
	    <div class="row">
            <div class="col-sm-12">
                
            </div>
        </div>
	</div>
    <%@ include file="../footer.jsp" %>
</body>
</html>
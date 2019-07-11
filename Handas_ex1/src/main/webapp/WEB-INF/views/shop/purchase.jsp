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
        <div class="row" style="margin-top: 50px;">
            <div class="col-sm-12" style="padding: 0;">
                <div class="jumbotron join_form">
                    <h1 style="font-size: 1.6em; font-weight: bold; text-align: center; padding-bottom: 10px;">배송지</h1>
                    <form action="join" method="post"> 
                        <table class="table table-hover">
                            <tr>
                                <th>받으시는분</th>
                                <td><input type="text" class="form-control join_name" name="userName" id="text"></td>
                            	<td></td>
                            </tr>
                            <tr>
                                <th rowspan="3">주소</th>
                                <td><input type="text" class="form-control join_addr1" name="address1" id="address1" placeholder="우편번호"></td>
                                <td><input type="button" class="btn btn-primary addr_check_btn" onclick="addr_check()" id="addr_btn" value="우편번호찾기"></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="text" class="form-control join_addr2" name="address2" id="address2" placeholder="주소"></td>
                            </tr>
                            <tr>
                            	<td colspan="2"><input type="text" class="form-control join_addr3" name="address3" id="text" placeholder="상세주소"></td>
                            </tr>
                            <tr>
                                <th>전화</th>
                                <td><input type="email" class="form-control join_email" name="userEmail" id="text"></td>
                            	<td></td>
                            </tr>
                            <tr>
                            	<th>배송메시지</th>
                            	<td colspan="2"><input type="text" class="form-control join_addr3" name="address3" id="text" placeholder=""></td>
                            </tr>
                        </table>
                        <div class="join_btn_group">
                            <input type="button" class="btn btn-primary join_btn" id="join_btn" onClick="read_purchase()" value="결제하기">
                        </div>
                    </form>
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
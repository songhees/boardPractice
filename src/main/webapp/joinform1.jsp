<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>song board</title>
<style type="text/css">
	form > div {
		padding: 10px;
		border-bottom: 1px solid #D3D3D3;
	}
</style>
</head>
<body>
<%@ include file="common/navbar.jsp" %>
<div class="container">    
	<div class="p-5 border-bottom">
		<h4 class="text-center"><strong>JOIN</strong></h4>
	</div>
	<div class="text-align: center mx-3">
		<form method="post" action="join.jsp">
			<div class="row border-top mt-4">
				<label for="user-id" class="col-sm-1 col-form-label col-form-label-sm">아이디</label>
		   		<div class="col-sm-4">
		      		<input type="password" class="form-control form-control-sm" id="user-id" name="id">
		    	</div>
			</div>
			<div class="row">
				<label for="user-password" class="col-sm-1 col-form-label col-form-label-sm">비밀번호</label>
		   		<div class="col-sm-4">
		      		<input type="password" class="form-control form-control-sm" id="user-password" name="password">
		    	</div>
			</div>
			<div class="row">
				<label for="user-name" class="col-sm-1 col-form-label col-form-label-sm">이름</label>
		   		<div class="col-sm-4">
		      		<input type="text" class="form-control form-control-sm" id="user-name" name="name">
		    	</div>
			</div>
			<div class="row">
				<label for="user-tel" class="col-sm-1 col-form-label col-form-label-sm">전화번호</label>
		   		<div class="col-sm-4">
		      		<input type="text" class="form-control form-control-sm" id="user-tel" name="tel">
		    	</div>
			</div>
			<div class="row">
				<label for="user-email" class="col-sm-1 col-form-label col-form-label-sm">이메일</label>
		   		<div class="col-sm-4">
		      		<input type="text" class="form-control form-control-sm" id="user-email" name="email">
		    	</div>
			</div>
		</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
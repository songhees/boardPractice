<%@page import="com.sample.board.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>song board</title>
</head>
<body>
<%
	pageContext.setAttribute("menu", "home");
%>
<%@ include file="common/navbar.jsp" %>
<div class="container">    
	<div class="row">
		<div class="col">
			<div class="p-5 mb-4 bg-dark rounded-3">
				<div class="container-fluid py-5 text-light">
					<h2><strong>songhee의 게시판입니다.</strong></h2>
					<p>코딩 위주의 게시글이 있습니다.</p>
<%
	if (loginUserInfo == null) {
%>
					<div class="m-4">
						<a href="loginform.jsp" class="btn btn-light btn-outline-dark btn-lg"><strong>LOGIN</strong></a>
						<a href="joinform.jsp" class="btn btn-light btn-outline-dark btn-lg"><strong>JOIN US</strong></a>
					</div>
<%
	} else {
%>
					<div class="m-4">
						<p><strong><%=loginUserInfo.getName() %></strong>님 환영합니다.</p>
					</div>
<%
	}
%>
				</div>
			</div>
		</div>
	</div>

<%
	String register = request.getParameter("register");

	if ("completed".equals(register)) {
%>
	<div class="row mb-3">
		<div class="col">
			<div class="alert alert-dark">
				<strong>회원가입 완료</strong> 회원가입이 완료되었습니다.
			</div>
		</div>
	</div>
<%
	}
%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
	
</html>
<%@page import="com.sample.board.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#navbar-1 {
		font-size: 13px;
	}
</style>
<%
	User loginUserInfo = (User)session.getAttribute("LOGIN_USER_INFO");
	String menu = (String)pageContext.getAttribute("menu");
%>
<nav class="navbar navbar-expand-sm navbar-light mb-3 border-bottom" style="font-weight: bold; background-color: #FFFAFA;">
	<div class="container">
		<a class="navbar-brand" href="/practice/index.jsp">Song</a>
		<button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbar-1">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbar-1">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a href="/practice/index.jsp" class="nav-link <%="home".equals(menu) ? "active" : "" %>">HOME</a></li>
				<li class="nav-item"><a href="/practice/board/list.jsp?pageNo=1" class="nav-link <%="board".equals(menu) ? "active" : "" %>">BOARD</a></li>
			</ul>
			<ul class="navbar-nav">
<%
	if (loginUserInfo == null) {
%>
				<li class="nav-item"><a href="/practice/loginform.jsp" class="nav-link <%="login".equals(menu) ? "active" : "" %>">LOGIN</a></li>
				<li class="nav-item"><a href="/practice/joinform.jsp" class="nav-link <%="joinUs".equals(menu) ? "active" : "" %>">JOIN US</a></li>
<%
	} else {
%>				
				<li class="nav-item"><a href="/practice/user/detail.jsp" class="nav-link text-dark <%="myPage".equals(menu) ? "active" : "" %>">MY PAGE</a></li>
				<li class="nav-item"><a href="/practice/logout.jsp" class="nav-link">LOGOUT</a></li>
<%
	}
%>
			</ul>
		</div>
	</div>
</nav>
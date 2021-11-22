<%@page import="com.sample.board.dao.UserDao"%>
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

	table th:first-child {
    border-left: 0;
}
	input[type=text], input[type=password] {
		line-height: 20px;
    	padding: 6px 4px;
   		border: 1px solid #d5d5d5;
    	font-size: 11px;
    	width: 400px;
}
	table tbody th {
    padding: 11px 0 10px 18px;
    border: 1px solid #ebebeb;
    color: #757575;
    text-align: left;
    font-weight: normal;
    background-color: #fbfafa;
}

	table td {
    border-top: 1px solid #ebebeb;
    border-bottom: 1px solid #ebebeb;
    vertical-align: middle;
    word-break: break-all;
    word-wrap: break-word;
}
 	th {
 		width: 200px;
 	}
 	
	table td {
   	 	padding: 8px 10px 7px;
  		width: 1000px;
}

</style>
</head>
<body>
<%
	pageContext.setAttribute("menu", "joinUs");
%>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
<%		
	
	if (loginUserInfo == null) {
		response.sendRedirect("../loginform.jsp?error=login-required");
		return;
	}

	UserDao userDao = UserDao.getInstance();	
	User user = userDao.getUserByNo(loginUserInfo.getNo());
%>    
	<div class="p-5 border-bottom">
		<h4 class="text-center"><strong>MY PAGE</strong></h4>
	</div>
	<div class="text-align: center mx-3">
		<form method="post" action="modify.jsp">
			<table class="mt-3">
				<tbody>
					<tr>
						<th>
							아이디
						</th>
						<td>
					      	<input type="text" id="user-id" name="id" value="<%=user.getId() %>">
					    </td>
					</tr>
					<tr>
						<th>
							비밀번호
						</th>
						<td>
					      	<input type="password" id="user-password" name="password">
						</td>					      	
					</tr>
					<tr>
						<th>
							이름
						</th>
						<td>
				      		<input type="text" id="user-name" name="name" value="<%=user.getName() %>">
						</td>
					</tr>
					<tr>
						<th>
							전화번호
						</th>
						<td>
					      	<input type="text" id="user-tel" name="tel" value="<%=user.getTel() %>">
						</td>
					</tr>
					<tr>
						<th>
							이메일
						</th>
						<td>
					      	<input type="text" id="user-email" name="email" value="<%=user.getEmail() %>">
						</td>					      	
					</tr>
					<tr>
						<th>
							가입일
						</th>
						<td>
					      	<input disabled="disabled" readonly="readonly" type="text" id="user-email" name="email" value="<%=user.getCreatedDate() %>" >
						</td>					      	
					</tr>
				</tbody>
			</table>
			<div class="p-4 text-end">
				<button type="submit" class="btn btn-dark">수정</button>
			</div>
		</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
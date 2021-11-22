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
	p {
		color: grey;
	}
	[href*='found'] {
		text-decoration: none;
		color: grey;
	}
	#formInput {
		width: 90%;
	}
</style>
</head>
<body>
	
<%
	pageContext.setAttribute("menu", "board");
	String error = request.getParameter("error");
%>
<%@ include file="../common/navbar.jsp" %>
<div class="container" id="formInput">    
	<div class="row bg-light border mt-5">
		<div class="m-4">
			<h3><strong>NEW BOARD</strong></h3>
		</div>
		<div class="col px-5">
<%
	if (loginUserInfo == null) {
		response.sendRedirect("../loginform.jsp?error=login-required");
		return;
	} else if ("empty-title".equals(error)) {
%>
			<div class="alert alert-dark">
				제목을 입력해 주세요.
			</div>

<%
	} else if ("empty-content".equals(error)) {
%>

			<div class="alert alert-dark">
				내용을 입력해 주세요.
			</div>
<%		
	}
%>
			<form method="post" action="register.jsp">
				<div class="mb-1">
					<!-- class="form-control"은 bootstap에서 form 에 대한 style을 지정한것을 쓰기 위해 사용 -->
					<label class="form-label" for="inputTitle">제목</label>
					<input type="text" name="title" class="form-control" id="inputTitle">
				</div>
				<div class="mb-3">
					<label class="form-label" for="inputContent">내용</label>
					<textarea rows="6" class="form-control" name="content"></textarea>
				</div>
				<div class="text-end pb-4">
					<a class="btn btn-secondary" href="list.jsp?pageNo=1">취소</a>
					<button type="submit" class="btn btn-dark">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@page import="java.util.List"%>
<%@page import="com.sample.board.vo.BoardLiker"%>
<%@page import="com.sample.board.vo.Board"%>
<%@page import="com.sample.board.dao.BoardDao"%>
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

	table tbody th {
    padding: 11px 0 10px 18px;
    color: #757575;
    font-weight: normal;
    background-color: #fbfafa;
}

	table td {
   	padding: 8px 10px 7px;
    border-top: 1px solid #ebebeb;
    border-bottom: 1px solid #ebebeb;
}
 	th {
 		border: 1px solid #ebebeb;
 		width: 200px;
 	}
 	
	table {
  		width: 99%;
  		margin: auto;
}
 	
 	
</style>
</head>
<body>
<%
	pageContext.setAttribute("menu", "board");
%>
<%@ include file="../common/navbar.jsp" %>
<%
	String pageNo = request.getParameter("pageNo");
	int boardNo = Integer.parseInt(request.getParameter("no"));
	
	BoardDao boardDao = BoardDao.getInstance(); 
	
	Board board =boardDao.getBoardByNo(boardNo);

%>
<div class="container"> 
	<div class="row">
		<div class="col">
			<div class="p-5 border-bottom">
				<h4 class="text-center"><strong>BOARD</strong></h4>
			</div>
		</div>
	</div>   
	<div class="row mt-3">
		<div class="col">
<%
	String error = request.getParameter("error");

	if ("deny-delete".equals(error)) {
%>
			<div class="alert alert-dark">
				자신이 작성한 글이 아닌 경우 수정할 수 없습니다.
			</div>
<%
	} else if ("deny-like".equals(error)) {
%>
			<div class="alert alert-dark">
				이미 추천한 글이거나 자신의 글은 추천할 수 없습니다.
			</div>
<%
	}
%>
			<table>
				<tbody>
					<tr class="d-flex">
						<th class="col-4">번호</th>
						<td class="col-8"><%=board.getNo() %></td>
					</tr>
					<tr class="d-flex">
						<th class="col-4">제목</th>
						<td class="col-8"><%=board.getTitle() %></td>
					</tr>
					<tr class="d-flex">
						<th class="col-4">작성자</th>
						<td class="col-8"><%=board.getWriter().getName() %></td>
					</tr>
					<tr class="d-flex">
						<th class="col-1">작성일</th>
						<td class="col-5"><%=board.getCreatedDate() %></td>
						<th class="col-1">조회수</th>
						<td class="col-2"><%=board.getViewCount() %></td>
						<th class="col-1">추천수</th>
						<td class="col-2"><%=board.getLikeCount() %>
<%
	if (board.getLikeCount() > 0) {
%>
							<button type="button" class="btn btn-dark btn-sm" data-bs-toggle="modal" data-bs-target="#likerModal">
								추천인
							</button>
<%
	}
%>
						</td>
						
					</tr>
					<tr class="d-flex">
						<th class="col-4">내용</th>
						<td class="col-8"><%=board.getContent() %></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row py-3">
		<div class="col">
			<div class="d-flex justify-content-between">
				<div>
<%
	if (loginUserInfo != null && loginUserInfo.getId().equals(board.getWriter().getId())) {
%>
				<a class="btn btn-outline-dark btn-sm" href="modify.jsp?no=<%=board.getNo() %>&pageNo=<%=pageNo %> ">수정</a>
				<a class="btn btn-outline-dark btn-sm" href="delete.jsp?no=<%=board.getNo() %>&pageNo=<%=pageNo %> ">삭제</a>
<%
	}
%>
<%
	if (loginUserInfo != null && !loginUserInfo.getId().equals(board.getWriter().getId())) {
		BoardLiker liker = boardDao.getBoardLiker(boardNo, loginUserInfo.getNo());
%>
				<a class="btn btn-outline-dark btn-sm <%=liker != null? "disabled" : "" %>" href="like.jsp?no=<%=board.getNo() %>&pageNo=<%=pageNo %> ">추천</a>
<%
	}
%>
				</div>
				<div>
				<a class="btn btn-outline-dark btn-sm" href="list.jsp?pageNo=<%=pageNo %>">목록</a>
				</div>
			</div>
		</div>
	</div>
</div>
<%
	List<User> likers = boardDao.getAllLikers(boardNo);
%>
<div class="modal" tabindex="-1" id="likerModal">
  	<div class="modal-dialog">
  		<div class="modal-content">
  			<div class="modal-body">
  				<div class="card bg-dark">
  					<div class="card-header fs-bold text-white">추천인</div>
  					<ul class="list-group">
 <%
 	for (User liker : likers) {
 %>
  								<li class="list-group-item"><%=liker.getName() %></li>
 <%
 	}
 %>
  					</ul>
  				</div>
  			</div>
  			<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
  			</div>
  		</div>
  	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
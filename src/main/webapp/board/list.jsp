<%@page import="com.sample.board.vo.Pagination"%>
<%@page import="com.sample.board.vo.Board"%>
<%@page import="java.util.List"%>
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

	table th {
    	padding: 11px 0 10px 18px;
	    color: #757575;
    	text-align: left;
	    font-weight: normal;
	    background-color: #fbfafa;
	}

	td {
    	border-top: 1px solid #e3e3e3;
    	border-bottom: 1px solid #e3e3e3;
		padding: 10px;
		padding-left: 18px;
	}
	
	[href*='detail'] {
		text-decoration: none;
		color: black;
	}
	table {
		width: 90%;
		margin: auto;
	}
 	
 	
</style>
</head>
<body>
<%
	pageContext.setAttribute("menu", "board");
%>
<%@ include file="../common/navbar.jsp" %>
<div class="container">    
<%
// 요청파라미터에서 pageNo값을 조회한다.
// 요청파라미터에 pageNo값이 존재하지 않으면 Pagination객체에서 1페이지로 설정한다.
	String pageNo = request.getParameter("pageNo");

// 게시글 정보 관련 기능을 제공하는 BoardDao객체를 획득한다.
	BoardDao boardDao = BoardDao.getInstance();

// 총 데이터 갯수를 조회한다.
	int totalRecords = boardDao.getTotalRecords();

// 페이징 처리 필요한 값을 계산하는 Paginatition객체를 생성한다.
	Pagination pagination = new Pagination(pageNo, totalRecords);

// 현재 페이지번호에 해당하는 게시글 목록을 조회한다.
	List<Board> boardList = boardDao.getAllBoards(pagination.getBegin(), pagination.getEnd());
%>
	<div class="p-5 border-bottom">
		<h4 class="text-center"><strong>BOARD</strong></h4>
	</div>
	<div class="row">
		<div class="col">
			<table class="mt-3">
				<thead>
					<tr class="">
						<th class="col-1">번호</th>
						<th class="col-5">제목</th>
						<th class="col-2">작성자</th>
						<th class="col-2">작성일</th>
						<th class="col-1">추천수</th>
						<th class="col-1">조회수</th>
					</tr>
				</thead>
				<tbody>
		<%
			if (boardList.isEmpty()) {
		%>
					<tr>
						<td class="text-center" colspan="6">게시글이 존재하지 않습니다.</td>
					</tr>
		<%		
			}
			for (Board board : boardList) {
		%>
					<tr>
						<td class="col-1"><%=board.getNo() %></td>
						<td class="col-5">
		<%
			if ("Y".equals(board.getDelete())) {
		%>
							<span><del>삭제된 글입니다.</del></span>
		<%
			} else {
		%>						
							<a href="detail.jsp?no=<%=board.getNo() %>&pageNo=<%=pageNo %>"><%=board.getTitle() %></a>
		<%
			}
		%>				
						</td>
						<td class="col-2"><%=board.getWriter().getName() %></td>
						<td class="col-2"><%=board.getCreatedDate() %></td>
						<td class="col-1"><%=board.getLikeCount() %></td>
						<td class="col-1"><%=board.getViewCount() %></td>
					</tr>
		<%
			}
		%>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mt-3">
		<div class="col-6 offset-3">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item <%=pagination.isExistPrev()? "" : "disabled" %>">
					    <a class="page-link" href="list.jsp?pageNo=<%=pagination.getPrevPage() %>" aria-label="Previous">
					    	<span aria-hidden="true">&laquo;</span>
					    </a>
				    </li>
<%
	for (int i = pagination.getBeginPage() ; i <= pagination.getEndPage() ; i++) {
%>				    
				    <li class="page-item"><a class="page-link" href="list.jsp?pageNo=<%=i %>"><%=i %></a></li>
<%
	}
%>
				    <li class="page-item <%=pagination.isExistNext()? "" : "disabled" %>">
					    <a class="page-link" href="list.jsp?pageNo=<%=pagination.getNextPage() %>" aria-label="Next">
					    	<span aria-hidden="true">&raquo;</span>
					    </a>
				    </li>
				</ul>
			</nav>
		</div>
<%
	if (loginUserInfo != null) {
%>
		<div class="col-3 text-end">
			<a class="btn btn-dark" href="form.jsp">새 글</a>
		</div>
<%
	}
%>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
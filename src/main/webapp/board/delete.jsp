<%@page import="com.sample.board.vo.Board"%>
<%@page import="com.sample.board.vo.User"%>
<%@page import="com.sample.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardNo = Integer.parseInt(request.getParameter("no"));
	String pageNo = request.getParameter("pageNo");
	
	User user = (User)session.getAttribute("LOGIN_USER_INFO");
	
	if (user == null) {
		response.sendRedirect("../loginform.jsp?error=login-required");
		return;
	}
	
	BoardDao boardDao = BoardDao.getInstance();

	Board board = boardDao.getBoardByNo(boardNo);
	
	if (board.getWriter().getNo() != user.getNo()) {
		response.sendRedirect("detail.jsp?no="+boardNo+"&pageNo="+pageNo+"&error=deny-delete");
		return;
	}
	boardDao.deleteBoard(boardNo);

	response.sendRedirect("list.jsp?pageNo=" + pageNo);
%>
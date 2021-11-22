<%@page import="com.sample.board.dao.BoardDao"%>
<%@page import="com.sample.board.vo.User"%>
<%@page import="com.sample.board.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	if (title != null && title.isBlank()) {
		response.sendRedirect("form.jsp?error=empty-title");
		return;
	} else if (content != null && content.isBlank()) {
		response.sendRedirect("form.jsp?error=empty-content");
		return;
	}
	
	User loginUser = (User)session.getAttribute("LOGIN_USER_INFO");
	
	if (loginUser == null) {
		response.sendRedirect("../loginform.jsp?error=login-required");
		return;
	}
	
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setWriter(loginUser);
	
	BoardDao boardDao = BoardDao.getInstance();
	boardDao.insertBoard(board);
	
	response.sendRedirect("list.jsp?pageNo=1");
%>
<%@page import="com.sample.board.vo.BoardLiker"%>
<%@page import="com.sample.board.vo.Board"%>
<%@page import="com.sample.board.dao.BoardDao"%>
<%@page import="com.sample.board.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNo = request.getParameter("pageNo");
	int boardNo = Integer.parseInt(request.getParameter("no"));
	
	User user = (User)session.getAttribute("LOGIN_USER_INFO");
	
	if (user == null) {
		response.sendRedirect("../loginform.jsp?error=login-required");
		return;
	}
	
	BoardDao boardDao = BoardDao.getInstance();

	Board foundBoard = boardDao.getBoardByNo(boardNo);
	
	if (foundBoard.getWriter().getNo() == user.getNo()) {
		response.sendRedirect("detail.jsp?no="+boardNo+"&pageNo="+pageNo+"&error=deny-like");
		return;
	}

	BoardLiker liker = new BoardLiker();
	
	liker = boardDao.getBoardLiker(boardNo, user.getNo());
	
	if (liker != null) {
		response.sendRedirect("detail.jsp?no="+boardNo+"&pageNo="+pageNo+"&error=deny-like");
		return;		
	}

	liker.setBoardNo(boardNo);
	liker.setUserNo(user.getNo());
	
	boardDao.insertBoardLiker(liker);
	
	foundBoard.setLikeCount(foundBoard.getLikeCount()+1);
	boardDao.updateBoard(foundBoard);
	
	response.sendRedirect("detail.jsp?no="+boardNo+"&pageNo="+pageNo);
%>
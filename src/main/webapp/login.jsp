<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="com.sample.board.vo.User"%>
<%@page import="com.sample.board.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	if (id != null && id.isBlank()) {
		response.sendRedirect("loginform.jsp?error=empty");
		return;
	}
	
	if (password != null && password.isBlank()) {
		response.sendRedirect("loginform.jsp?error=empty");
		return;
	}
	
	UserDao userDao = UserDao.getInstance();
	User user = userDao.getUserById(id);
	
	String secretPassword = DigestUtils.sha256Hex(password);
	
	if (user == null) {
		response.sendRedirect("loginform.jsp?error=notfound-user");
		return;
	}
	
	if (!secretPassword.equals(user.getPassword())) {
		response.sendRedirect("loginform.jsp?error=mismatch-password");
		return;
	}
	
	session.setAttribute("LOGIN_USER_INFO", user);
	response.sendRedirect("index.jsp?");
%>
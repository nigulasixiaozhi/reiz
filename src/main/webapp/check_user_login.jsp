<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Object object = session.getAttribute("userLogin");
	if (object == null) {
		response.sendRedirect("login_register");
	}
%>
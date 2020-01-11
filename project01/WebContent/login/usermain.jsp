<%@page import="member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	request.setCharacterEncoding("UTF-8");
    %>
<%
	response.setContentType("text/html; charset=UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	MemberDto dto = (MemberDto)session.getAttribute("dto");
%>
<body>

	<h1><%=dto.getName()%>님 환영합니다.</h1>
	<h1>내정보 조회</h1>
	<h1>내정보 수정</h1>
	<h1>회원탈퇴</h1>
</body>
</html>
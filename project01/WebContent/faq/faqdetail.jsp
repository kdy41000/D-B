<%@page import="board.dto.BoardDto"%>
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
	BoardDto dto = (BoardDto)request.getAttribute("dto");
%>
<body>
	<h1>Detail</h1>
	
	<table border="1">
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea row="10" cols="60" readonly="readonly"><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="location.href='faqcontroller.jsp?command=faqupdate&seq=<%=dto.getSeq() %>';"/>
				<input type="button" value="삭제" onclick="location.href='faqcontroller.jsp?command=faqdelete&seq=<%=dto.getSeq() %>';"/>
				<input type="button" value="목록" onclick="location.href='faqcontroller.jsp?command=faqlist';"/>
			</td>
		</tr>
	</table>
</body>
</html>
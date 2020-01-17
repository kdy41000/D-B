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
	<h1>수정</h1>
	
	<form action="faqcontroller.jsp" method="post">
	<input type="hidden" name="command" value="faqupdateres"/>
		<input type="hidden" name="seq" value="<%=dto.getSeq()%>"/>
	
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="<%=dto.getTitle() %>"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="6" cols="60" name="content"><%=dto.getContent() %></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정"/>
					<input type="button" value="취소" onclick="location.href='faqcontroller.jsp?command=faqlistdetail&seq=<%=dto.getSeq()%>';"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
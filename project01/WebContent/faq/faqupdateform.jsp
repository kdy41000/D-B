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
<%@ include file="../home/header.jsp" %>
	<h1>수정</h1>
	
	<form action="faq.do" method="post">
	<input type="hidden" name="command" value="faqupdateres"/>
		<input type="hidden" name="boa_seq" value="<%=dto.getBoa_seq()%>"/>
	
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="boa_title" value="<%=dto.getBoa_title() %>"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="6" cols="60" name="boa_content"><%=dto.getBoa_content() %></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정"/>
					<input type="button" value="취소" onclick="location.href='faq.do?command=faqdetail&boa_seq=<%=dto.getBoa_seq()%>';"/>
				</td>
			</tr>
		</table>
	</form>
<%@ include file="../home/footer.jsp" %>
</body>
</html>
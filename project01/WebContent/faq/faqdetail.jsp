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
			<th>번호</th>
			<td><%=dto.getBoa_seq() %></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=dto.getMem_id() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getBoa_title() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getBoa_cnt() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea row="10" cols="60" readonly="readonly"><%=dto.getBoa_content() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="location.href='faq.do?command=faqupdate&boa_seq=<%=dto.getBoa_seq() %>';"/>
				<input type="button" value="삭제" onclick="location.href='faq.do?command=faqdelete&boa_seq=<%=dto.getBoa_seq() %>';"/>
				<input type="button" value="목록" onclick="location.href='faq.do?command=faqlist&currentpage=1';"/>
			</td>
		</tr>
	</table>
</body>
</html>
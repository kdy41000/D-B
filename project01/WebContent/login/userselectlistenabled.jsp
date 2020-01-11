<%@page import="member.dto.MemberDto"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript">
	function updateRole(seq){
		location.href="logincontroller.jsp?command=updateroleform&seq="+seq;
	}
</script>
</head>
<%
	List<MemberDto>list = (List<MemberDto>)request.getAttribute("list");
%>
<body>
	<h1>회원정보 조회(가입여부)</h1>
	<table border="1">
		<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>성별</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>가입날짜</th>
		<th>가입여부</th>
		<th>등급</th>
		<th>등급변경</th>
		</tr>
<%
	for(MemberDto dto : list){
%>		
		<tr>
		<td><%=dto.getSeq() %></td>
		<td><%=dto.getId() %></td>
		<td><%=dto.getPw() %></td>
		<td><%=dto.getGender() %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getAddr() %></td>
		<td><%=dto.getPhone() %></td>
		<td><%=dto.getEmail() %></td>
		<td><%=dto.getAdddate() %></td>
		<td><%=dto.getEnabled().equals("Y")?"가입":"탈퇴" %></td>
		<td><%=dto.getRole() %></td>
		<td><button onclick="updateRole(<%=dto.getSeq()%>);">변경</button></td>
		</tr>
<%
	}
%>		
	<tr>
		<td colspan="12">
			<button onclick="location.href='adminmain.jsp'">메인으로</button>
		</td>
	</tr>
	</table>
	
</body>
</html>
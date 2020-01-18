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
<section>
		<div class="row">
  <div id="man" class="col s12">
    <div class="card material-table">
      <div class="table-header">
        <span class="table-title">FAQDetail</span>
        <div class="actions">
          <a href="#addClientes" class="modal-trigger waves-effect btn-flat nopadding"><i class="material-icons">person_add</i></a>
          <a href="#" class="search-toggle waves-effect btn-flat nopadding"><i class="material-icons">search</i></a>
        </div>
      </div>
	
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
</section>
<%@ include file="../home/footer.jsp" %>	
</body>
</html>
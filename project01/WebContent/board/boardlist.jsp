<%@page import="java.util.List"%>
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
<link href="../resources/css/faq/faqlist.css"  
	  rel="stylesheet"    
	  type="text/css" />
<script type="text/javascript" src="../resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">

	function allChk(ele){
		$('input:checkbox[name="chk"]').each(function(){ 
			if(ele==true){   
				this.checked = true;  
			}else{          
				this.checked = false;   
			}
		});
	}
	
</script>

</head>
<body>
<%@ include file="../home/header.jsp" %>
<div id="faq">
  <h1>FAQ</h1>
  <ul>
    <li>
      <input type="checkbox" checked>
      <i></i>
      <h2>공지사항1</h2>
      <p>준비중</p>
    </li>
    <li>
      <input type="checkbox" checked>
      <i></i>
      <h2>공지사항2</h2>
      <p>준비중</p>
    </li>
    <li>
      <input type="checkbox" checked>
      <i></i>
      <h2>공지사항3</h2>
      <p>준비중</p>
    </li>
  </ul>
</div>

<%
	//모든 객체의 조상은 Object형으로 캐스팅을 해줘야한다.
	List<BoardDto>list = (List<BoardDto>)request.getAttribute("list"); //controller.jsp에서 권한을 받아 Clint에게 응답한다.
%>
	<h1>글 목록</h1>
	
	<form action="faqcontroller.jsp" method="post">
		<input type="hidden" name="command" value="multidelete"/>
		<table border="1">
			<col width="30"/>
			<col width="50"/>
			<col width="100"/>
			<col width="300"/>
			<col width="100"/>
			<tr>
				<th><input type="checkbox" name="all" onclick="allChk(this.checked);"/></th>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
<%
	if(list.size() == 0){
%>
			<tr>
				<td colspan="5">-----작성된 글이 없습니다.-----</td>
			</tr>
<%
	}else{
		for(BoardDto dto: list){
%>	
		<tr>
			<td><input type="checkbox" name="chk" value="<%=dto.getSeq() %>"></td>
			<td><%=dto.getSeq() %></td>
			<td><%=dto.getWriter() %></td>
			<td><a href='faqcontroller.jsp?command=faqlistdetail&seq=<%=dto.getSeq()%>'><%=dto.getTitle() %></a></td>
			<td><%=dto.getRegdate() %></td>
		</tr>
<%
		}
	}
%>			
		<tr>
			<td colspan="5">
				<input type="submit" value="선택삭제"/>
				<input type="button" value="글쓰기" onclick="location.href='faqcontroller.jsp?command=faqwriteform';" />  
			</td>
		</tr>
		</table>
	</form>
<%@ include file="../home/footer.jsp" %>
</body>
</html>
<%@page import="board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="board.biz.BoardBizImpl"%>
<%@page import="board.biz.BoardBiz"%>
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
<body>
	<%
		String command = request.getParameter("command");   //command=list
			System.out.println("<"+command+">");
			
			BoardBiz biz = new BoardBizImpl();  //Biz호출
			
			if(command.equals("faqlist")){
		
		List<BoardDto>list = biz.selectList();
		request.setAttribute("list",list);
			
		pageContext.forward("faqlist.jsp");    //forward: (데이터를 담아)모든권한을 boardlist.jsp로 넘긴다는 의미
		
			}else if(command.equals("faqwriteform")){
			
		response.sendRedirect("faqwrite.jsp");	//sendRedirect : 새로운 페이지를 생성할 때 사용
		
			}else if(command.equals("faqwriteres")){
		//1. 받을 데이터가 있는지?x
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		BoardDto dto = new BoardDto();
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		//2. db에서 가져올 데이터가 있는지?x
		int res = biz.insert(dto);
		
		//3. 어디로 갈건지?o
		if(res > 0){
	%>
	<script type="text/javascript">
		alert("새로운 글을 등록 완료하였습니다.");
		location.href="faqcontroller.jsp?command=faqlist";
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert("글 등록에 실패하였습니다.");
		location.href="faqcontroller.jsp?command=faqwriteform";
	</script>
<%
	}
	}else if(command.equals("multidelete")){
		//1.받을 데이터가 있는지?o (chk)
		String[] seqs = request.getParameterValues("chk");	
		
		if(seqs == null||seqs.length==0){
%>
		<script type="text/javascript">
			alert("삭제할 글을 1개 이상 선택해 주세요");
			location.href="faqcontroller.jsp?command=faqlist";
		</script>
<%
	}else{

		//2.db에서 가져올 데이터가 있는지?o
		boolean res = biz.multiDelete(seqs);		
		//3.어디로 갈건지?		
		if(res){
%>
		<script type="text/javascript">
			alert("선택된 글들을 모두 삭제 완료하였습니다.");
			location.href="faqcontroller.jsp?command=faqlist";
		</script>
<%
	}else{
%>
		<script type="text/javascript">
			alert("선택된 글들을 삭제 실패하였습니다.");
			location.href="faqcontroller.jsp?command=faqlist";
		</script>
<%
	}
		}		
	}else if(command.equals("faqlistdetail")){             //선택출력
		int seq = Integer.parseInt(request.getParameter("seq"));
		BoardDto dto = biz.selectOne(seq);
		request.setAttribute("dto",dto);
		pageContext.forward("faqlistdetail.jsp");
		
	}else if(command.equals("faqupdate")){   //수정버튼 클릭하면
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		BoardDto dto = biz.selectOne(seq);
		request.setAttribute("dto", dto);
		pageContext.forward("faqupdate.jsp");
	
	}else if(command.equals("faqupdateres")){      //수정폼에서 넘어온 command
	int seq = Integer.parseInt(request.getParameter("seq"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
		
	BoardDto dto = new BoardDto();
	dto.setSeq(seq);
	dto.setTitle(title);
	dto.setContent(content);
		
	int res = biz.update(dto);
		
		if(res > 0){
%>
	<script type="text/javascript">
		alert("글 수정 성공!");
		location.href="faqcontroller.jsp?command=faqlistdetail&seq=<%=dto.getSeq()%>";
	</script>
<%			
		}else{
%>
	<script type="text/javascript">
		alert("글 수정 실패!");
		location.href="faqcontroller.jsp?command=faqupdate&seq<%=dto.getSeq()%>";
	</script>
<%			
			}
		}else if(command.equals("faqdelete")){
			int seq = Integer.parseInt(request.getParameter("seq"));
			int res = biz.delete(seq);
			
			if(res > 0){
			
%>
	<script type="text/javascript">
		alert("삭제 성공");
		location.href="faqcontroller.jsp?command=faqlist";
	</script>
<%		
			}else{
%>
	<script type="text/javascript">
		alert("삭제 실패");
		location.href="faqcontroller.jsp?command=faqlistdetail&seq=<%=seq%>";
	</script>
<%				
			}
		}
	
	
%>




	<h1>잘못왔다(command 확인!)</h1>
</body>
</html>
<%@page import="board.dto.PagingDto"%>
<%@page import="board.biz.BoardBizImpl"%>
<%@page import="board.biz.BoardBiz"%>
<%@page import="java.util.List"%>
<%@page import="board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/faq/faqlist.css"  
	  rel="stylesheet"    
	  type="text/css" />
<script type="text/javascript" src="../resources/js/jquery-3.4.1.js"></script>

</head>
<body>

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
	//int currentpage = Integer.parseInt(request.getParameter("currentpage"));  //1
	int currentpage = Integer.parseInt(request.getParameter("currentpage"));
	List<BoardDto>totalcnt = (List<BoardDto>)request.getAttribute("list");
	BoardBiz biz = new BoardBizImpl();
	PagingDto pagingdto = new PagingDto();
	
	int startseq = (currentpage-1)*pagingdto.getColnum()+1; 
	int endseq = currentpage*pagingdto.getColnum();		
	
	List<BoardDto>list = biz.selectPaging(startseq,endseq);
	
	int totalcount = totalcnt.size();  //게시글 전체 갯수
	int understartnum = (((currentpage-1)/10)*10)+1; //밑에 페이지 시작번호
	int underendnum = understartnum+9;   //밑에 페이지 끝번호
	System.out.println(totalcount);
	System.out.println(currentpage);
	

%>
</head>
<body>
	<h1>글 목록</h1>
	
	<form action="../faq.do" method="get">
		<input type="hidden" name="command" value="muldel"/>
		<table border="1">
			<col width="30"/>
			<col width="50"/>
			<col width="100"/>
			<col width="300"/>
			<col width="100"/>
			<col width="100"/>
			<tr>
				<th><input type="checkbox" name="all" onclick="allChk(this.checked);"/></th>
				<th>번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
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
			<td><input type="checkbox" name="chk" value="<%=dto.getBoa_seq()%>"></td>
			<td><%=dto.getBoa_seq() %></td>
			<td><%=dto.getMem_id() %></td>
			<td> <a href='faq.do?command=faqdetail&boa_seq=<%=dto.getBoa_seq() %>'><%=dto.getBoa_title() %></a></td>
			<td><%=dto.getRegdate() %></td>
			<td><%=dto.getBoa_cnt() %></td>
		</tr>
<%
		}
	}
%>			
		<tr>
			<td colspan="5">
				<input type="submit" value="선택삭제"/>
				<input type="button" value="글쓰기" onclick="location.href='controller.do?command=mvcinsert';" />  
			</td>
		</tr>
		</table>
<%
	if(1 <=currentpage && currentpage <= 10){  //1~10까지 prev hidden
%>		
		<a style="display:none" href="faq.do?command=faqlist&currentpage=<%=understartnum-1%>">prev</a>
<%
	}else{   //11~20
				
%>
		<a href="faq.do?command=faqlist&currentpage=<%=understartnum-1%>">prev</a>

<%		
	}
		for(int i = understartnum; i < underendnum+1; i++){ //1~10
			/*
			int checkNum =0;
			if(totalcount%10 !=0){
				checkNum = i-1;
			}else{   //totalcount%10 == 0
				checkNum = i;
			}*/
				//totalcount%10 							
			if(totalcount%10 != 0 && totalcount/10 == i-1){ //게시글 전체가 10단위로 떨어지지 않는데 마지막페이지 찍고 break
				
%>
		 <a href="faq.do?command=faqlist&currentpage=<%=i%>">콩<%=i %>끝</a> 
<% 			
					break;
				
			}else if(totalcount%10 == 0 && totalcount/10 == i ){  //게시글 전체가 10단위로 떨어지는데 마지막페이지 찍고 break
%>
			<a href="faq.do?command=faqlist&currentpage=<%=i%>">콩<%=i %>끝</a> 
<%					break;
			}else{    //페이지 prev 1~10 next, prev 11~20 next, prev 21~30 next
%>				
			<a href="faq.do?command=faqlist&&currentpage=<%=i%>"><%=i %></a>
<%			
			}
		}		
		//if(totalcount%10 != 0||totalcount/10 != currentpage){
			//if(totalcount/10>underendnum){
			if(totalcount%10 == 0 || (totalcount/10)+1 ==currentpage||totalcount/10 == currentpage){
				
				
%>
	<a style="display:none" href="faq.do?command=faqlist&currentpage=<%=underendnum+1 %>">next</a>
<%					
				
			}else{
%>
	<a href="faq.do?command=faqlist&currentpage=<%=underendnum+1%>">next</a>
<%			
		}
	%>
	
	
	
	</form>

</body>
</html>
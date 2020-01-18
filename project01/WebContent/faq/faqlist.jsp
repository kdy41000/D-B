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
<link href="resources/css/faq/faqlist.css"  
	  rel="stylesheet"    
	  type="text/css" />
<script type="text/javascript" src="../resources/js/jquery-3.4.1.js"></script>




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

</script>
<body>

<section>
<%@ include page="../home/header.jsp" %>
	<div class="row">
  <div id="man" class="col s12">
    <div class="card material-table">
      <div class="table-header">
        <span class="table-title">FAQ</span>
        <div class="actions">
          <a href="#addClientes" class="modal-trigger waves-effect btn-flat nopadding"><i class="material-icons">person_add</i></a>
          <a href="#" class="search-toggle waves-effect btn-flat nopadding"><i class="material-icons">search</i></a>
        </div>
      </div>
	
	<form action="../faq.do" method="get">
		<input type="hidden" name="command" value="muldel"/>
		  <table id="datatable">
        	<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			</thead>
<%
	if(list.size() == 0){
%>
		<tbody>
			<tr>
				<td colspan="5">-----작성된 글이 없습니다.-----</td>
			</tr>
<%
	}else{
		for(BoardDto dto: list){
%>	
		<tr>
			<td><%=dto.getBoa_seq() %></td>
			<td><%=dto.getMem_id() %></td>
			<td> <a href='faq.do?command=faqdetail&boa_seq=<%=dto.getBoa_seq() %>&boa_cnt=<%=dto.getBoa_cnt()%>'><%=dto.getBoa_title() %></a></td>
			<td><%=dto.getRegdate() %></td>
			<td><%=dto.getBoa_cnt() %></td>
		</tr>
	</tbody>
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
		</div>
	</div>
</div>
	</form>
	
	<div class="paging">
<%
	if(1 <=currentpage && currentpage <= 10){  //1~10까지 prev hidden
%>		
		<a style="display:none" class="direction prev" href="faq.do?command=faqlist&currentpage=<%=understartnum-1%>"><span>prev</span></a>
<%
	}else{   //11~20
				
%>
		<a class="direction prev" href="faq.do?command=faqlist&currentpage=<%=understartnum-1%>"><span>prev</span></a>

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
		 <a href="faq.do?command=faqlist&currentpage=<%=i%>"><%=i %></a> 
<% 			
					break;
				
			}else if(totalcount%10 == 0 && totalcount/10 == i ){  //게시글 전체가 10단위로 떨어지는데 마지막페이지 찍고 break
%>
			<a href="faq.do?command=faqlist&currentpage=<%=i%>"><%=i %></a> 
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
	<a style="display:none"  class="direction next" href="faq.do?command=faqlist&currentpage=<%=underendnum+1 %>"><span>next</span></a>
<%					
				
			}else{
%>
	<a  class="direction next" href="faq.do?command=faqlist&currentpage=<%=underendnum+1%>"><span>next</span></a>
<%			
		}
	%>
	</div>
<%@ include file="../home/footer.jsp" %>	
	</section>


</body>
</html>
<%@page import="java.util.List"%>
<%@page import="member.dto.MemberDto"%>
<%@page import="member.biz.MemberBizImpl"%>
<%@page import="member.biz.MemberBiz"%>
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
	String command = request.getParameter("command");
	System.out.println("["+command+"]");
	
	MemberBiz biz = new MemberBizImpl();
	
	if(command.equals("login")){  //로그인Controller
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDto dto = biz.login(id, pw);
		
		if(dto.getMem_role() != null){  //로그인 성공(쿼리문 참조)
	session.setAttribute("dto", dto);
	session.setMaxInactiveInterval(10*60);
	
	if(dto.getRole().equals("ADMIN")){  //관리자로 로그인
		response.sendRedirect("../home/section.jsp");
	}else if(dto.getRole().equals("USER")){  //고객으로 로그인
		response.sendRedirect("usermain.jsp");
	}
		}else{  //로그인 실패
%>
	<script type="text/javascript">
		alert("로그인 정보를 확인 해 주세요");
		location.href="login.jsp";
	</script>
<%
	}
	}else if(command.equals("logout")){  //로그아웃Controller
		session.invalidate();
		response.sendRedirect("login.jsp");
		
	}else if(command.equals("selectlist")){ //1.회원 전체 정보(탈퇴회원 포함)Controller
		List<MemberDto>list = biz.selectList();
		request.setAttribute("list", list);
		pageContext.forward("userselectlist.jsp");
		
	}else if(command.equals("selectenabled")){  //2.회원 전체 정보(가입된 회원들만):myenabled = y
		List<MemberDto>list = biz.selectEnabled();
		request.setAttribute("list", list);
		pageContext.forward("userselectlistenabled.jsp");
		
	}else if(command.equals("updateroleform")){
		int seq = Integer.parseInt(request.getParameter("seq"));
		MemberDto dto = biz.selectUser(seq);  //3.내정보 조회
		
		request.setAttribute("dto", dto);
		pageContext.forward("updaterole.jsp");
		
	}else if(command.equals("updateroleres")){
		int seq = Integer.parseInt(request.getParameter("seq"));
		String role = request.getParameter("role");
		
		int res = biz.updateRole(seq, role);  //3.회원 등급 조정
		
		if(res > 0){
%>
	<script type="text/javascript">
		alert("등급수정 완료하였습니다.");
		location.href="logincontroller.jsp?command=selectenabled&seq=<%=seq%>";
	</script>
<%			
		}else{
%>
	<script type="text/javascript">
		alert("등급수정 실패하였습니다.");
		location.href="logincontroller.jsp?command=updateroleform&seq=<%=seq%>";
	</script>
<%			
		}
	}
%>

<%
	
%>

	<h1 style="color:red;">command확인 할 것!</h1>
</body>
</html>
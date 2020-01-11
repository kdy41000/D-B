<%@page import="member.dto.MemberDto"%>
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
<link href="../resources/css/home/header.css"  
	  rel="stylesheet"    
	  type="text/css" />

<script type="text/javascript" src="../resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">



<%
	MemberDto dto = (MemberDto)session.getAttribute("dto");

	if(dto.getMem_role()=="ADMIN"){
%>
	
<%
	}else if(dto.getMem_role()=="USER"){
%>	
	<script type="text/javascript">
		alert("고객으로 로그인");
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		$(function(){
			$(".guest").hide();
			$(".admin").hide();
			$(".nonguest").show();
		});
	</script>
<%
	}
%>


<!-- The content of your page would go here. -->
<script>

	$(document).ready(function(){

		var showHeaderAt = 150;

		var win = $(window),
				body = $('body');

		// Show the fixed header only on larger screen devices

		if(win.width() > 400){

			// When we scroll more than 150px down, we set the
			// "fixed" class on the body element.

			win.on('scroll', function(e){

				if(win.scrollTop() > showHeaderAt) {
					body.addClass('fixed');
				}
				else {
					body.removeClass('fixed');
				}
			});

		}

	});

</script>

</head>

<body>

<header class="header-fixed">

	<div class="header-limiter">

		<h1><a href="#"onclick="location.href='../home/section.jsp'">Company<span>logo</span></a></h1>

			<nav class="admin" style="display:none";>  <!-- 관리자 헤더 -->
			<a href="#" onclick="location.href='../home/section.jsp'">Home</a>
			<a href="#" class="selected">Blog</a>
			<a href="#">Company</a>
			<a href="#">About</a>
			<a href="#" onclick="location.href='../faq/faqcontroller.jsp?command=faqlist'">FAQ</a>
			<a href="#">Contact</a>
			<a href="#" class="logout" onclick="location.href='../login/login.jsp'">Logout</a>
			<a href="#" class="adminmain" onclick="location.href='../login/adminmain.jsp'">관리자 회원관리</a>
		</nav>
		<nav class="guest" style="display:none;">  <!-- 고객 헤더 -->
			<a href="#" onclick="location.href='../home/section.jsp'">Home</a>
			<a href="#" class="selected">Blog</a>
			<a href="#">Company</a>
			<a href="#">About</a>
			<a href="#" onclick="location.href='../faq/faqcontroller.jsp?command=faqlist'">FAQ</a>
			<a href="#">Contact</a>
			<a href="#" class="logout" onclick="location.href='../login/login.jsp'">Logout</a>
		</nav>
		<nav class="nonguest"> <!-- 비회원 헤더 -->
			<a href="#" onclick="location.href='../home/section.jsp'">Home</a>
			<a href="#" class="selected">Blog</a>
			<a href="#">Company</a>
			<a href="#">About</a>
			<a href="#" onclick="location.href='../faq/faqcontroller.jsp?command=faqlist'">FAQ</a>
			<a href="#">Contact</a>
			<a href="#" class="login" onclick="location.href='../login/login.jsp'">Login</a>
			<a href="#" class="signup" onclick="location.href='../signup/signup.jsp'">SignUp</a>
		</nav>

	</div>

</header>

<!-- You need this element to prevent the content of the page from jumping up -->
<div class="header-fixed-placeholder"></div>






</body>

</html>
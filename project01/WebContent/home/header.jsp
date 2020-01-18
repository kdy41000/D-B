<%@page import="member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
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

<!-- The content of your page would go here. -->


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
<c:if test="${sessionScope.dto.mem_role == 1}">

        <!-- sessionScope.dto.getMem_role ==1 -->
			<nav class="admin">  <!-- 관리자 헤더 -->
			<a href="#" onclick="location.href='../home/section.jsp'">Home</a>
			<a href="#" class="selected">Blog</a>
			<a href="#">Company</a>
			<a href="#">About</a>
			<a href="#" onclick="location.href='../faq.do?command=faqlist&currentpage=1'">FAQ</a>
			<a href="#" onclick="location.href='../contact.do?command=contact'">Contact</a>
			<a href="#" class="logout" onclick="location.href='../login.do?command=logout'">Logout</a>
			<a href="#" class="adminmain" onclick="location.href='../host.do?command=hostmain&hostname=${sessionScope.dto.mem_name}'">관리자 회원관리</a>
		</nav>
</c:if>	
<c:if test="${sessionScope.dto.mem_role == 2}">
	<!-- sessionScope.dto.getMem_role ==2 -->
		<nav class="guest">  <!-- 고객 헤더 -->
			<a href="#" onclick="location.href='../home/section.jsp'">Home</a>
			<a href="#" class="selected">Blog</a>
			<a href="#">Company</a>
			<a href="#">About</a>
			<a href="#" onclick="location.href='../faq.do?command=faqlist&currentpage=1'">FAQ</a>
			<a href="#" onclick="location.href='../contact.do?command=contact'">Contact</a>
			<a href="#" class="logout" onclick="location.href='../login.do?command=logout'">Logout</a>
		</nav>
</c:if>		
<c:if test="${sessionScope.dto.mem_role != 1 and sessionScope.dto.mem_role != 2}">	
	<!-- sessionScope.dto.getMem_role !=2 && sessionScope.dto.getMem_role !=1-->
		<nav class="nonguest"> <!-- 비회원 헤더 -->
			<a href="#" onclick="location.href='../home/section.jsp'">Home</a>
			<a href="#" class="selected">Blog</a>
			<a href="#">Company</a>
			<a href="#">About</a>
			<a href="#" onclick="location.href='../faq.do?command=faqlist&currentpage=1'">FAQ</a>
			<a href="#" onclick="location.href='../contact.do?command=contact'">Contact</a>
			<a href="#" class="login" onclick="location.href='../login.do?command=loginform'">Login</a>
			<a href="#" class="signup" onclick="location.href='../signup.do?command=signup'">SignUp</a>
		</nav>
</c:if>
	</div>

</header>

<!-- You need this element to prevent the content of the page from jumping up -->
<div class="header-fixed-placeholder"></div>






</body>

</html>
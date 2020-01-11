<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(window, document, undefined).ready(function() {

	  $('input').blur(function() {
	    var $this = $(this);
	    if ($this.val())
	      $this.addClass('used');
	    else
	      $this.removeClass('used');
	  });

	  var $ripples = $('.ripples');

	  $ripples.on('click.Ripples', function(e) {

	    var $this = $(this);
	    var $offset = $this.parent().offset();
	    var $circle = $this.find('.ripplesCircle');

	    var x = e.pageX - $offset.left;
	    var y = e.pageY - $offset.top;

	    $circle.css({
	      top: y + 'px',
	      left: x + 'px'
	    });

	    $this.addClass('is-active');

	  });

	  $ripples.on('animationend webkitAnimationEnd mozAnimationEnd oanimationend MSAnimationEnd', function(e) {
	  	$(this).removeClass('is-active');
	  });

	});
</script>
<link href="../resources/css/login/login.css"  
	  rel="stylesheet"    
	  type="text/css" />
</head>
<body>

	<hgroup>
  		<h1>Login</h1>
	</hgroup>
<form action="logincontroller.jsp" method="post">
  <input type="hidden" name="command" value="login"/>
  <div class="group">
    <input type="text" name="id"><span class="highlight"></span><span class="bar"></span>
    <label>ID</label>
  </div>
  <div class="group">
    <input type="password" name="pw"><span class="highlight"></span><span class="bar"></span>
    <label>PW</label>
  </div>
  <button type="submit" class="button buttonBlue">Login
    <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
  </button>
</form>
<input type="button" id="signup" onclick="location.href='../signup/signup.jsp'"value="SignUp"/>

</body>
</html>
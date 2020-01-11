<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> <!-- 주소API -->
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>

	<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
<script type="text/javascript">

function addrsum(){
	var zonecode = document.getElementById("zonecode").value;
	var address = document.getElementById("address").value;
	var address_etc = document.getElementById("address_etc").value;
	
	if(zonecode !="" && address !="" && address_etc !=""  ){
		
	alert("zonecode"+zonecode);
		var addr = zonecode+", "+address+", "+address_etc;
		
		document.getElementById("addr").value = addr;
		}
	}
	
	$(document).ready(function(){
		$("#zonecode").click(function(){
	
			openDaumZipAddress();
			$(".address").css( 'top', '-20px' )	
						  .css( 'transform', 'scale(.75)' )
						  .css('left','-2px')
						  .css('color','#4a89dc');
		});
		
	});
	
	function openDaumZipAddress() {
		
		new daum.Postcode({

			oncomplete:function(data) {

				jQuery("#postcode1").val(data.postcode1);

				jQuery("#postcode2").val(data.postcode2);

				jQuery("#zonecode").val(data.zonecode);

				jQuery("#address").val(data.address);

				jQuery("#address_etc").focus();

				console.log(data);

			}

		}).open();
		$("#detail01").show();
		$("#detail02").show();
	}
</script>
<link href="../resources/css/login/login.css"  
	  rel="stylesheet"    
	  type="text/css" />
</head>
<body>

	<hgroup>
  		<h1>SignUp</h1>
	</hgroup>
<form action="signupcontroller.jsp" method="post">
	<input type="hidden" name="command" value="signupinfo"/>
  <div class="group">
    <input type="text" name="id"><span class="highlight"></span><span class="bar"></span>
    <label>ID</label>
  </div>
  
  <div class="group">
    <input type="password" name="pw"><span class="highlight"></span><span class="bar"></span>
    <label>PW</label>
  </div>
  
  <div class="group">
    <input type="text" name="name"><span class="highlight"></span><span class="bar"></span>
    <label>Name</label>
  </div>
  
   <div class="group">
    <input type="text" name="gender" value="" maxlength="1" ></span><span class="bar"></span>
     <label>GENDER(M/F)</label>
  </div>
  
  <div class="group">
    <input type="text" name="phone"><span class="highlight"></span><span class="bar"></span>
    <label>Phone</label>
  </div>
  
  <div class="group">
    <input type="text" name="email"><span class="highlight"></span><span class="bar"></span>
    <label>Email</label>
  </div>
  <!-- 주소API -->
  <div class="group">
    <input id="zonecode" type="text" value="" readonly />
    <span class="highlight"></span><span class="bar"></span>
    <label class="address">Address</label>
  </div>
  
  <div class="group" id="detail01" style="display:none;">
	<input type="text" id="address" value="" readonly/>
	<span class="highlight"></span><span class="bar"></span>
	<label class="address">Detail Address1</label>
  </div>
  
  <div class="group" id="detail02" style="display:none;">
  	<input type="text" id="address_etc" value=""/>
  	<span class="highlight"></span><span class="bar"></span>
  	<label class="address">Detail Address2</label>
  </div>
  <!-- 주소API --> 
  <input type="hidden" id="addr" name="addr" value=""/>
  <button type="submit" class="button buttonBlue" onclick="addrsum();">SignUp
    <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
  </button>
</form>
</body>
</html>
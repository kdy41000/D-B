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
<link href="../resources/css/contact/contactform.css"  
	  rel="stylesheet"    
	  type="text/css" />
<script type="text/javascript">
$(document).ready(function() {
	// Test for placeholder support
    $.support.placeholder = (function(){
        var i = document.createElement('input');
        return 'placeholder' in i;
    })();

    // Hide labels by default if placeholders are supported
    if($.support.placeholder) {
        $('.form-label').each(function(){
            $(this).addClass('js-hide-label');
        });  

        // Code for adding/removing classes here
        $('.form-group').find('input, textarea').on('keyup blur focus', function(e){
            
            // Cache our selectors
            var $this = $(this),
                $label = $this.parent().find("label");
					
						switch(e.type) {
							case 'keyup': {
								 $label.toggleClass('js-hide-label', $this.val() == '');
							} break;
							case 'blur': {
								if( $this.val() == '' ) {
                    $label.addClass('js-hide-label');
                } else {
                    $label.removeClass('js-hide-label').addClass('js-unhighlight-label');
                }
							} break;
							case 'focus': {
								if( $this.val() !== '' ) {
                    $label.removeClass('js-unhighlight-label');
                }
							} break;
							default: break;
						}
						// previous implementation with ifs
            /*if (e.type == 'keyup') {
                if( $this.val() == '' ) {
                    $parent.addClass('js-hide-label'); 
                } else {
                    $parent.removeClass('js-hide-label');   
                }                     
            } 
            else if (e.type == 'blur') {
                if( $this.val() == '' ) {
                    $parent.addClass('js-hide-label');
                } 
                else {
                    $parent.removeClass('js-hide-label').addClass('js-unhighlight-label');
                }
            } 
            else if (e.type == 'focus') {
                if( $this.val() !== '' ) {
                    $parent.removeClass('js-unhighlight-label');
                }
            }*/
        });
    } 
});
</script>
</head>
<body>
<%@ include file="../home/header.jsp" %>
<section id="contact">
  
  <h1 class="section-header">CONTACT</h1>
  
  <div class="contact-wrapper">
    
      <!---------------- 

      CONTACT PAGE LEFT 
    
      -----------------> 
    
    <form class="form-horizontal" role="form" method="post" action="contact.php">
       
      <div class="form-group">
        <div class="col-sm-12">
          <input type="text" style="height:30px" class="form-control" id="name" placeholder="NAME" name="name" value="">
        </div>
      </div>

      <div class="form-group">
        <div class="col-sm-12">
          <input type="email" style="height:30px" class="form-control" id="email" placeholder="EMAIL" name="email" value="">
        </div>
      </div>

      <textarea class="form-control" style="height:180px" rows="10" placeholder="MESSAGE" name="message"></textarea>
      
      <button class="btn btn-primary send-button" id="submit" type="submit" value="SEND">
        <div class="button">
          <i class="fa fa-paper-plane"></i><span class="send-text">SEND</span>
        </div>
      
      </button>
      
    </form>
    
      <!---------------- 

      CONTACT PAGE RIGHT 
    
      -----------------> 
    
      <div class="direct-contact-container">

        <ul class="contact-list">
          <li class="list-item"><i class="fa fa-map-marker fa-2x"><span class="contact-text place">Korea | Seoul</span></i></li>
          
          <li class="list-item"><i class="fa fa-phone fa-2x"><span class="contact-text phone"><a href="tel:1-212-555-5555" title="Give me a call">(010) 5054-3568</a></span></i></li>
          
          <li class="list-item"><i class="fa fa-envelope fa-2x"><span class="contact-text gmail"><a href="mailto:#" title="Send me an email">emailme@gmail.com</a></span></i></li>
          
        </ul>

        <hr>
        <ul class="social-media-list">
          <li><a href="#" target="_blank" class="contact-icon">
            <i class="fa fa-github" aria-hidden="true"></i></a>
          </li>
          <li><a href="#" target="_blank" class="contact-icon">
            <i class="fa fa-twitter" aria-hidden="true"></i></a>
          </li>
          <li><a href="#" target="_blank" class="contact-icon">
            <i class="fa fa-instagram" aria-hidden="true"></i></a>
          </li>
          <li><a href="#" target="_blank" class="contact-icon">
            <i class="fa fa-codepen" aria-hidden="true"></i></a>
          </li>
        </ul>
        <hr>

        <div class="copyright">&copy; ALL OF THE RIGHTS RESERVED</div>

      </div>
    
  </div>

</section>  
  <%@ include file="../home/footer.jsp" %>  
  
</body>
</html>
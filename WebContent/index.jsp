<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
// String path = request.getContextPath();
// String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Stock Trader System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
<!-- 	<meta http-equiv="keywords" content="clipboard, introduction, jsp"> -->
<!-- 	<meta http-equiv="description" content="This is a introduction page"> -->
    <meta http-equiv="author" content="Bofan">
	
	<!-- css -->
	<link href="assets/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
	
	
	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      	<script src="assets/js/lib/html5shiv.js"></script>
    <![endif]-->
	    
	<script src="assets/js/lib/jquery.js"></script>  
	
	
	
	

	
	
	
	
  </head>
  
    <body background="assets\pic\bg\bg4.jpg" onload="init();">
    
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="#">Stock Trader System</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#">About</a></li>
              <li><a href="#">Contact</a></li>
            </ul>
            <form class="navbar-form pull-right" id="registerform" action="register" method="post">
              
              <input class="span2" type="text" name="username" placeholder="Username">
              <input class="span2" type="password" name="password" placeholder="Password" onpaste="return false;"	>
              <button id="btn_signup" type="submit" class="btn">Sign up</button>
              	<label class="alert alert-success" style="display:none" id="registerSuccessInfo">
		  		Register successful !
				</label>
				<label class="alert alert-error" style="display:none" id="registerErrorInfo">
		  		The username has existed !
				</label>
              <%
            		String msg_signup = (String)request.getAttribute("msg_signup");
					if(msg_signup!=null){
						if (msg_signup.equals("fail")){
							out.println("<script type=\"text/javascript\">");
							out.println("$(\'#registerErrorInfo\').fadeIn(1000);");
							out.println("$(\'#registerErrorInfo\').delay(1000).fadeOut(1000);");
							out.println("</script>");
							
						}
						else if(msg_signup.equals("success")){
							out.println("<script type=\"text/javascript\">");
							out.println("$(\'#registerSuccessInfo\').fadeIn(1000);");
							out.println("$(\'#registerSuccessInfo\').delay(1000).fadeOut(1000);");
							out.println("</script>");
						}
					}
            	 %>
              <!-- 
				<script type="text/javascript">
					document.getElementById("registerInfof").style.display="block";
				</script> -->
            </form>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
				
    <div class="container">
      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
        <h1>Stock Trader System</h1>
        <br>
        <p> A portable clipboard on the cloud.</p>
        <p> A sharing clipboard with your friends and colleague.</p>
        <p><a id="btn_signinnow" href="#" role="button" data-toggle="modal" class="btn btn-primary btn-large">Sign in NOW &raquo;</a></p>
        
      </div>
      
      

      <div id="loginModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
          <h3 id="myModalLabel"></h3>
        </div>
        <div class="modal-body">
          <form class="form-signin" id="loginform" action="login" method="post">
            <h2 class="form-signin-heading">Sign in your account</h2>
            <input type="text" class="input-block-level" name="username" placeholder="Username">
            <input type="password" class="input-block-level" name="password" placeholder="Password" onpaste="return false;">
            <label class="checkbox">
              <input id="remember" type="checkbox" value="remember-me"> Remember me
            </label>
            <label class="alert alert-success" style="display:none" id="loginSuccessInfo">
		  		Login successful !
				</label>
				<label class="alert alert-error" style="display:none" id="loginErrorInfo">
		  		The username or the password is wrong !
				</label>
            <label>
            	<p style="color:red"><%
            		String msg_signin = (String)request.getAttribute("msg_signin");
					if(msg_signin!=null){
						if (msg_signin.equals("fail"))
						{
							out.println("<script type=\"text/javascript\">");
							out.println("$(\'#loginErrorInfo\').fadeIn(1000);");
							out.println("$(\'#loginErrorInfo\').delay(1000).fadeOut(1000);");
							out.println("</script>");
						}
						else if(msg_signin.equals("success")){
							out.println("<script type=\"text/javascript\">");
							out.println("$(\'#loginSuccessInfo\').fadeIn(1000);");
							out.println("$(\'#loginSuccessInfo\').delay(1000).fadeOut(1000);");
							out.println("</script>");
						}
							
					}
            	 %>
            	 </p>
            </label>
            <button class="btn btn-large btn-primary" type="submit">Sign in</button>
          </form>

        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
          <!-- <button id="btn_signin" class="btn btn-primary">Sign in</button> -->
        </div>
      </div>


      <!-- Example row of columns -->
      <div class="row">
        <div class="span4">
          <h2>What's this?</h2>
          <p>This is a cloud clipboard where you can sync your local clipboard to share clipboard among different devices.</p>
        </div>
        <div class="span4">
          <h2>Why I use?</h2>
          <p> You can copy anywhere and paste everywhere.</p>
          <p> You can also easily share your clipboard with your friend.</p>
       </div>
        <div class="span4">
          <h2>How to use?</h2>
          <p> Login with your account just pressing ctrl+C on your device, then login with the same account on the other devices and you can get the context just by pressing ctrl+V.</p>
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy;  Copyright 2016 Jiaqi Qin. All rights reserved.</p>
      </footer>

    </div> <!-- /container -->
    
    
    
    <!-- js -->
    <!-- Placed at the end of the document so the pages load faster -->
	
    <script src="assets/js/lib/bootstrap.js"></script>
<!--  -->    <script src="assets/js/lib/bootstrap.min.js"></script>
    <script src="assets/js/lib/bootstrap-modal.js"></script>

    <script type="text/javascript" src="assets\js\init.js"></script>
    <script type="text/javascript" src="assets\js\button.js"></script>
  </body>
</html>




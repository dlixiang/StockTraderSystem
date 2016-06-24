<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login-Register</title>
	<link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.min.css"> 
	<script type="text/javascript" src="bootstrap/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
</head>
<body  style="background-image:url('gun.jpg');">

<div class="home">
    <header class="header">
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="row">                               
                <div class="hidden-xs col-sm-5 col-md-4 col-lg-4">
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav pull-left">
                            <li id="nav-index" ><a href="">首页</a></li>                               
                        </ul>
                    </div>
                </div>
                
            </div>
        </div>
    </nav>
</header> 
<div class="content" style="margin-top: 100px; margin-left: 700px" >

        <div class="wrapper">
            <div class="container">
                <div class="row">
                    

                    <div class="log-or-sign col-xs-12 col-sm-6 col-md-4 col-lg-4">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" id="tab-sl">
                            <li role="presentation" class="active"><a href="#login" aria-controls="login" role="tab" data-toggle="tab" id="tri-login">LOGIN</a></li>
                            <li role="presentation"><a href="#register" aria-controls="register" role="tab" data-toggle="tab" id="tri-register">REGISTER</a></li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <!-- Tab Log in -->
                            <form action="loginq" method="post" role="tabpanel" class="tab-pane fade in active" id="login" >
                                <div class="tab-info" id="login-info"></div>   
                                <br>                                                               						          
						        <lable class="pull-left forgot" >IDENTITY</lable>	
						        <br>					          
					            <div class="controls"> 
					              <select  class="input-xlarge" name="identity">
							      	<option value="boss">Boss</option>
							      	<option value="employee">Employee</option>	
							      	<option value="admistrator">Admistrator</option>					
							      </select>		
							  	</div>  			         	                               
                                <br>
                                <label for="login-name" class="sr-only">用户名</label>
                                <input name="loginname" type="name" id="login-name" class="form-control" placeholder="Username" required autofocus>
                                <br>
                                <label for="login-password" class="sr-only">密码</label>
                                <input name="loginpassword" type="password" id="login-password" class="form-control" placeholder="Password" required>
                                <br><br>
                                <button type="submit" class="btn btn-lg btn-primary btn-block login">登录</button>
                            </form>
                            <!-- Tab Register -->
                            <form action="registerq" method="post" role="tabpanel" class="tab-pane fade" id="register" >
                                <div class="tab-info" id="register-info"></div>
                                <br>
                                <label for="register-name" class="sr-only">用户名</label>
                                <input name="registername" type="name" id="register-name" class="form-control" placeholder="Username" required autofocus>
                                <br>
                                <label for="register-password" class="sr-only">密码</label>
                                <input name="registerpassword" type="password" id="register-password" class="form-control" placeholder="Password" required>
                                <br><br>
                                <button type="submit" class="btn btn-lg btn-primary btn-block register">注册</button>
                            </form>  
                        </div>
                    </div>                </div>
            </div>
        </div>
</div>
</div>      
</body>
</html>
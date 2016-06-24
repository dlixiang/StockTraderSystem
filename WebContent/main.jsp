<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String uid = (String)request.getAttribute("uid");
String fid = (String)request.getAttribute("fid");
String tp = (String)request.getAttribute("uctxtp");
String ctx = (String)request.getAttribute("uctx");
String[] friendList = (String[])request.getAttribute("friendlist");
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Fancy Clipboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">    
  <meta http-equiv="keywords" content="clipboard, introduction, jsp">
  
  <meta http-equiv="description" content="This is a introduction page">
    <meta http-equiv="author" content="Bofan">


  <!-- css -->
  <link href="assets/css/bootstrap.css" rel="stylesheet">
   
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="assets/css/main.css" rel="stylesheet">
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

  </head>

  <body background="assets\pic\bg\bg5.jpg" onload="init();">

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">Fancy Clipboard</a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              Welcome,  <span id="myID"><%=uid%></span>, 
              <a href="#" class="navbar-link">(Log out)</a>
            </p>
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <label>
              <a href="#" id="btn_addFriend">+(Add)</a>&nbsp;&nbsp;&nbsp;<a href="#" id="btn_delFriend">-(delete)</a>
              </label>
              <li class="nav-header">ME</li>
              <li class="active" id="myli"><a href="#" class="flink"><%=uid%></a></li>
              <li class="nav-header">FRIEND LIST</li>
              <%
	              	if(friendList != null){
		              	for(int i=0; i<friendList.length; i++){
		              		out.print("<li><a href=\"#\" class=\"flink\">"+friendList[i]+"</a></li>");
		              	}
	              	}
               %>
               
				<%
               		String msg_delfrd = (String)request.getAttribute("msg_delfrd");
               		if(msg_delfrd!=null){
	               		if(msg_delfrd.equals("suc") || msg_delfrd.equals("notFound")){
	               			
	               			out.println("<script type=\"text/javascript\">");
	               			out.println("$(\'#DelFrdSucInfo\').fadeIn(1000);");
							out.println("$(\'#DelFrdSucInfo\').fadeIn(1000);");
							out.println("$(\'#DelFrdSucInfo\').delay(1000).fadeOut(1000);");
							out.println("</script>");
	               		}
	               		else{
	               			out.println("<script type=\"text/javascript\">");
							out.println("$(\'#DelFrdFailInfo\').fadeIn(1000);");
							out.println("$(\'#DelFrdFailInfo\').delay(1000).fadeOut(1000);");
							out.println("</script>");
	               		}
	               	}
               		
                %>
                
                <label class="alert alert-success" style="display:none" id="DelFrdSucInfo">
		  			Delete friend successfully !
				</label>
				<label class="alert alert-error" style="display:none" id="DelFrdFailInfo">
		  			Unknown Error !
				</label>
              <!-- <li><a href="#" class="flink acti">Link</a></li> -->
              
            </ul>
          </div><!--/.well -->
          
          
          <%
               		String msg_addfrd = (String)request.getAttribute("msg_addfrd");
               		//System.out.println(msg_addfrd);
               		if(msg_addfrd!=null){
	               		if(msg_addfrd.equals("notFound")){
	               			out.println("<script type=\"text/javascript\">");
	               			/* out.println("var myCount = 3;");
	               			out.println("function count() {"); */
	               			out.println("document.getElementById(\"AddFrdSucInfo\").style.display=\"none\";");
	               			out.println("document.getElementById(\"AddFrdNotFoundInfo\").style.display=\"block\";");
	               			/* out.println("myCount--;");
	               			out.println("if (myCount == 0) {");
	               			out.println("document.getElementById(\"tcdiv\").style.display=\"none\";");
	               			out.println("return;");
	               			out.println("}};");
	               			out.println("setTimeout(\"count()\", 1000);"); */
	               			
							//out.println("$(\'#AddFrdNotFoundInfo\').fadeIn(1000);");
							//out.println("$(\'#AddFrdNotFoundInfo\').delay(1000).fadeOut(1000);");
							out.println("</script>");
	               		}
	               		else if(msg_addfrd.equals("suc")){
	               			out.println("<script type=\"text/javascript\">");
							/* out.println("var myCount1 = 5;");
	               			out.println("function count1() {"); */
	               			out.println("document.getElementById(\"AddFrdNotFoundInfo\").style.display=\"none\";");
	               			out.println("document.getElementById(\"AddFrdSucInfo\").style.display=\"block\";");
	               			/* out.println("myCount1--;");
	               			out.println("if (myCount1 == 0) {");
	               			out.println("document.getElementById(\"AddFrdSucInfo\").style.display=\"none\";");
	               			out.println("return;");
	               			out.println("}};");
	               			out.println("setTimeout(\"count1()\", 1000);"); */
							//out.println("$(\'#AddFrdSucInfo\').fadeIn(1000);");
							//out.println("$(\'#AddFrdSucInfo\').delay(1000).fadeOut(1000);");
							out.println("</script>");
	               		}
	               		else{
	               			out.println("<script type=\"text/javascript\">");
							out.println("$(\'#AddFrdFailInfo\').fadeIn(1000);");
							out.println("$(\'#AddFrdFailInfo\').delay(1000).fadeOut(1000);");
							out.println("</script>");
	               		
	               		//request.getRequestDispatcher("clipboard.jsp").forward(request, response);
	               		}
	               	}
                %>
                
                <label class="alert alert-success" style="display:none" id="AddFrdSucInfo">
		  		Add friend successfully !
				</label>
				<label class="alert alert-error" style="display:none" id="AddFrdNotFoundInfo">
		  			Your friends have not yet registered, go and inform him\her !
				</label>
				<label class="alert alert-error" style="display:none" id="AddFrdFailInfo">
		  			Unknown Error !
				</label>
          
          
          
          
        </div><!--/span-->
        
        
        
        
        <div id="AddFriendModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
          <h3 id="myModalLabel"></h3>
        </div>
        <div class="modal-body">
          <form class="form-signin" id="addfriendform" action="AddFriend" method="post">
            <h2 class="form-signin-heading">Add Friend</h2>
            <input type="text" class="input-block-level" name="friendID" placeholder="Please input your friend's name">
            <input type="hidden" name="userID" value="<%=uid%>"></input>
            
            <button class="btn btn-large btn-primary" type="submit">Add</button>
          </form>

        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
          <!-- <button id="btn_signin" class="btn btn-primary">Sign in</button> -->
        </div>
      </div>
      
      
      
      <div id="UploadFileModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
          <h3 id="myModalLabel"></h3>
        </div>
        <div class="modal-body">
          <form class="form-signin" id="addfriendform" action="UploadFile" method="post" enctype="multipart/form-data">
            <h2 class="form-signin-heading">Upload file</h2>
            <input type="file" class="input-block-level" name="filepath">
            <br>
            <button class="btn btn-large btn-primary input-block-level" type="submit">Upload</button>
            <input type="hidden" name="userID_file" value="<%=uid%>"></input>
          </form>

        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
          <!-- <button id="btn_signin" class="btn btn-primary">Sign in</button> -->
        </div>
      </div>
        
        
        
        
        
        <div class="span9">
          <div class="hero-unit">
            <h2><%
            		if(fid!=null){
						if(fid.equals(uid)){
							out.print("My Cloud clipboard");
						}
						else{
							out.print(fid+"'s Cloud clipboard");
						}
					}
					else{
						out.print("My Cloud clipboard");
					}
				%></h2>
            <label>type
              <textarea id="cloudType" class="uneditable-input span2" readonly="true">
              		<%
              			if(tp != null)
              			{
              				out.println(tp);
              			}
              		%>
              </textarea>
            </label>
            <textarea id="cloudClipboard" class="clipboard span12" readonly="true">
            		<%
            			if(ctx != null)
              			{
              				out.println(ctx);
              			} 
              			
              		%>
              			
            </textarea>
          </div>

          <div class="btn-group">
            <button class="btn" id="btn_upload">↑(Upload)</button>
            <button class="btn" id="btn_download">↓(Download)</button>
            <button class="btn" id="btn_file">◎↑(Upload file)</button>
            <button class="btn" id="btn_downloadfile">◎↓(Download file)</button>
            <div></div>
          </div>

          <div class="hero-unit">
            <h2>My localboard</h2><h3>(push down "Ctrl+V" to refresh the local clipboard)</h3>
             <label>type
                <textarea id="localType" class="uneditable-input span2" readonly="true">
                	text
                </textarea>
            </label>
              <textarea id="localClipboard" class="clipboard span12" readonly="true">
              	
              </textarea>
          </div>
          
        </div><!--/span-->
      </div><!--/row-->

      <hr>

      <footer>
        <p>&copy; Copyright 2013 Bofan. All rights reserved.</p>
      </footer>

    </div><!--/.fluid-container-->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/lib/jquery.js"></script>
    <script src="assets/js/lib/bootstrap.js"></script>
    <script src="assets/js/lib/bootstrap.min.js"></script>
    <script src="assets/js/lib/bootstrap-modal.js"></script>
	<script type="text/javascript" src="assets/js/lib/ZeroClipboard.js"></script>
	
    <script type="text/javascript" src="assets/js/init.js"></script>
    <script type="text/javascript" src="assets/js/button.js"></script>
    <script type="text/javascript" src="assets/js/clipboard.js"></script>
    <script type="text/javascript" src="assets/js/local.js"></script>
    
    
    
    <!-- <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap-transition.js"></script>
    <script src="../assets/js/bootstrap-alert.js"></script>
    <script src="../assets/js/bootstrap-modal.js"></script>
    <script src="../assets/js/bootstrap-dropdown.js"></script>
    <script src="../assets/js/bootstrap-scrollspy.js"></script>
    <script src="../assets/js/bootstrap-tab.js"></script>
    <script src="../assets/js/bootstrap-tooltip.js"></script>
    <script src="../assets/js/bootstrap-popover.js"></script>
    <script src="../assets/js/bootstrap-button.js"></script>
    <script src="../assets/js/bootstrap-collapse.js"></script>
    <script src="../assets/js/bootstrap-carousel.js"></script>
    <script src="../assets/js/bootstrap-typeahead.js"></script> -->

  </body>
</html>

//index.jsp
function onBtnSignup(){
	
	//alert("click register");
};


function onBtnSigninNow(){
//	$('#registerInfo').fadeIn(1000);
//	$('#registerInfo').delay(1000).fadeOut(1000);
	$("#loginModal").modal();
};


//clipboard.jsp


//friendlist
function onFriendLink(friendID){
	//alert(friendID);
}

function onBtnAddFriend(userID, friendID){
	$("#AddFriendModal").modal();
}

function onBtnDelFriend(userID, friendID){
	//alert("me: "+userID+"  frd: "+friendID);
	$.post("DeleteFriend?userID="+userID+" &friendID="+friendID);
}

//clipboard
function onBtnupload(){
	var userID = $("#myID").text();
	var text = $("#localClipboard").text();
	$.post("UploadClipboard?userID="+userID+" &context="+text);
	/*$("#cloudType").text();
	var input = document.getElementById("cloudType");
	input.focus();
	input.select();
	document.execCommand("Copy");*/
};

function onBtnDownload(){
	var str = $("#cloudClipboard").text();
	$("#localClipboard").text(str);
	
	/*var clip = new ZeroClipboard($("btn_download"));
	clip.setHandCursor( true );
	clip.setText(str);
	clip.glue($("btn_download"));*/
	
};

function onBtnFile(){
	$("#UploadFileModal").modal();
}

function onBtnDownloadFile(userID){
	$.post("DownloadFile?userID="+userID);
}








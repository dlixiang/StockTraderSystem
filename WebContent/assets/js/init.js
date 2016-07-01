
function init(){
	
	//login.jsp
	
	//init button
	$("#btn_signup").click(function(){
		onBtnSignup();
	});

	$("#btn_signinnow").click(function(){
		onBtnSigninNow();
	});
	

	//clipboard.jsp
	
	//initFriendList();
	
	
	$(".flink").click(function(){
		$("li[class='active']").attr("class","inactive");
		$(this).parent().attr("class","active");
		
		//onFriendLink($(this).text());
	});
	
	$("#btn_addFriend").click(function(){
		onBtnAddFriend($("#myID").text(), $(".active").text());
	});
	
	$("#btn_delFriend").click(function(){
		onBtnDelFriend($("#myID").text(), $(".active").text());
	});
	//initLocalClipboard();
	
	
	//init button
	$("#btn_upload").click(function(){
		onBtnupload();
	});

	$("#btn_download").click(function(){
		onBtnDownload();
	});

	$("#btn_file").click(function(){
		onBtnFile();
	});
	
	$("#btn_downloadfile").click(function(){
		onBtnDownloadFile($("#myID").text());
	});
	
	document.onpaste = function(event){
		
		//alert(event.clipboardData.getData("text"));
		var txt = event.clipboardData.getData("text")
		$("#localClipboard").text(txt);
//		  var items = event.clipboardData.items;
//		  console.log(JSON.stringify(items)); // will give you the mime types
//		  var blob = items[0].getAsFile();
//		  var reader = new FileReader();
//		  reader.onload = function(event){
//		    console.log(event.target.result)}; // data url!
//		  reader.readAsDataURL(blob);
		}
	
//	var e = document.createEvent("KeyboardEvent");
//	e.initEvent("paste");
//    $("body").trigger(e);

}

//function isCtrlV()
//{
//    var ctrlDown = false;
//    var ctrlKey = 17, vKey = 86, cKey = 67;
//
//    $(document).keydown(function(e)
//    {
//        if (e.keyCode == ctrlKey) ctrlDown = true;
//    }).keyup(function(e)
//    {
//        if (e.keyCode == ctrlKey) ctrlDown = false;
//    });
//
//    $(".no-copy-paste").keydown(function(e)
//    {
//        if (ctrlDown && (e.keyCode == vKey || e.keyCode == cKey)) return false;
//    });
//}


function initLocalClipboard(){
//	var str = getClipboardData();
//	$("#localClipboard").text(str);
}


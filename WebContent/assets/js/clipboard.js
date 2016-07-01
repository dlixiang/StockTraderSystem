function setClipboard(maintext) {
   if (window.clipboardData) {
      return (window.clipboardData.setData("Text", maintext));
   }
   else if (window.netscape) {
      netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
      var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
      if (!clip) return;
      var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
      if (!trans) return;
      trans.addDataFlavor('text/unicode');
      var str = new Object();
      var len = new Object();
      var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
      var copytext=maintext;
      str.data=copytext;
      trans.setTransferData("text/unicode",str,copytext.length*2);
      var clipid=Components.interfaces.nsIClipboard;
      if (!clip) return false;
      clip.setData(trans,null,clipid.kGlobalClipboard);
      return true;
   }
   return false;
}
 
//获取粘贴板的内容
function getClipboardData() {
    //IE
    if (window.clipboardData) {
        return window.clipboardData.getData("Text");
    }
    //Firxfox
    else if (window.netscape) {
        try {
            netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
        }
        catch (e) {
            alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将[signed.applets.codebase_principal_support]设置为'true'");
            return null;
 
            var clip = Components.classes['@@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
            if (!clip) {
                alert("粘贴板对象为空");
                return null;
            }
            var trans = Components.classes['@@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
            if (!trans) {
                alert("数据转换对象为空");
                return null;
            }
            trans.addDataFlavor('text/unicode');
            clip.getData(trans, clip.kGlobalClipboard);
            var str = new Object();
            var len = new Object();
            try {
                trans.getTransferData('text/unicode', str, len);
            }
            catch (error) {
                alert("粘贴数据转换出错");
                return null;
            }
            if (str) {
                if (Components.interfaces.nsISupportsWString)
                    str = str.value.QueryInterface(Components.interfaces.nsISupportsWString);
                else if (Components.interfaces.nsISupportsString)
                    str = str.value.QueryInterface(Components.interfaces.nsISupportsString);
                else str = null;
            }
            if (str) {
                return (str.data.substring(0, len.value / 2));
            }
        }
        return null;
    }
}



function copyToClipboard(text)
{
    if (window.clipboardData) // Internet Explorer
    {  
        window.clipboardData.setData("Text", text);
    }
    else
    {  
        unsafeWindow.netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");  
        const clipboardHelper = Components.classes["@mozilla.org/widget/clipboardhelper;1"].getService(Components.interfaces.nsIClipboardHelper);  
        clipboardHelper.copyString(text);
    }
}
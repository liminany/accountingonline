function numbersonly(e) { var t = e.charCode ? e.charCode : e.keyCode; return 8 != t && (48 > t || t > 57) ? !1 : void 0 } function funSendEMail(e) { document.getElementById("div_Facebook").style.display = "none", document.getElementById("td_SendEmail").style.display = "none", "facebook" == e ? document.getElementById("div_Facebook").style.display = "none" == document.getElementById("div_Facebook").style.display ? "" : "none" : document.getElementById("td_SendEmail").style.display = "none" == document.getElementById("td_SendEmail").style.display ? "" : "none" } function funAdsManage(e) { if ("0" == e) { var t = confirm("هل انت متأكد من إعادة تفعيل الإعلان لمدة 6 ايام ؟ "); return t ? !0 : !1 } var t = confirm("هل انت متأكد من حذف هذا الإعلان ؟ "); return t ? !0 : !1 }
this.screenshotPreview = function () {
    xOffset = 10;
    yOffset = 30;
    $("a.screenshot").hover(function (e) {
        this.t = this.title;
        //this.title = "";
        var c = (this.t != "") ? "<br/>" + this.t : "";
        $("body").append("<p id='screenshot'><img src='" + this.rel + "' alt='url preview' width='300' height='200'  />" + c + "</p>");
        $("#screenshot")
	    .css("top", (e.pageY - xOffset) + "px")
		.css("left", (e.pageX + yOffset) + "px")
		.fadeIn("fast");
    },
function () {
	this.title = this.t;
	$("#screenshot").remove();
	});
    $("a.screenshot").mousemove(function (e) {
        $("#screenshot")
		.css("top", (e.pageY - xOffset) + "px")
		.css("left", (e.pageX + yOffset) + "px");
    });
};
$(document).ready(function () {
    screenshotPreview();
});



/////////////popup ////////////
/*
var popunder
function get_cookie(Name) {
    var search = Name + "="
    var returnvalue = "";
    if (document.cookie.length > 0) {
        offset = document.cookie.indexOf(search)
        if (offset != -1) { // if cookie exists
            offset += search.length
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset);
            // set index of end of cookie value
            if (end == -1)
                end = document.cookie.length;
            returnvalue = unescape(document.cookie.substring(offset, end))
        }
    }
    return returnvalue;
}
popfrequency = "18 hours"
function resetcookie() {
    var expireDate = new Date()
    expireDate.setMinutes(expireDate.getMinutes() - 0)
    document.cookie = "popunder=;path=/;expires=" + expireDate.toGMTString()
}
function loadornot() {
    if (get_cookie('popunder') == '') {
        loadpopunder()
        var expireDate = new Date()
        expireDate.setMinutes(expireDate.getMinutes() + parseInt(popfrequency))
        document.cookie = "popunder=" + parseInt(popfrequency) + ";path=/;expires=" + expireDate.toGMTString()
    }
}
function loadpopunder() {
    document.write('<body onclick="rwmrgfdq_Popup()" >');
}
if (get_cookie('popunder') != parseInt(popfrequency))
    resetcookie()
loadornot()

var opened;
function rwmrgfdq_Popup() {
    if (opened != 1) {
        opened = 1;
        window.open("http://livekora.net/", "rwmrgfdqpop", "scrollbars = 1, resizable = 1,status = 1,width=660,height=450");
    }
}
*/
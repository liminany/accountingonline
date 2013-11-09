//Check if User input is Integer
// put this code in textbox Event  ==>  onkeypress="return numbersonly(event)"
function numbersonly(e) {
    var unicode = e.charCode ? e.charCode : e.keyCode
    if (unicode != 8) { //if the key isn't the backspace key (which we should allow)
        if (unicode < 48 || unicode > 57) //if not a number
            return false //disable key press
    }
}


function funSendEMail(tab) {
    document.getElementById("div_Facebook").style.display = "none";
    document.getElementById("td_SendEmail").style.display = "none";
    if (tab == "facebook") {
        if (document.getElementById("div_Facebook").style.display == "none") {
            document.getElementById("div_Facebook").style.display = "";
        }
        else {
            document.getElementById("div_Facebook").style.display = "none";
        }
    }
    else {
        if (document.getElementById("td_SendEmail").style.display == "none") {
            document.getElementById("td_SendEmail").style.display = "";
        }
        else {
            document.getElementById("td_SendEmail").style.display = "none";
        }
    }
}

function funAdsManage(value) {
    if (value == "0") {
        var returnValue = confirm("هل انت متأكد من إعادة تفعيل الإعلان لمدة 6 ايام ؟ ");
        if (returnValue) {
            return true;
        }
        else {
            return false;
        }
    }
    else {
        var returnValue = confirm("هل انت متأكد من حذف هذا الإعلان ؟ ");
        if (returnValue) {
            return true;
        }
        else {
            return false;
        }
    }
}

//GSCookie.js
//Set and get cookie to save data


// How Used cookie File:

// * import JS File
//To Fill The Cookie <input type="button" value="set Cookie" onclick="createCookie('<Cookie_Name>','<Cookie_Data>',<Expire Cookie-By Days->)"/>
//Retrieve Cookie Value <input type="button" value="Get Cookie" onclick="readCookie('<Cookie_Name>')"/>
//Erase Cookie <input type="button" value="Get Cookie" eraseCookie="readCookie('<Cookie_Name>')"/>




function CheckCookiesExists(cookiesName) {
    if (document.cookie.indexOf(cookiesName) != -1)
        return true;
    else
        return false;
}



function createCookie(name, value, days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    }
    else var expires = "";
    document.cookie = name + "=" + value + expires + "; path=/";
}
 
function readCookie(name) {
    var nameEQ = name + "=";
    var returnValue = "";
    var ca = document.cookie.split(';');

    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) {
            returnValue = c.substring(nameEQ.length, c.length);
        }
    }
    return returnValue;
} 

function eraseCookie(name) {
    createCookie(name, "null", -1);
}

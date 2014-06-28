//////////// Generic Ajax - starts  /////////
/**
 * The Simple ajax object and calling functions.
 * The global XML request object is created by default.  
 */

var ajaxHttpReq = getajaxHttpReqObject(); // global Request Object
  
function getajaxHttpReqObject()
{	
	if (window.XMLHttpRequest)	//Mozilla / safari
		return new XMLHttpRequest();
	else if(window.ActiveXObject)	//IE
		return	new ActiveXObject("Microsoft.XMLHTTP");
}

/**
 * The ajax request sending function.
 * @name ajaxCall
 * @access public
 * @param string ajaxFile Server side script to call
 * @param string queryString The query string passed to this request
 * @param string responseHandler The response handler function 
 * @return void
 */
function ajaxCall(ajaxFile, queryString, responseHandler )
{
	if(ajaxHttpReq)
	{
		ajaxHttpReq.open('get', ajaxFile+'?'+queryString, true);
		ajaxHttpReq.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajaxHttpReq.onreadystatechange = eval(responseHandler);	// Response handling function for the ajax request.
		ajaxHttpReq.send( null );
	}
}


//////////// Generic Ajax - Ends  /////////

function isValidEmail(email)
{
	if (validateEmail(email))
		return true;
	else
	   return false;
}

//updated on 18-Dec-2013, Referred from http://stackoverflow.com/questions/46155/validate-email-address-in-javascript
function validateEmail(email)
{	
    var pattern=/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return pattern.test(email);
}

function isNumeric(sText)
{
	var ValidChars = "0123456789.";
	var IsNumber=true;
	var Char;

	for (i = 0; i < sText.length && IsNumber == true; i++) 
	{ 
		Char = sText.charAt(i); 
		if (ValidChars.indexOf(Char) == -1) 
		{
			IsNumber = false;
		}
	}
	return IsNumber;
}

function changeCity(subdomain, domain)
{
        if (subdomain != '' && typeof subdomain != undefined && domain != '' &&  typeof domain != undefined)
        {
                if (subdomain == 'www')
                        clearCookie( domain );
                        
                window.location = 'http://' + subdomain + '.' + domain;
        }
}

//function for loading/resetting the default text in header search textbox
function headerKeywords(action_val, header_search_text)
{
	var myform = document.header_search_form;
	if (action_val == '1'){ //being called onfocus
		if(myform.header_search_key.value == header_search_text) myform.header_search_key.value = '';	
	}
	if (action_val == '2'){ //being called onblur
		if(myform.header_search_key.value == '') myform.header_search_key.value = header_search_text;
	}		
}

//function to validate city selection in the header search panel
function validateHeaderSearch( myform, header_search_text )
{
	var cat_id = myform.category_list.value;
        var domain  = myform.domain_name.value;
        if (myform.city_list)
                var subdomain = myform.city_list.value;
        else
                var subdomain = myform.subdomain.value;
        
	var keyword = myform.header_search_key.value;
	//var cat_id_text = myform.cat_name.value;
	
        city_err = '';
        cat_err  = '';
        text_err = '';
	if ( subdomain == '' || subdomain == 0 )
	{
		clearCookie( domain );
		city = 'www';
                city_err = 'Please select a city';
	}

	if ( cat_id == '' || cat_id == 0 )
                cat_err = 'Please select a category';
        
	if( keyword == header_search_text || keyword == '')
                text_err = 'Please type a keyword to search';
        
        if (document.getElementById('header_search_city_err'))
                document.getElementById('header_search_city_err').innerHTML = city_err;
        document.getElementById('header_search_cat_err').innerHTML  = cat_err;
        document.getElementById('header_search_text_err').innerHTML = text_err;
        
        search_url = '';
        if (city_err == '' && cat_err == '' && text_err == '')
        {
                if ( cat_id > 0 )
                    var search_url = 'http://' + subdomain + '.' + domain + '/' + formatSearchKeywordUrl(keyword) + '-h' + cat_id;
                else
                    var search_url = 'http://' + subdomain + '.' + domain + '/' + formatSearchKeywordUrl(keyword) + '-h0';
						
        }
		alert(search_url);
        //trackEvent('Header Search Keywords', keyword, cat_id_text);
        //trackEvent('Header Search Count', cat_id_text, keyword);
        if (search_url != '')
        {
                myform.action = search_url;
                myform.submit();
                return true;
        }
        else
                return false;
}

function clearCookie( domain )
{
	var str = 'mobi_subdomain=; expires=-1;' + "path=/; domain=." + domain ;
	document.cookie = str;
	return true
}

function formatSearchKeywordUrl( str ) 
{
	//replace other than alpha numeric to hyphen
	var keyword_url = str.replace(/[^a-z0-9]/gi, '-').toLowerCase();
	//replace more hyphen to one hyphen
	keyword_url = keyword_url.replace(/\-{2,}/g, '-');
	//trim hyphen
	keyword_url = keyword_url.replace(/^\-+|\-+$/g,'');
	return keyword_url;
}


/**
 * To escape special chars white spaces and replace them with replace_char
 * @name escapeString
 * @access public
 * @param string str
 * @param string replace_char
 * @return str
 * @added by : kathiresan.d@oneindia.co.in
 * @added on : 15-Dec-2011
 * @last modified by : 
 * @last modified on :
 */
function escapeStringByChar( str, replace_char )
{
        // replace all non-alphanumeric chars with space
        str = str.replace(/\W/g, ' ');
	// replace more space with single space
        str = str.replace(/\s{2,}/g, ' ');
	//trim
	str = str.replace(/^\s+|\s+$/g,'');
        // replace space with plus
        str = str.replace(/\s/g, replace_char);
	
	return str;
}

function loadMobileModelsSearch()
{
	document.getElementById('model').options[0].selected = 'selected'; //resets the model field when make is changed.

        var make_index  = document.getElementById('519').value;
        var model_index = document.getElementById('model_index').value;
        var return_id   = 'model_list';
	var cat_id      = document.getElementById('search_cat_id').value;
        var url_params  = "cat_id=" + cat_id + "&brand=" + make_index + "&return_id=" + return_id;

        if (model_index != '')
                url_params += "&model=" + model_index;
        
        document.getElementById(return_id).innerHTML = '';

        ajaxCall('/ajax/ajax_getmobilemodel.php', url_params, 'showMobileModelsSearch');     
}

//Response handler for loadMobileModelsSearch 
function showMobileModelsSearch()
{
        var response;
        if((ajaxHttpReq.readyState == 4) && (ajaxHttpReq.status == 200))
        {
                response = ajaxHttpReq.responseText.split('||');
                response_val = response[0];
                return_id    = response[1];
                if( response )
                {
                        document.getElementById(return_id).innerHTML = response_val;
                }
        }
}

function loadCarBikeModelsSearch()
{
	document.getElementById('model').options[0].selected = 'selected'; //resets the model field when make is changed.

        var make_index  = document.getElementById('make').value;
        var model_index = document.getElementById('model_index').value;
        var return_id   = 'model_list';
	var cat_id      = document.getElementById('search_cat_id').value;
        var url_params  = "cat_id=" + cat_id + "&make=" + make_index + "&return_id=" + return_id;

        if (model_index != '')
                url_params += "&model=" + model_index;
        
        document.getElementById(return_id).innerHTML = '';

        ajaxCall('/ajax/ajax_getcarbikemodel.php', url_params, 'showCarBikeModelsSearch');       
}

//Response handler for loadCarBikeModelsSearch 
function showCarBikeModelsSearch()
{
        var response;
        if((ajaxHttpReq.readyState == 4) && (ajaxHttpReq.status == 200))
        {
                response = ajaxHttpReq.responseText.split('||');
                response_val = response[0];
                return_id    = response[1];
                if( response )
                {
                        document.getElementById(return_id).innerHTML = response_val;
                }
        }
}

function setCarBikeMakeModelValuesForSearch()
{
        var make_text = '';var model_text = '';
        if (document.getElementById('make').value != '')
                make_text = 'make-' + document.getElementById('make').value + '-' + escapeStringByChar(document.getElementById('make').options[document.getElementById('make').selectedIndex].text.toLowerCase(), '+');
        if (document.getElementById('model').value != '')
                model_text = 'model-' + document.getElementById('model').name + '-' + document.getElementById('model').value + '-' + escapeStringByChar(document.getElementById('model').options[document.getElementById('model').selectedIndex].text.toLowerCase(), '+');

        document.getElementById('make_text').value  = make_text;
        document.getElementById('model_text').value = model_text;
}

function loadJobRoles()
{
	var job_cat_index = document.getElementById('jobcat').value;
        var job_role_val  = document.getElementById('role_val').value;
        var return_id = 'roles'; //place to load the ajax response
	var params    = 'jobcat=' + escape(job_cat_index) + '&return_id=' + return_id;

	if (job_role_val != '')
		params += '&role_val='+escape(job_role_val);
        document.getElementById(return_id).innerHTML = '';
	ajaxCall( '/ajax/ajax_getjobrolefield.php', params, 'showJobRoles');
}

function showJobRoles()//Response handler for loadJobRoles 
{
    var response;
    if((ajaxHttpReq.readyState == 4) && (ajaxHttpReq.status == 200))
    {
        response = ajaxHttpReq.responseText.split('||');
        response_val = response[0];
        return_id    = response[1];
        if( response )
        {
            document.getElementById(return_id).innerHTML = response_val;
        }
    }
}

function loadHeaderCategoryList(parent_cat_id)
{
        var params  = 'cmd=getHeaderCategoryList&parent_cat_id=' + escape(parent_cat_id);
	
	ajaxCall( '/ajax/ajax_common.php', params, 'showHeaderCategoryList');
}

//Response handler for loadSubcategoriesForSearch 
function showHeaderCategoryList()
{
    var response;
    if((ajaxHttpReq.readyState == 4) && (ajaxHttpReq.status == 200))
    {
	response = ajaxHttpReq.responseText;
        if( response != '' )
        {
            document.getElementById('category_list_loader').innerHTML = response;
        }
    }
}

function loadHeaderCategoryListForSearch(parent_cat_id)
{
        var params  = 'cmd=getHeaderCategoryListForSearch&parent_cat_id=' + escape(parent_cat_id);
	
	ajaxCall( '/ajax/ajax_common.php', params, 'showHeaderCategoryListForSearch');
}

//Response handler for loadSubcategoriesForSearch 
function showHeaderCategoryListForSearch()
{
    var response;
    if((ajaxHttpReq.readyState == 4) && (ajaxHttpReq.status == 200))
    {
	response = ajaxHttpReq.responseText;
        if( response != '' )
        {
            document.getElementById('category_search_list_loader').innerHTML = response;
        }
    }
}

function loadSubjects()
{
        var subject_val = '';
        var level_index = document.getElementById('139').value; //level
        if (document.frm_search.subject)
                subject_val = document.frm_search.subject.value;
        
	var params = 'level=' + escape(level_index);
	if (typeof subject_val != undefined && (subject_val != '' || subject_val == '0'))
		params += '&subject_val='+escape(subject_val);
        
        document.getElementById('subject_list').innerHTML = '';
	ajaxCall( '/ajax/ajax_getsubject.php', params, 'showSubjects');
}

//Response handler for loadSubjects 
function showSubjects()
{
    var response;
    if((ajaxHttpReq.readyState == 4) && (ajaxHttpReq.status == 200))
    {
	response = ajaxHttpReq.responseText;
        if( response != '' )
        {
            document.getElementById('subject_list').innerHTML = response;
        }
    }
}

function deleteAd(post_id, delete_url)
{
	if(confirm("Are you sure want to delete this Ad?"))
	{
		if (post_id > 0 && delete_url != '')
		{
			location.href = delete_url;
		}
	} 
}

function deleteReply(reply_id, post_id)
{
	if(confirm("Are you sure want to delete this Reply?"))
	{
		var params = 'cmd=deleteReply&reply_id='+reply_id + '&post_id='+post_id;
		ajaxCall('/ajax/ajax_common.php', params, 'deleteReplyResponse');
	} 
}

function deleteReplyResponse()
{
	var response;
    if((ajaxHttpReq.readyState == 4) && (ajaxHttpReq.status == 200))
    {
		response = ajaxHttpReq.responseText.split('^');
		status	 = response[0];
		reply_id = response[1];
        if(status == 1 && reply_id > 0)
        {
            if (document.getElementById('div_'+reply_id ))
				document.getElementById('div_'+reply_id ).style.display = 'none';
        }
		else
			document.getElementById('div_'+reply_id ).style.display = 'block';
    }	
}

function onChangeLocality()
{
	loc_obj    = document.getElementById('locality');
        regloc_obj = document.getElementById('region_localities');
	reg_loc_flag = 0;

	if (regloc_obj)
	{
		reg_loc_ids    = regloc_obj.value;
		reg_loc_id_arr = reg_loc_ids.split(',');
		for(l=0;l<reg_loc_id_arr.length;l++)
		{
			if (loc_obj.options[loc_obj.selectedIndex].value == reg_loc_id_arr[l])
				reg_loc_flag = 1;
		}
	}
	surr_value = document.getElementById('surrounding').checked;
	
	if (loc_obj.options[loc_obj.selectedIndex].value == '' || reg_loc_flag == 1)
	{
		document.getElementById('surrounding').checked  = false;
		document.getElementById('surrounding').disabled = true;
	}
	else
	{
		document.getElementById('surrounding').disabled = false;
		document.getElementById('surrounding').checked  = true;
	}
	
	if(surr_value == false)
		document.getElementById('surrounding').checked  = false;
        else
                document.getElementById('surrounding').checked  = true;
}

function goSearch(id, cat_name)
{
        objHeaderSearchForm = document.header_search_form;
        search_text         = objHeaderSearchForm.header_search_key.value;
        search_cat_obj      = objHeaderSearchForm.header_search_category;
        
        var domain          = objHeaderSearchForm.header_domain.value;
        var subdomain       = objHeaderSearchForm.header_subdomain.value;
        if(subdomain == '')
                subdomain = 'www';
        var search_url      = '';
        var search_cat_id   = '';
        
        if (search_text == '')
        {
                cat_link = '';
                for (var i=0; i < search_cat_obj.length; i++)
                {
                        if (search_cat_obj[i].checked){
                                search_url = search_cat_obj[i].title;
                                break;
                        }
                }
                
                search_url = document.getElementById(id).title;
                
                //if (cat_link != '')
                        //window.location = cat_link;
        }
        else
        {
			for (var i=0; i < search_cat_obj.length; i++)
			{
					if (search_cat_obj[i].checked){
							search_cat_id = search_cat_obj[i].value;
							break;
					}
			}
			search_cat_id = document.getElementById(id).value;
			
			if (search_cat_id == '')
			{
					alert('Select a category');
					return false;
			}
			
			var search_url = 'http://' + subdomain + '.' + domain + '/' + formatSearchKeywordUrl(search_text) + '-h' + search_cat_id;
						
			trackEvent('Header Search Keywords', search_text, cat_name);
			trackEvent('Header Search Count', cat_name, search_text);
        }
        
        if (search_url != '')
        {
                //objHeaderSearchForm.action = search_url;
                //objHeaderSearchForm.submit();
				location.href = search_url;
                //return true;
        }
        else
                return false;
}

function goKeywordSearch(search_cat_id)
{
        objSearchForm = document.frm_search;
        search_text   = objSearchForm.search_key.value;
        
        //var domain          = objHeaderSearchForm.header_domain.value;
        //var subdomain       = objHeaderSearchForm.header_subdomain.value;
        
        var search_url      = '';
        if (search_cat_id <= 0)
        {
                alert('Select a category');
                return false;
        }
        if (search_text == '')
        {
                alert('Enter your search text');
                objSearchForm.search_key.focus();
                return false;
        }
                
        search_base_url = objSearchForm.search_main_url.value + 'search/1/';
        if (search_cat_id > 0 && search_text != '') //adding cat id in the url if category is selected
        {
                search_url = search_base_url + search_cat_id + '/' + formatSearchKeywordUrl(search_text) + '.html';
        }

        if (search_url != '')
        {
                objSearchForm.action = search_url;
                objSearchForm.submit();
                //window.location = search_url;
                //return true;
        }
        else
                return false;
}

function sendReply( postid, cat_id )
{
	var formobj     = document.frm_reply_post;
	var reply_email = formobj.reply_from.value;
    var mobile_no   = formobj.mobile_no.value;
	var message	= formobj.reply_message.value;
	var scode = formobj.scode.value;
	var encode = formobj.encode.value;
		
	var err_msg	= '';
	var sendcopy    = 0;
	if (reply_email != '')
	{
		if ( !isValidEmail( reply_email ))  // To check the email validation here
                {
                        alert('Enter valid Email ID');return;
                }
	}
	else
        {
		//err_msg += 'Enter the "Email ID"<br />';
                alert('Enter Email ID');return;
        }
        
	if (mobile_no != '')
        {
		if (!isNumeric(mobile_no) || mobile_no.length != 10)
                {
                        //err_msg += 'Invalid Mobile Number<br />';
                        alert('Enter valid Mobile Number');return;
                }
        }
        else
        {
                //err_msg += 'Enter the "Mobile Number"<br />';
                alert('Enter Mobile Number');return;
        }
        
	if (message == '')
        {
		//err_msg += 'Enter the "Message"<br />';
                alert('Enter the Message');return;
        }
		
		if (scode == '')
		{
			alert('Enter security');return;
		}
		else
		{
			var qrystr = 'cmd=verifyCaptcha&scode='+scode+'&encode='+encode;
	
			if (ajaxHttpReq.readyState == 4 || ajaxHttpReq.readyState == 0)
			{
				ajaxHttpReq.open('post', '/ajax/ajax_common.php', true);
				ajaxHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				ajaxHttpReq.onreadystatechange = function ()
				{
					if((ajaxHttpReq.readyState == 4) && (ajaxHttpReq.status == 200))
					{
						if( ajaxHttpReq.responseText == 0) //Error
						{
							alert('Enter valid Security code');
							error_count = 1;
							
						}
						if( ajaxHttpReq.responseText == 1) //Valid
						{
							setTimeout(
							function(){
			
									
										var params = 'post_id='+postid+'&cmd=sendPostReply'+'&msg='+message+'&reply_from='+reply_email+'&mobile='+mobile_no+'&reply_copy='+sendcopy;
									
										ajaxCall( '/ajax/ajax_common.php', params, 'responseSendReply');
									
								}, 1000 );
						}
					}
				}
				ajaxHttpReq.send(qrystr);
			}
			
			
		}
		/*setTimeout(
		function(){
			
			if(error_count ==0)
			{
				var params = 'post_id='+postid+'&cmd=sendPostReply'+'&msg='+message+'&reply_from='+reply_email+'&mobile='+mobile_no+'&reply_copy='+sendcopy;
			
				ajaxCall( '/ajax/ajax_common.php', params, 'responseSendReply');
			}
		}, 1000 );*/

}

//Response handler for sendReply 
function responseSendReply()
{
        var response;
        if((ajaxHttpReq.readyState == 4) && (ajaxHttpReq.status == 200))
        {
                response = ajaxHttpReq.responseText.split('^');
                var status   = response[0];
                var message = response[1];	
                if( message )
                {
                        document.getElementById('mail_response').style.display = 'block';
                        document.getElementById('mail_response').innerHTML = message;
						document.getElementById('mail_details').style.display = 'none';
						document.getElementById('mail_close').style.display = 'block';
                }
        }
}

function setOfferWanted(val)
{
        if (document.getElementById('offer_wanted') && val != '')
	{
		document.getElementById('offer_wanted').value = val;	
	}
}

function trackEvent(category, action, opt_label, opt_value) {	
	if (typeof(opt_label)=="undefined" || opt_label==null || opt_label=='') {
		opt_label = '';
	}
	if (typeof(opt_value)=="undefined" || opt_value==null || opt_value=='') {
		opt_value = 0;
	}		
	// track event
	_gaq.push(['_trackEvent', category, action, opt_label, opt_value]);
}

function addClassifiedAsFavourite( post_id, domain, page )
{
	var fav_classified = [];
	var fav_classified_JSON = "";
	var max_days = 60;
	
	if( getCookie( 'wap_favorite_classified' ) )
	{
		var fav_max_count = 40;
		fav_classified = jQuery.parseJSON(getCookie( 'wap_favorite_classified' ) );
		arr_index = fav_classified.indexOf(post_id);
		
		if( arr_index == -1 )
		{
			fav_classified.push(post_id);
			document.getElementById('myFavImg_'+post_id).src = "/images/heart1.png";
			document.getElementById('myFavImg_'+post_id).alt ="Remove from Favorite";
			document.getElementById('myFavImg_'+post_id).title ="Remove from Favorite";
			
			if( page == 'view')
			{
				document.getElementById('myFavImg1_'+post_id).src = "/images/heart1.png";
				document.getElementById('myFavImg1_'+post_id).alt ="Remove from Favorite";
				document.getElementById('myFavImg1_'+post_id).title ="Remove from Favorite";
			}
			
			trackEvent('Favorite clicks', 'Mark as favorite');
		}
		else
		{
			fav_classified.splice( arr_index, 1 );
			document.getElementById('myFavImg_'+post_id).src = "/images/heart2.png";
			document.getElementById('myFavImg_'+post_id).alt ="Mark as Favorite";
			document.getElementById('myFavImg_'+post_id).title ="Mark as Favorite";
			
			if( page == 'view')
			{
				document.getElementById('myFavImg1_'+post_id).src = "/images/heart2.png";
				document.getElementById('myFavImg1_'+post_id).alt ="Mark as Favorite";
				document.getElementById('myFavImg1_'+post_id).title ="Mark as Favorite";
			}
			
			if(page == 'list')
				document.getElementById('post_'+post_id).style.display = "none";
				
			trackEvent('Favorite clicks', 'Remove from favorite'); 
		}
		
		if( fav_classified.length > fav_max_count)
		{
			fav_classified.shift();
		}
		
		fav_classified_JSON = JSON.stringify(fav_classified);
	}
	else
	{
		fav_classified.push( post_id );
		fav_classified_JSON = JSON.stringify( fav_classified );
	}
	setCookies( 'wap_favorite_classified', fav_classified_JSON, max_days, domain);
	
	if( fav_classified.length > 0 )
	{
		document.getElementById('myFavCount').innerHTML = "<b>" + fav_classified.length + "</b>";
		document.getElementById('favourite').style.display = "block";
	}
	else
	{
		document.getElementById('myFavCount').innerHTML = "";
		document.getElementById('favourite').style.display = "none";
	}
}

function getCookie(c_name)
{
	var i,x,y,ARRcookies = document.cookie.split(";");
	for (i=0;i<ARRcookies.length;i++) {
		 x = ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
		 y = ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
		 x = x.replace(/^\s+|\s+$/g,"");
		 if (x==c_name) {
			 return unescape(y);
		 }
	 }
}

function setCookies(c_name,value,exdays,domain)
{
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var c_value = escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString()) + ";path=/" + "; domain=" + domain + ";";
	document.cookie=c_name + "=" + c_value;
}

// Remove leading blanks from our string.
// param           str - the string we want to LTrim
// Return          the input string without any leading whitespace
function LTrim(str)
{
	var whitespace = new String(" \t\n\r");
	var s = new String(str);
	if (whitespace.indexOf(s.charAt(0)) != -1) 
	{
		// We have a string with leading blank(s)...
		var j=0, i = s.length;

		// Iterate from the far left of string until we don't have any more whitespace...
		while (j < i && whitespace.indexOf(s.charAt(j)) != -1)
			j++;
		// Get the substring from the first non-whitespace character to the end of the string...
		s = s.substring(j, i);
	}
	return s;
}
// Remove trailing blanks from our string.
// Param           str - the string we want to RTrim
// Return          the input string without any trailing whitespace
function RTrim(str)
{
	// We don't want to trip JUST spaces, but also tabs, line feeds, etc.  Add anything else you want to "trim" here in Whitespace
	var whitespace = new String(" \t\n\r");
	var s = new String(str);
	if (whitespace.indexOf(s.charAt(s.length-1)) != -1) 
	{
		// We have a string with trailing blank(s)...
		var i = s.length - 1;       // Get length of string
		// Iterate from the far right of string until we don't have any more whitespace...
		while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1)
			i--;
		// Get the substring from the front of the string to where the last non-whitespace character is...
		s = s.substring(0, i+1);
	}
	return s;
}
// Remove trailing and leading blanks from our string.
// param           str - the string we want to Trim
// Return          the trimmed input string
function Trim(str)
{
  return RTrim(LTrim(str));
}
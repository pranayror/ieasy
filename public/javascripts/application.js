function insert_fields(link, method, content) {
var new_id = new Date().getTime();
var regexp = new RegExp("new_" + method, "g")
$(link).up().insert({
before: content.replace(regexp, new_id)
});
}

function remove_fields(link) {
    $(link).previous("input[type=hidden]").value = "1";
    $(link).up(".fields").hide();
}


jQuery(document).ready(function () {
								 
jQuery('.search').click(function() {
  jQuery('.search_block').slideToggle("slow");
});



jQuery('.permission_check').click(function() {
if(jQuery(this).attr("checked") == true)
jQuery('.'+jQuery(this).parent().parent().attr('class')).addClass("enabled");
else
jQuery('.'+jQuery(this).parent().parent().attr('class').split(' ')[0]).removeClass("enabled"); 
});

jQuery('.client_all_check').click(function() {
 if(jQuery(this).attr("checked") == true)
jQuery(".selected_clients").attr('checked',true)
else
jQuery(".selected_clients").attr('checked',false)
});


jQuery('.archive_clients').click(function() {
  if(jQuery(".selected_clients").is(':checked') == true){										  
 jQuery('.status_value').attr("value",'archive');
 jQuery('#client_status_form').submit();}
 else{
	 alert("Please seleect atleat one client");
	 return false;
 }
});


jQuery('.delete_clients').click(function() {
 if(jQuery(".selected_clients").is(':checked') == true){										  
 jQuery('.status_value').attr("value",'deleted');
 jQuery('#client_status_form').submit();}
 else{
 alert("Please seleect atleat one client");
  return false;
 }
});


 jQuery('.client_search_fields').click(function(){
  jQuery("form").each(function() {
	this.reset();
   }); 
});					   
					   
});
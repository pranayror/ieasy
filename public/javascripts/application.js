function insert_fields(link, method, content) {
var new_id = new Date().getTime();
var regexp = new RegExp("new_" + method, "g")
$(link).up().insert({
before: content.replace(regexp, new_id)
});
}

function remove_feilds(link) {
var hidden_field = $(link).previous("input[type=hidden]");
if(hidden_field){
hidden_field.value = '1';
}
$(link).up(".fields").hide();
}

function show_hide_secondary_address() {
		show_hide_with_pointer('#secondary_address_container', '#show_hide_secondary_address');
	}
	
	// creates a show/hide toggler.
	function show_hide_with_pointer(container, show_hide_box) {
		if ($(container).is(":visible")) {
			$(container).hide();
		} else {
			$(container).show();
		}

		var span = $(show_hide_box+' span')[0];
		var img = $(show_hide_box+' img')[0];

		if (span.innerHTML == 'Show') {
			span.innerHTML = 'Hide';
			arrow_img = "-down";
		}
		else {
			span.innerHTML = 'Show';
			arrow_img = "";
		}
		img.src = "/images/icon-arrow" + arrow_img + ".gif";
	}
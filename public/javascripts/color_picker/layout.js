(function($){
	var initLayout = function() {
		var hash = window.location.hash.replace('#', '');
		var currentTab = $('ul.navigationTabs a')
							.bind('click', showTab)
							.filter('a[rel=' + hash + ']');
		if (currentTab.size() == 0) {
			currentTab = $('ul.navigationTabs a:first');
		}
		showTab.apply(currentTab.get(0));

		
		
		
		$('.colour_selector_box').ColorPicker({
			color: '#0000ff',
			onShow: function (colpkr) {
				$(colpkr).fadeIn(500);
				return false;
			},
			onHide: function (colpkr) {
				$(colpkr).fadeOut(500);
				return false;
			},
			onChange: function (hsb, hex, rgb) {
				$('.colour_selector_box').css('backgroundColor', '#' + hex);
			    $('.area1_color').attr('value', '#'+hex);
				$('.preset_border').css('backgroundColor', '#' + hex);
			}
		});
		
		$('.colour_selector_box1').ColorPicker({
			color: '#0000ff',
			onShow: function (colpkr) {
				$(colpkr).fadeIn(500);
				return false;
			},
			onHide: function (colpkr) {
				$(colpkr).fadeOut(500);
				return false;
			},
			onChange: function (hsb, hex, rgb) {
				$('.colour_selector_box1').css('backgroundColor', '#' + hex);
			    $('.area2_color').attr('value', '#'+hex);
				$('.preset_nav').css('backgroundColor', '#' + hex);
				$('.preset_navbg').css('backgroundColor', '#' + hex);
			}
		});
		
			$('.colour_selector_box2').ColorPicker({
			color: '#0000ff',
			onShow: function (colpkr) {
				$(colpkr).fadeIn(500);
				return false;
			},
			onHide: function (colpkr) {
				$(colpkr).fadeOut(500);
				return false;
			},
			onChange: function (hsb, hex, rgb) {
				$('.colour_selector_box2').css('backgroundColor', '#' + hex);
			    $('.area3_color').attr('value', '#'+hex);
				$('.preset_nav1').css('backgroundColor', '#' + hex);
			}
		});
	};
	

	
	var showTab = function(e) {
		var tabIndex = $('ul.navigationTabs a')
							.removeClass('active')
							.index(this);
		$(this)
			.addClass('active')
			.blur();
		$('div.tab')
			.hide()
				.eq(tabIndex)
				.show();
	};
	
	EYE.register(initLayout, 'init');
})(jQuery)
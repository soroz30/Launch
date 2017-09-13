$(function() {
	var $blinds = $('[id^=blind]'),
		delay = 1500,
		speed = 250;

	function startAnimation() {
		$blinds.each(function(i) {
			var $blind = $blinds.eq(i);
			$blind.delay(1500 * i + 250).animate({
				top: "+=" + $blind.height(),
				height: 0
			}, 250);
		});
	}

	$("a").on("click", function(e) {
		e.preventDefault();
		$blinds.finish();
		$blinds.removeAttr("style");
		startAnimation();
	});

	startAnimation();
});
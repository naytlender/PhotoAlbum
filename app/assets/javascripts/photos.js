$(document).ready(function(){
	var height = $(".height200").attr('height')
	$(height).change(function(){
		$(".height200").attr("min-height", height);
		console.log(height)
	});
});
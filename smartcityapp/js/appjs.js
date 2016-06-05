$(document).ready(function(){
	$("#signup-link").click(function(event){
		var isVisible = $("div.login-container").css("display");
		if(isVisible == 'none')
		{
			$("div.login-container").css("display","block");
		}
		else if(isVisible == 'block')
		{
			$("div.login-container").css("display","none");
		}
	});
});
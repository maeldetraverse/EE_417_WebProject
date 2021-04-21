$(document).ready(function(){
	
	$(".basket-add-button").click(function(){
		
		console.log("add to basket");
    	
		//assemble JSON string from attributes
    	var text = '{' +
    	'"id"' + ':' + $(this).attr("data-id") + ',' +
    	'"title"' + ':' + '"' + $(this).attr("data-title") + '"' + ',' +
    	'"price"' + ':' + $(this).attr("data-price") + ',' +
    	'"thumbnail_url"' + ':' + '"' + $(this).attr("data-thumbnail-url") + '"' + ',' +
    	'"stock"' + ':' + $(this).attr("data-stock") + 
    	'}';
    	
		//parse into JSON object
    	var obj = JSON.parse(text);
		
		//retrieve basket from session storage - if undefined create an empty one
		if (typeof sessionStorage.basket === "undefined") {
			var temp = [];
			}
		else {
			var temp = JSON.parse(sessionStorage.basket)
			}
		
		//push latest object onto the basket
		temp.push(obj);
		
		//return to storage
		sessionStorage.setItem('basket', JSON.stringify(temp));
		
		//display popup
		$("#basket").css("display", "block");
    	
    })

});
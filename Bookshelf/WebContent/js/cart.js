$(document).ready(function(){
	
    $(".cart-button").click(function(){
    
    	var text = '{' +
    	'"id"' + ':' + $(this).attr("data-id") + ',' +
    	'"title"' + ':' + '"' + $(this).attr("data-title") + '"' + ',' +
    	'"price"' + ':' + $(this).attr("data-price") + ',' +
    	'"thumbnail_url"' + ':' + '"' + $(this).attr("data-thumbnail-url") + '"' + ',' +
    	'"stock"' + ':' + $(this).attr("data-stock") + 
    	'}';
    	
    	var obj = JSON.parse(text);
    	
    	console.log(obj);
    	
    })
	
});
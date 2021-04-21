$(document).ready(function(){
	
	//get basket from session
	if (typeof sessionStorage.basket === "undefined") {
		var temp = [];
		}
	else {
		var bookObject = JSON.parse(sessionStorage.basket)
		}
	
	//create table from basket data
	var table = $("<table></table>");
	for(var i in bookObject) {
		var row = $("<tr></tr>");
		row.append($("<td></td>").append(bookObject[i].title));
		row.append($("<td></td>").append($("<img>").attr("src", bookObject[i].thumbnail_url)));
		row.append($("<td></td>").append(bookObject[i].price));
		table.append(row);
	}
	
	//add table to page
	$("#my-basket").append(table);
	
	//add basket data to hidden form
	$("#basketData").attr("value",sessionStorage.basket);
	
	
	
	//on click - clears basket from local storage and reloads page
	$("#empty-button").click(function(){
		sessionStorage.clear();
		location.reload()
	});
	
});
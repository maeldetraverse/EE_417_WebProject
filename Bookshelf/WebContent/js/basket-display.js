$(document).ready(function(){
	
	//retrieve basket from storage - if undefined create an empty one
	if (typeof sessionStorage.basket === "undefined") {
		var temp = [];
		}
	else {
		var bookObject = JSON.parse(sessionStorage.basket)
		}
	
	//create table with a row for each book
	var table = $("<table></table>");
	for(var i in bookObject) {
		var row = $("<tr></tr>");
		row.append($("<td></td>").append(bookObject[i].id));
		row.append($("<td></td>").append(bookObject[i].title));
		row.append($("<td></td>").append(bookObject[i].price));
		row.append($("<td></td>").append($("<img>").attr("src", bookObject[i].thumbnail_url)));
		row.append($("<td></td>").append(bookObject[i].stock));
		table.append(row);
	}
	
	//add table to main-content
	$(".main-content").append(table);
	
	//create button to empty basket
	var emptyButton = $("<button>Empty Basket</button>");
	emptyButton.attr("id", "empty-button");
	$(".main-content").append(emptyButton);
	
	//on click - clears basket from local storage and reloads page
	$("#empty-button").click(function(){
		sessionStorage.clear();
		location.reload()
	});
	
});
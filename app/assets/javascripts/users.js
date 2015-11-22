console.log("User.js Sanity Check!");

$(document).ready(function () {
	$("#category-list").change(function (e) {
		// e.preventDefault();
		var category = $("#category-list option:selected").val().toLowerCase();
		console.log(category);
		$.ajax({
		  data: 'category=' + category,
		  dataType: 'json',
		  type: 'post',
		  url: "/users/show" 
		}).success(function(data){
			// console.log(data);
			// clear lists
			$(".row-to-empty").empty();
			// find the key and value pairs
			for(var i in data) {
				// check i != ""
				if (i !== "") {
				  // append to table
					$(".category-table").append(htmlString(i, data[i]));
				}
			}
		});
	});

	$("#month-list").change(function (e) {
		// e.preventDefault();
		var month = $("#month-list option:selected").val().toLowerCase();
		console.log(month);
		$.ajax({
		  data: 'month=' + month,
		  dataType: 'json',
		  type: 'post',
		  url: "/users/show" 
		}).success(function(data){
			// console.log(data);
			// clear lists
			$(".row-to-empty").empty();
			// find the key and value pairs
			for(var i in data) {
				// check i != ""
				if (i !== "") {
				  // append to table
					$(".month-table").append(htmlString(i, data[i]));
				}
			}
		});
	});
});

function htmlString(key, value){
	return '<tr class="row-to-empty">' + 
				 '<td>' + key + '</td>' + 
				 '<td>$' + value + '</td>' +
				 '</tr>';
}
console.log("Sanity Check!");

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
			console.log(data);
			$("#category").text(sumFunction(data));
		});
	});
});

// sums the transactions for a single category
function sumFunction(array) {
	var total = 0;
	for (var i = 0; i < array.length; i++) {
		total = total + array[i].amount;
		console.log(total);
	}
	return total;
}


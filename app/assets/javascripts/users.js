console.log("Sanity Check!");

$(document).ready(function () {
	$("#category-list option:selected").on("change", function (e) {
		e.preventDefault();
		var category = $(this).val();
		$.ajax({
		  data: 'category=' + category,
		  dataType: 'json',
		  type: 'post',
		  url: "/users/show"
		}).done(function(data) {
			console.log(data);
			return data.json;
		}).fail(function() {
			console.log("FAIL");
		});
	});
});
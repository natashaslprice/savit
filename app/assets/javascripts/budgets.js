$(document).ready(function() {

	// console.log("Javascript working!");
	// $('.new-budget-input').regexMask(/^\d+$/);

	//when a question-mark is clicked
	$('.glyphicon').click(function() {
		//an object of id's and the description
		var descriptions = {
			net_wages: "Net wages are the amount of income you earn after taxes.  You can include all sources of income including alimony and child support.", 
			rent_mortgage: "This is the amount you pay for rent or for your mortgage.  Do not include utilities or homeowner's insurance here.", 
			car: "Car expenses include any recurring expenses that stay the same each month.  This includes car payments, fixed parking costs, car insurance.  Do not include variable expenses such as fuel, tolls, or maintenance.", 
			public_transportation: "Only include public transportation costs that stay the same each month, such as a monthly bus pass.  Do not include any one-time or variable costs, such as using a taxi or rideshare service.", 
			insurance: "This includes all types of insurance, other than car insurance.",
			utilities: "Please include the average amount of your monthly utilities.", 
			internet: "Do not include cell phone costs.",
			cell_phone: "This is how much you pay for your cell phone use each month.",
			gym: "This includes any monthly gym memberships or monthly class passes. Do not include one-time fitness classes.",
			charity_donations: "Please enter any recurring donations you give to charity each month. This does not include one-time donations.",
			student_loan: "This is the monthly amount you pay for student loans.",
			credit_card: "If you have a monthly payment for your credit card, enter it here.  If the amount you pay varies each month, do not include the expense here.",
			other_expenses: "This is the total of any other fixed expenses not listed above.  Please only include expenses that stay the same each month.",
			other_string: "Use this space to list your other expenses, totalled above." 
		};
		//get the id of the glyphicon
		var question_id = $(this).attr("id");
		//put the descriptions into the popover
		$(this).attr('data-content', descriptions[question_id]);
		//toggle the popover for the specific question mark
		$('#' + question_id).popover('toggle');

	});

	//close the popover when anywhere on body is clicked
	$('body').on('click', function (e) {
		//for each popover
    	$('[data-toggle="popover"]').each(function () {
    	//if it was not popover that was clicked	
        if (!$(this).is(e.target)) {
        	//then hide the open popover(calling on all of them but only one will be open)
            $(this).popover('hide');   
        }
    });
});
});



class ChartsController < ApplicationController
	def new
		@user = current_user
		# create an empty array
		@savings_array = []
		# loop over all days
		days.each.reverse do |day|
			# daily savings is the difference between budget and total transactions
			daily_savings = day.budget - day.transactions_sum
			# push the daily savings into the array
			savings_array << daily_savings

		end
		render json: {"Day 1" => @savings_array[1], "Day 2" => @savings_array[2], "Day 3" => @savings_array[3]}

	end
end



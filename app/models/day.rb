class Day < ActiveRecord::Base
	belongs_to :user

	def self.create_new_days

		#find all users and for each one:
		User.all.each do |u|
		#  create new key value pairs for that day for that user
			@day = Day.new({
				budget: u.calculate_daily_budget,
				transactions_sum: u.yesterday_transaction_sum.to_i
				})

			if @day.save
				@user.day << @day
			end
		end
	end
end

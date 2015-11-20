class Day < ActiveRecord::Base
	belongs_to :user

	def self.create_new_days

		#find all users and for each one:
		User.all.each do |u|
		#  create new key value pairs for that day for that user
			@day = Day.new({
				budget: u.calculate_daily_budget,
				transaction_sum: u.yesterday_transactions_sum.to_i
				})
			@day.save
		end
	end
end

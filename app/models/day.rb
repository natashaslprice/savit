class Day < ActiveRecord::Base
	belongs_to :user

	def self.create_new_days

		#find all users and for each one:
		User.all.each do |user|
		#  create new key value pairs for that day for that user
			@day = Day.new({
				budget: user.calculate_daily_budget,
				transactions_sum: user.yesterday_transaction_sum.to_i
				})

			if @day.save
				user.days << @day
			end
		end
	end
end

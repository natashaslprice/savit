class Day < ActiveRecord::Base
	belongs_to :user

	def self.create_new_days
		User.all.each do |u|
			# make new day
			 u.days.last
			@day = Day.new({
				budget: u.calculate_daily_budget,
				transactions_sum: u.daily_transactions_sum
				})
			@day.save
		end
	end
end

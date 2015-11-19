class User < ActiveRecord::Base

	# user has one budget
	has_one :budget, dependent: :destroy
	# user has many transactions
	has_many :transactions, dependent: :destroy

	BCrypt::Engine.cost = 12
	validates :email, presence: true, uniqueness: true
	validates :password_digest, presence: true
	validates_confirmation_of :password

	def password
		@password
	end

	def password=(unencrypted_password)
		@password = unencrypted_password
		self.password_digest = BCrypt::Password.create(@password)
	end

	def authenticate(unencrypted_password)
		secure_password = BCrypt::Password.new(self.password_digest)

		if secure_password == unencrypted_password
			self
		else
			#password incorrect return false
			false
		end
	end

	def self.confirm(email_param, password_param)
		#look up user by the email that was passed into this method
		user = User.find_by_email(email_param)
		# check that user's password matches the stored password_digest
		user.authenticate(password_param)
	end

	# calculate net budget
	def calculate_net_budget
		fixed_expenses = budget.rent_mortgage + budget.car + budget.public_transportation + budget.insurance + budget.utilities + budget.internet + budget.cell_phone + budget.gym + budget.charity_donations + budget.student_loan + budget.credit_card + budget.other_expenses
		return budget.net_wages - fixed_expenses
	end

	# calculate monthly savings based on net budget
	def calculate_monthly_savings_goal
		return (calculate_net_budget * 0.1).round
	end

	def calculate_daily_budget  
	    # get net budget
	    net_budget = calculate_net_budget	    
	    # flexible spending less 10% savings
	    flexible_spending = net_budget - calculate_monthly_savings_goal 
	    # return daily budget
	    return (flexible_spending / 30) - daily_transactions_sum
	end
# finds today's transactions as an array
	def daily_transactions
		# get the time now
		# time_now = Time.new
		daily_trans = []
		#convert this to the day of the year
		day = Time.current.in_time_zone.yday
		transactions.each do |t|
			if day == t.created_at.yday
				daily_trans << t
			end
		end
		return daily_trans
	end
# this sums up the transactions for the day
	def daily_transactions_sum
		# sums values of array
		# create empty array
		array = []
		#convert this to the day of the year
		day = Time.current.in_time_zone.yday
		# iterate over transactions
		transactions.each do |t|
			# push amounts into array if they are from today
			if day == t.created_at.yday
				array << t.amount 
			end	
		end
		sum = array.sum	
		return sum
	end

	def total_savings
		# get daily budget, before removing 10% savings
		daily_budget = calculate_net_budget / 30
		# find number of days user has been active
		user_created_at = created_at.yday
		time_now = Time.now.yday
		total_user_days = (time_now - user_created_at) + 1
		# find total budget for user since inception
		total_budget = daily_budget * total_user_days
		# find all transactions for that user since inception
		all_transactions = transactions.all
		# find sum of all transaction amounts
		all_transactions_array = []
		all_transactions.each do |t|
			all_transactions_array << t.amount
		end
		total_transactions = all_transactions_array.sum
		# find total savings
		return total_budget - total_transactions 
	end







end

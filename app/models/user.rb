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
		# find today as day of year
		time_now = Time.now.yday
		# find day user created as day of year
		user_created_at = created_at.yday
		# find total number of days user has been active
		total_user_days = (time_now - user_created_at) + 1
		# find calculate_monthly_savings_goal 
		daily_savings_goal = calculate_monthly_savings_goal / 30
		# find total of monthly savings goal (total number of days user has been active * calculate_monthly_savings_goal)
		total_savings_goal = total_user_days * daily_savings_goal
		# find daily budget
		daily_budget = calculate_net_budget / 30
		# find total budget (daily_budget * total number of days user active minus 1)
		total_budget = daily_budget * (total_user_days - 1)
		# find all transactions
		all_transactions = transactions.all
		# iterate through transactions
		all_transactions_array = []
		all_transactions.each do |t|
			# if transaction.created_at is less than today as day of year
			if t.created_at.yday < time_now
				# push into array
				all_transactions_array << t.amount
			end
		end
		# find sum of array
		total_transactions = all_transactions_array.sum
		# total of monthly_savings_goal plus total budget minus sum of transactions array
		return total_savings_goal + total_budget - total_transactions
	end







end

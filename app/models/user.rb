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
	    return flexible_spending / 30
	end


end

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
	    user = current_user
	    fixed_expenses = user.budget.rent_mortgage + user.budget.car + user.budget.public_transportation + user.budget.insurance + user.budget.utilities + user.budget.internet + user.budget.cell_phone + user.budget.gym + user.budget.charity_donations + user.budget.student_loan + user.budget.credit_card + user.budget.other_expenses
	    net_budget = user.budget.net_wages - fixed_expenses
	  end

	# calculate monthly savings based on net budget
	  def calculate_monthly_savings_goal
	    user = current_user
	    @standard_savings = (calculate_net_budget * 0.1).round
	  end
	  def daily_budget_calculation
	    # find current user
	    user = current_user
	    # net wages
	    net_wages = user.budget.net_wages
	    # find users budget
	    fixed_expenses = user.budget.rent_mortgage + user.budget.car + user.budget.public_transportation + user.budget.insurance + user.budget.utilities + user.budget.internet + user.budget.cell_phone + user.budget.gym + user.budget.charity_donations + user.budget.student_loan + user.budget.credit_card + user.budget.other_expenses
	    # flexible spending less 10% savings
	    flexible_spending = (net_wages - fixed_expenses) * 0.9
	    # find daily budget
	    @daily_budget = flexible_spending / 30
	  end

	  # def daily_spending
	  #   # find current user
	  #   user = current_user
	  #   # find users transactions
	  #   transactions = user.transactions
	  # end
	  # def daily_savings
	  #   user = current_user
	  #   user.transactions.amount
	  #   day1_transactions = 
	  # end

end

class UsersController < ApplicationController

  def index
	end
	
	def new
		 @user = User.new
	end

	def create
		 @user = User.new(user_params)
     #upon success, save user
    if @user.save
      #set session
      session[:user_id] = @user.id
      #redirect to first page of new budget and flash message that sign-up successful
      redirect_to new_budget_path , flash: { success: "Successfully signed up!" }
    else
      # show errors
      @users_error = flash[:error] = @user.errors.full_messages.join(', ')
      #if not saved return to new post form
      render :new

    end
	end

	def show
    @budget = Budget.find_by(user_id: current_user.id)
	end

	def edit
    @user = User.find(params[:id])
  end

  def update
    # find user
    user = User.find(params[:id])
    # update user attributes with new form data
    user.update_attributes(user_params)
    redirect_to user
  end

  def destroy
  end

  def savings
    @user = current_user
    @budget = Budget.find_by(user_id: current_user.id)
    @savings = calculate_monthly_savings_goal.to_i

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

  def daily_savings
    user = current_user
    user.transactions.amount
    day1_transactions = 
  end



	private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
end

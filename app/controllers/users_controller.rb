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
    #define budget for nav bar rendering
    @budget = Budget.find_by(user_id: current_user.id)
     # find user
    @user = current_user
    # find daily budget
    @daily_budget = @user.calculate_daily_budget.to_i
    # give show page a transaction 
    @transaction = Transaction.new
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
    # find user
    @user = current_user
    # find budget for navbar
    @budget = Budget.find_by(user_id: current_user.id)
    # find users savings
    # @savings = @user.calculate_monthly_savings_goal.to_i
    # find users transactions
    transactions = @user.transactions
    #  find last time savings viewed and updated
    if @budget.savings_update == nil
      last_as_time = @budget.created_at
      last_as_day = @budget.created_at.yday
    else
      last_as_time = @budget.savings_update 
      last_as_day = @budget.savings_update.yday
    end
    # find time now
    now = Time.now.yday
    # number of days is difference between now and last 
    number_of_days = now - last_as_day
    # find total daily budget based on number of days
    income_to_add = ((@user.calculate_net_budget - @user.calculate_monthly_savings_goal) / 30) * number_of_days
    #  find daily spending to subtract based on number of days
    transactions_array = []
    transactions.each do |t|
      if t.created_at > last_as_time  
        transactions_array << t.amount
      end
      @spending_to_subtract = transactions_array.sum 
    end
    # find users savings
    @savings = @user.calculate_monthly_savings_goal.to_i + income_to_add.to_i - @spending_to_subtract.to_i
  end

	private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
end

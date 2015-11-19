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
   # find current user's budget
   @budget = Budget.find_by(user_id: current_user.id)
   # find user
   @user = current_user
   # find daily budget
   @daily_budget = daily_budget_calculation.to_i
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
    @user = current_user
    @budget = Budget.find_by(user_id: current_user.id)
    @savings = calculate_monthly_savings_goal.to_i

  end





	private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
end

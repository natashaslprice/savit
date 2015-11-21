class UsersController < ApplicationController

  def index
    if current_user
      redirect_to "/today"
    end
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

	def edit
    @user = User.find(params[:id])
    @budget = Budget.find_by(user_id: current_user.id)
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

  def show
    # find user
    @user = current_user
    # find budget for navbar
    @budget = Budget.find_by(user_id: current_user.id)
    # find users transaction
    @transactions = @user.transactions

    # Required for table on dashboard
    if params[:category]
      @category = params[:category].capitalize
      # change category trans variable so groups by date
      @category_transactions = @user.transactions.where(category: @category).order(:created_at).reverse_order
      @category_transactions_by_month = @category_transactions.group_by { |x| get_month(x.created_at.beginning_of_month.month) }
      # output: hash with month(as word)=>array of transactions in reverse order
      
      # find names of last 6 months
      i = 0
      @month_array = []
      6.times do |i|
        @month_array << @category_transactions_by_month.keys[i]
        i += 1
      end

      # find sum of transaction amounts in each of last 6 months
      i = 0
      @sum_array = []
      6.times do |i|
        month_transactions = 0
        if @category_transactions_by_month.values[i] != nil
          @category_transactions_by_month.values[i].each do |t|
            month_transactions = month_transactions + t.amount
          end
        end
        @sum_array << month_transactions
        i += 1
      end

      array = []
      @month_array.zip(@sum_array).each do |month, sum|
        array << {"#{month}": "#{sum}"}
      end
      @hash_for_js = array.reduce &:merge

      puts "final"
      p @hash_for_js

      respond_to do |format|
        format.json { render :json => @hash_for_js.to_json }
      end
    end 
    # end of required 
 
    @day = Day.find_by(user_id: current_user.id)


    # find users savings
    # @savings = @user.calculate_monthly_savings_goal.to_i
    # find users transactions
    # transactions = @user.transactions
    #  find last time savings viewed and updated
    # if @budget.savings_update == nil
    #   last_as_time = @budget.created_at
    #   last_as_day = @budget.created_at.yday
    # else
    #   last_as_time = @budget.savings_update 
    #   last_as_day = @budget.savings_update.yday
    # end
    # find time now
    # now = Time.now.yday
    # number of days is difference between now and last 
    # number_of_days = (now - last_as_day) + 1
    # find total daily budget based on number of days
    # income_to_add = ((@user.calculate_net_budget - @user.calculate_monthly_savings_goal) / 30) * number_of_days
    #  find daily spending to subtract based on number of days
    # transactions_array = []
    # transactions.each do |t|
    #   if t.created_at > last_as_time  
    #     transactions_array << t.amount
    #   end
    #   @spending_to_subtract = transactions_array.sum 
    # end
    # find users monthly savings
    # @monthly_savings = @user.calculate_monthly_savings_goal.to_i 
    @total_savings = @user.total_savings
  end

  def get_month(m)
    Date::MONTHNAMES[m]
  end
	
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
end

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
    
    if params[:category]
      @category = params[:category].capitalize
      # change category trans variable so groups by date
      @category_transactions = @user.transactions.where(category: @category).order(:created_at).reverse_order
      @category_transactions_by_month = @category_transactions.group_by { |x| x.created_at.beginning_of_month }
      # output: hash with month=>array of transactions in reverse order
      # loop through cat trans and say if grouped by month is in last 6 months, sum by group month
      i = 0
      j = 0
      @data_for_js = {}
      @month
      6.times do |i, j|
        @monthly_sum = 0
        @month_array = @category_transactions_by_month.values[i]
        if @month_array != nil
          @month_array.each do |a|
            @monthly_sum = @monthly_sum + a.amount
          end
        end
        i += 1
      end
        # put key value pairs into hash
        @month = (Time.now.month).strftime("%B")
        (6.months.ago.to_date.month..Date.today.month).each do |m|
          @date_setup = "2015-" + (m.to_s) + "-10 19:04:07.345677"
          @month = @date_setup.strftime()
          puts @month
        end

      # hash.to_json


      # @total = @category_transactions.inject { |t, sum| sum += t.amount }      
      # data = {
      #   total: @total,
      #   by_month: @transactions_by_month
      # } 
      # data.to_json
      respond_to do |format|
        format.json { render :json => @category_transactions.to_json }
      end
      # render :show
    end
 
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


	private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
end

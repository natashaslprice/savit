class TransactionsController < ApplicationController
  def show
  end

  def new
    @transaction = Transaction.new
    #define budget for nav bar rendering
    @budget = Budget.find_by(user_id: current_user.id)
     # find user
    @user = current_user
    # find daily budget
    @daily_budget = @user.calculate_daily_budget.to_i
  end

  def create
    # find current user
    @user = current_user
    # create new transaction with amount only
    @transaction = Transaction.new(transaction_params) 
    # push category into transaction
    @transaction.category = params[:category]
    # if new transaction, save
    if @transaction.save
      #set transaction user_id to user id
      @user.transactions << @transaction
      # redirect to user profile
      redirect_to '/today'
    else
      # show errors
      @transaction_error = flash[:error] = @transaction.errors.full_messages.join(', ')
      # redirect to new budget form page
      redirect_to '/today'
    end
  end

  def edit
  end

  def udpate
  end

  def destroy
     # find current user
    @user = current_user
    # find post to delete
    transaction = Transaction.find(params[:id])
    # destroy post
    transaction.destroy
    redirect_to new_transaction_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :category)
  end
end

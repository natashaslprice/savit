class TransactionsController < ApplicationController
  def show
  end

  def new
    @transaction = Transaction.new
  end

  def create
    # find current user
    @user = current_user
    # create new transaction
    @transaction = Transaction.new(transaction_params)
    # if new transaction, save
    if @transaction.save
      #set transaction user_id to user id
      @user.transactions << @transaction
      # redirect to user profile
      redirect_to @user
    else
      # show errors
      @transaction_error = flash[:error] = @transaction.errors.full_messages.join(', ')
      # redirect to new budget form page
      redirect_to @user
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
    redirect_to @user
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :tag_list)
  end
end

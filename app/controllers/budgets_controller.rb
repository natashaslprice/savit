class BudgetsController < ApplicationController
  def new
    @budget = Budget.new
  end

  def create
    # find current_user
    @user = current_user
    @budget = Budget.new(budget_params)
    # if new budget made 
    # save budget
    if @budget.save
      #set budget user_id to user id
      @user.budget = @budget
      # redirect to user profile
      redirect_to @user
    else
      # show errors
      @budget_error = flash[:error] = @budget.errors.full_messages.join(', ')
      # redirect to new budget form page
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def budget_params
    params.require(:budget).permit(:net_wages, :rent_mortgage, :car, :public_transportation, :insurance, :utilities, :internet, :cell_phone, :gym, :charity_donations, :student_loan, :credit_card, :other_expenses, :other_string)
  end
end

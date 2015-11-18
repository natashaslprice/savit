class UsersController < ApplicationController
	def index
	end
	
	def new
		 @user = User.new
	end

	def create
		 @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, flash: { success: "Successfully signed up!" }
    else
      # show errors
      @users_error = flash[:error] = @user.errors.full_messages.join(', ')
      #if not saved return to new post form
      render :new
    end
	end

	def show
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

	private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
end

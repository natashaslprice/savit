class SessionsController < ApplicationController

	 def new
    if current_user
      redirect_to '/today'
    else
      render :new
    end
  end

  def create
    @user = User.find_by_email(user_params[:email])
  	# if User.confirm(params[:email], params[:password])
    if @user && @user.authenticate(user_params[:password])
  		#save the user's id into the session
  		session[:user_id] = @user.id
  		#redirect to the show page
  		redirect_to '/today'
  	else
  		# show errors
      @sessions_error = flash[:error] = "Username or password incorrect"
      render :new
  	end
  end


  def destroy
    #set session id to nil (meaning no user)
    session[:user_id] = nil
    #redirect back to index page after logout
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end

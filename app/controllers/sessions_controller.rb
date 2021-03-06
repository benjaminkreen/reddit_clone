class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User
            .find_by_credentials(params[:user][:emai], params[:user][:password])
    if @user
      session[:token] = @user.reset_token!
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid Email or Password"]
      redirect_to new_session_url
    end
  end

  def destroy
    current_user.reset_token!
    session[:token] = nil
    redirect_to new_session_url
  end
end

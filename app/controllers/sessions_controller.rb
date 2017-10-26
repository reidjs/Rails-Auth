class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:destroy]
  before_action :require_logged_out, only: [:new, :create]
  def new
    #log in
    # login_user!(params[:user][:user_name],
    #   params[:user][:password])
    render :new
  end

  def create
    #find user by credentials
    #with user,
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = "no user found"
      render :new
    else
      # User.reset_session_token!
      login!(user)
      redirect_to cats_url
    end
  end

  def destroy
    logout!
    redirect_to cats_url
  end
end

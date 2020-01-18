class UsersController < ApplicationController
  def signup
  end

  def mypage
  end

  def edit
  end


  def login
  end

  def login_post
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/mypage", success: "Logged in as #{@user.name}."
    else
      @error_message = "Incorrect username or password."
      @name = params[:name]
      @password = params[:password]
      render "users/login"
    end
  end

  def logout_post
    session[:user_id] = nil
    redirect_to "/login", success: "Logged out."
  end

end

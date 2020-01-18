class UsersController < ApplicationController

  before_action :authenticate_user, {except: [:login, :login_post, :signup, :signup_post]}
  before_action :forbid_login_user, {only: [:login, :login_post, :signup, :signup_post]}

  def mypage
    @url = Url.new
  end

  def edit
  end

  def edit_post
    if @current_user.authenticate(params[:old_password])
      auth_flag = true
    else
      auth_flag = false
      @error_message = "Incorrect old password."
    end
    @current_user.password = params[:new_password]
    if @current_user.valid? && auth_flag
      @current_user.save
      redirect_to "/settings", success: "Your password was successfully updated."
    else
      @new_password = params[:new_password]
      @old_password = params[:old_password]
      render "users/edit"
    end
  end

  def destroy
    if @current_user.admin
      redirect_to "/settings", success: "Admin account cannot be deleted."
    else
      @current_user.destroy
      redirect_to "/", success: "Your account was successfully deleted."
    end
  end

  def signup
    @user = User.new
  end

  def signup_post
    @user = User.new(name: params[:name],password: params[:password], admin: false)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/mypage", success: "Welcome! Your account was successfully created."
    else
      render "users/signup"
    end
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

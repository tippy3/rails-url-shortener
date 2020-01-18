class AdminController < ApplicationController

  before_action :admin_only

  def users
    @users = User.all
  end

  def user_show
    @user = User.find_by(id: params[:id])
    if @user==nil
      redirect_to "/admin/users", warning: "Incorrect id."
    end
  end

  def user_destroy
    @user = User.find_by(id: params[:id])
    if @user==nil
      redirect_to "/admin/users", warning: "Incorrect id."
    elsif @user.admin
      redirect_to "/admin/users", warning: "Admin account cannot be deleted."
    else
      @user.destroy
      redirect_to "/admin/users", success: "id:#{params[:id]} was successfully deleted."
    end
  end

  def urls
    @urls = Url.all
  end

  def admin_only
    if !@current_user.admin
      redirect_to "/404.html"
    end
  end

end

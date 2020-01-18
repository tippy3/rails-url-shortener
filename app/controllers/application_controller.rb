class ApplicationController < ActionController::Base

  add_flash_types :success, :info, :warning, :danger
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    else
      @current_user = nil
    end
  end

end

class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def privacy
  end
end

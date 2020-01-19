class UrlsController < ApplicationController

  before_action :authenticate_user, {except: [:show, :qr]}
  before_action :get_url_and_ensure_correct_user, {only: [:edit, :edit_post, :destroy]}

  def show
    @url = Url.find_by(short_url: params[:short_url])
    if @url
      @url.increment!(:click_count, 1) # access counter
      redirect_to @url.long_url, status: :moved_permanently # 301 redirect
    else
      redirect_to "/404.html"
    end
  end

  def qr
    @url = Url.find_by(short_url: params[:short_url])
    if @url
      render "urls/qr"
    else
      redirect_to "/404.html"
    end
  end

  def edit
    # @urlはbefore_actionで取得済み
  end

  def edit_post
    # @urlはbefore_actionで取得済み
    @url.long_url = params[:long_url]
    if @url.save
      redirect_to "/#{@url.short_url}/edit", success: "Successfully saved."
    else
      render "urls/edit"
    end
  end

  def new
    @url = Url.new
    render "urls/mypage"
  end

  def new_post
    @url = Url.new(user_id: @current_user.id ,long_url: params[:long_url], short_url: params[:short_url], click_count: 0)
    if @url.save
      redirect_to "/#{@url.short_url}/edit", success: "Successfully shortened."
    else
      render "urls/mypage"
    end
  end

  def destroy
    # @urlはbefore_actionで取得済み
    @url.destroy
    redirect_to "/mypage", success: "Successfully deleted."
  end

  def get_url_and_ensure_correct_user
    @url = Url.find_by(short_url: params[:short_url])
    if @url==nil
      redirect_to "/mypage", warning: "Incorrect URL"
    end
    if @url.user_id != @current_user.id && !@current_user.admin
      redirect_to "/mypage", warning: "Not authorized."
    end
  end

end

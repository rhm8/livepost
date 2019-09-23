class LivepostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @livepost = current_user.liveposts.build(livepost_params)
    if @livepost.save
      flash[:success] = '投稿完了しました。'
      redirect_to root_url
    else
      @liveposts = current_user.liveposts.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿できませんでした。'
      render 'toppages/index'
    end
  end

  def destroy
    @livepost.destroy
    flash[:success] = '削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def livepost_params
    params.require(:livepost).permit(:content)
  end
  
  def correct_user
    @livepost = current_user.liveposts.find_by(id: params[:id])
    unless @livepost
    redirect_to root_url
    end
  end
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end

class ToppagesController < ApplicationController
  def index
    if logged_in?
      @livepost = current_user.liveposts.build  # form_with 用
      @liveposts = current_user.liveposts.order(id: :desc).page(params[:page])
    end
  end
end

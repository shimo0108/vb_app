class MicropostsController < ApplicationController
  before_action :authenticate_user!
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    if user_signed_in?
      @micropost  = current_user.microposts.new
      @feed_items = current_user.feed.includes(:user).page(params[:page]).per(5)
    end
    
  end

  def create
    @micropost = current_user.microposts.create(micropost_params)
    if @micropost.save
      flash[:success] = "タイムラインを投稿しました。"
      redirect_to microposts_path
    else
      @feed_items = []
      render "user/index"
    end
  end

  def destroy
    @micropost.destroy
      flash[:success] = "削除が完了しました。"
      redirect_to request.referrer || microposts_path
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to "user/index" if @micropost.nil?
  end
end

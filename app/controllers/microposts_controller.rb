class MicropostsController < ApplicationController
  before_action :authenticate_user!, onry: [create, destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "タイムラインを投稿しました。"
      redirect_to root_url
    else
      render "user/index"
    end
  end

  def destroy
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end

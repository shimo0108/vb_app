# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index, :following, :followers]

  def index
    @users = User.all
    @player = current_user.player
    @players = Player.includes(user: [image_attachment: :blob]).first(3)
    @team = current_user.team
    @teams = Team.includes(user: [image_attachment: :blob]).first(3)
    @microposts = Micropost.includes(user: :image_attachment).page(params[:page]).per(10)
  end

  def update
    @user = User.find(params[:id])
    @user.update(image_params)  
    flash[:notice] = '編集が完了しました。'
    redirect_to user_path
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.page(params[:page]).per(5)
    return if @user == current_user
    common_room_ids = current_user.entries.pluck(:room_id) & @user.entries.pluck(:room_id)
    if common_room_ids.present?
      @roomId = Room.where(id: common_room_ids).first
    else
      @room = Room.new
      @entry = Entry.new
    end
  end

  def following
    @title = "フォローユーザー一覧"
    @user = User.find(params[:id])
    @users = @user.following.includes(:image_attachment).page(params[:page]).per(10)
    render "show_follow"
  end

  def followers
    @title = "フォロワーユーザー一覧"
    @user = User.find(params[:id])
    @users = @user.followers.includes(:image_attachment).page(params[:page]).per(10)
    render "show_follow"
  end

  private

  def image_params
    params.require(:user).permit(:image)
  end
end

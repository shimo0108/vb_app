# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]

  def index
    @users = User.all
    @player = current_user.player
    @players = Player.includes(user: [image_attachment: :blob]).first(3)
    @team = current_user.team
    @teams = Team.includes(user: [image_attachment: :blob]).first(3)
  end

  def update
    @user = User.find(params[:id])
    @user.update(image_params)
    redirect_to user_path
  end

  def show
    @user = User.find(params[:id])
    return if @user == current_user

    common_room_ids = current_user.entries.pluck(:room_id) & @user.entries.pluck(:room_id)
    if common_room_ids.present?
      @roomId = Room.where(id: common_room_ids).first
    else
      @room = Room.new
      @entry = Entry.new
    end
  end

  private

  def image_params
    params.require(:user).permit(:image)
  end
end

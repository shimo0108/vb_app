class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    return if @user == current_user
    common_room_ids = current_user.entries.pluck(:room_id) & @user.entries.pluck(:room_id)
    if common_room_ids.present?
      @rooms = Room.where(id: common_room_ids).first
    else
      @room = Room.new
      @entry = Entry.new
    end
  end
end

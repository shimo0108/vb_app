class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    currentUserEntry = current_user.entries.pluck(:room_id)
    userEntry = @user.entries.pluck(:room_id)
    common_room_ids = currentUserEntry & userEntry
    return if @user.id == current_user.id
    return if @roomId = common_room_ids.select.first
    @room = Room.new
    @entry = Entry.new
  end
end

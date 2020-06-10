class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    currentUserEntry = current_user.entries
    userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      currentUserEntry.each do |cu|
        userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end

# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]

  def index
    @users = User.all
    @player = current_user.player
    @players = Player.all.includes(:user)
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
end

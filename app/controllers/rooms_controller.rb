# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create!
    @entry1 = current_user.entries.create!(room_id: @room.id)
    @entry2 = Entry.create!(entries_params)
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find_by(id: params[:id])
    if current_user.entries.where(room_id: @room.id).present?
      @messages = @room.messages.includes(:user)
      @message = Message.new
      @entries = @room.entries.includes(:user)
    else
      flash[:alert] = 'エラーが発生しました。'
      render action: :index
    end
  end

  def index
    @current_user = current_user
    my_room_ids = current_user.entries.pluck(:room_id)
    @another_entries = Entry.includes(:room, :user).where(room_id: my_room_ids).where.not(user_id: current_user.id)
  end

  private

  def entries_params
    params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end

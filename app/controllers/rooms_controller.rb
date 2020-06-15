class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    if @room.save
      redirect_to room_path(@room.id)
    else
      flash[:alert] = "エラーが発生しました。ホーム画面に戻ります。"
      redirect_to root_path
    end
  end

  def show
    @room = Room.find_by(id: params[:id])
    if current_user.entries.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    my_room_ids = current_user.entries.pluck(:room_id)
    @another_entries = Entry.where(room_id: my_room_ids).where.not(user_id: current_user.id)
  end

  private

  def entries_params
    
  end
end

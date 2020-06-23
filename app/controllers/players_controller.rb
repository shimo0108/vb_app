class PlayersController < ApplicationController
  before_action :authenticate_user!
  def index
    @players = Player.all.includes(:user)
  end
  
  def new
    @player = current_user.build_player
    @positions = Position.all
  end
  
  def create
    @player = current_user.build_player(player_params)
      if @player.save
        positions_id = params[:positions]
          positions_id.each do |position_id|
            PlayerPosition.create(player_id: @player.id, position_id: position_id )
          end
        flash[:success] = "登録が完了しました。"
        redirect_to root_path
      else
        flash[:danger] = "登録できませんでした"
        render 'new'
      end
  end
  
  private
  
    def player_params 
      params.require(:player).permit(:gender, :prefecture, :comment, :available_day, position_id:[] )
    end
end
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
    @positions = Position.all
      ActiveRecord::Base.transaction do
        @player.save!
          positions_ids = params[:positions]
            positions_ids.each do |position_id|              
              PlayerPosition.create!(player_id: @player.id, position_id: position_id)            
            end
          flash[:success] = "登録が完了しました。"
          redirect_to root_path  
      rescue
        flash[:danger] = "必須項目を入力してください。"
        render :new
      end
  end

  def edit
     @player = Player.find_by(id: params[:id])
     @positions = Position.all
  end

  def update
     @player = Player.find_by(id: params[:id])
     @positions = Position.all
     select_positions = @player.PlayerPositions
      ActiveRecord::Base.transaction do
        @player.update!(player_params)
        select_positions.clear
          positions_ids = params[:positions]
            positions_ids.each do |position_id|              
              PlayerPosition.create!(player_id: @player.id, position_id: position_id)            
            end
          flash[:success] = "登録が完了しました。"
          redirect_to root_path  
      rescue
        flash[:danger] = "必須項目を入力してください。"
        render :new
      end
  end

  private
  
    def player_params 
      params.require(:player).permit(:gender, :prefecture, :comment, :available_day, position_id:[] )
    end

end
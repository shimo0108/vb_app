class PlayersController < ApplicationController
  before_action :authenticate_user!

  def index
    @positions = Position.all
    @search = Player.ransack(params[:q])
    @players = @search.result.includes(:user).page(params[:page]).per(10)
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
     select_positions = @player.player_positions
      ActiveRecord::Base.transaction do
        @player.update!(player_params)
        select_positions.destroy_all
          positions_ids = params[:positions]
            positions_ids.each do |position_id|              
              PlayerPosition.create!(player_id: @player.id, position_id: position_id)            
            end
          flash[:success] = "登録が完了しました。"
          redirect_to root_path  
      rescue
        flash[:danger] = "必須項目を入力してください。"
        render :edit
      end
  end

  def destroy
      @player = Player.find(params[:id])
      if @player.destroy
        flash[:success] = "削除が完了しました。"
        redirect_to root_path
      else 
        flash.now[:danger] = "削除が失敗しました。"
        render :index
      end
  end

  private
  
    def player_params 
      params.require(:player).permit(:gender, :prefecture, :comment, :available_day, position_id:[] )
    end

end
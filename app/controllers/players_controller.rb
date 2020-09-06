class PlayersController < ApplicationController
    before_action :authenticate_user!

    def index
        @players = Player.all
    end
  
    def new
      @player = current_user.build_player
    end
  
    def create
        @player = current_user.build_player(player_params)
      if @player.save
        flash[:success] = "登録が完了しました。"
        redirect_to @player
      
      else 
        render 'new'
      end
        
    end
    
    def show
        @player = Player.find(params[:id])
    end
    
    def edit
        @player = Player.find(params[:id])
    end
    
    def update
        @player = Player.find(params[:id])
        @player.update!(player_params)
        flash[:success] = "更新が完了しました。"
        redirect_to root_url
    end
  
   def destroy
        @player = Player.find(params[:id])
        @player.destroy
        redirect_to root_path
        flash[:success] = "削除が完了しました"
   end
  
  
  private
  
    
  
    def player_params 
      params.require(:player).permit(:gender,:prefecture,:schedule,:position,:content,:user_id)
    end
end

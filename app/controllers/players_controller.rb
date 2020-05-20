class PlayersController < ApplicationController


    def index
        @player = current_user.player
    end
  
    def new
      @player = Player.new
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
        @player = current_user.players.find(params[:id])
    end
    
    def update
        @player = current_user.players.find(params[:id])
        @player.update!(player_params)
        flash[:success] = "更新が完了しました。"
        redirect_to players_url
    end
  
   def destroy
        @player = current_user.players.find(params[:id])
        @player.destroy
        redirect_to players_url
        flash[:success] = "削除が完了しました。"
   end
  
  
  private
  
    
  
    def player_params 
      params.require(:player).permit(:gender,:prefecture,:schedule,:position,:content,:user_id)
    end
end

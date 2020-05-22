class TeamsController < ApplicationController
    def index
        @team = current_user.team
    end
  
    def new
      @team = Team.new
    end
  
    def create
        @team = current_user.build_team(team_params)
      
      if @team.save
        flash[:success] = "登録が完了しました。"
        redirect_to @team
      
      else 
        render 'new'
      end
        
    end
    
    def show
        @team = Team.find(params[:id])
    end
    
    def edit
        @team = current_user.teams.find(params[:id])
    end
    
    def update
        @team = current_user.teams.find(params[:id])
        @team.update!(team_params)
        flash[:success] = "更新が完了しました。"
        redirect_to teams_url
    end
  
   def destroy
        @team = current_user.teams.find(params[:id])
        @team.destroy
        redirect_to teams_url
        flash[:success] = "削除が完了しました。"
   end
  
  
  private
  
    
  
    def team_params 
      params.require(:team).permit(:teamcomment,:team_name,:teamprefecture,:recruitment_position,:practice_schedule,:user_id)
    end
end

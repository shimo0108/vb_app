class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @positions = Position.all
    @search = Team.ransack(params[:q])
    @teams = @search.result.includes(user: :image_attachment).page(params[:page]).per(5)
  end

  def new
    @team = current_user.build_team
    @positions = Position.all
  end
  
  def create
    @team = current_user.build_team(team_params)
    @positions = Position.all
      ActiveRecord::Base.transaction do
        @team.save!
          positions_ids = params[:positions]
            positions_ids.each do |position_id|              
              TeamPosition.create!(team_id: @team.id, position_id: position_id)      
            end
          flash[:success] = "登録が完了しました。"
          redirect_to root_path
      rescue
        flash[:danger] = "必須項目を入力してください。"
        render :new
      end
  end

  def edit
     @team = Team.find_by(id: params[:id])
     @positions = Position.all
  end

  def update
     @team = Team.find_by(id: params[:id])
     @positions = Position.all
     select_positions = @team.team_positions
      ActiveRecord::Base.transaction do
        @team.update!(team_params)
        select_positions.destroy_all
          positions_ids = params[:positions]
            positions_ids.each do |position_id|              
              TeamPosition.create!(team_id: @team.id, position_id: position_id)            
            end
          flash[:success] = "登録が完了しました。"
          redirect_to root_path  
      rescue
        flash[:danger] = "必須項目を入力してください。"
        render :edit
      end
  end

  def destroy
      @team = Team.find(params[:id])
      if @team.destroy
        flash[:success] = "削除が完了しました。"
        redirect_to root_path
      else 
        flash.now[:danger] = "削除が失敗しました。"
        render :index
      end
  end

  private
  
    def team_params 
      params.require(:team).permit(:name, :gender, :prefecture, :comment, :available_day, position_id:[] )
    end

end

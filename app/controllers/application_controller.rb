class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    


 
    def after_sign_in_path_for(resource)
        if current_user
          flash[:notice] = "ログインに成功しました" 
          root_url 
        else
          flash[:notice] = "新規登録完了しました。次にプロフィールを作成してください。" 
          new_player_path
        end
    end
    
    
    def after_sign_out_path_for(resource)
        new_user_session_path 
    end

    private

    
    
end

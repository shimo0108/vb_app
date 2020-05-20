<<<<<<< HEAD
class OmniauthCallbacksController <  Devise::OmniauthCallbacksController
    def twitter
        @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
    
        if @user.persisted?
            sign_in_and_redirect @User
        else 
            session["devise.user_attributes"] = @user.attributes 
            redirect_to new_user_registration_url
=======
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def twitter
        @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
        if @user.persisted?
            sign_in_and_redirect @user
        else
            @user.save!
            # session["devise.user_attributes"] = @user.attributes
            # ↑ 認証データを覚える必要はないので削除
            # redirect_to new_user_registration_url
            # ↑ ログインすることになるので以下のように修正
            sign_in_and_redirect @user
>>>>>>> playerClass
        end
    end
end

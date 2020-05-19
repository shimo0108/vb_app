# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
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
    end
  end
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end

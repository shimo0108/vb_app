class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
      if @user.persisted?
          sign_in_and_redirect @user
      else
          session["devise.user_attributes"] = @user.attributes
          redirect_to new_user_registration_url
      end
    end
end

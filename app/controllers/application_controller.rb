# frozen_string_literal: true

class ApplicationController < ActionController::Base

   protect_from_forgery

  def after_sign_out_path_for resource
    root_path
  end 

  def after_sign_in_path_for(resource) 
    users_path
  end

  private

  
  
  def logged_in_user
    unless current_user
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to root_path
    end
  end
end

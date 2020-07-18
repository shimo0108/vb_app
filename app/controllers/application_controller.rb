# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def logged_in_user
    unless current_user
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to root_path
    end
  end
end

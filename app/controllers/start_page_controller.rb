class StartPageController < ApplicationController
  skip_before_action :authenticate_user!
  def home
  end

  def show
  end

end

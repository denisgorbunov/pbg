class HomeController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      render 'home/index'
    else
      login_page
    end
  end

  private
  def login_page
    render 'home/login'
  end
end

class HomeController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      redirect_to controller: :requests, action: :index
    else
      login_page
    end
  end

  private
  def login_page
    render 'home/login'
  end
end

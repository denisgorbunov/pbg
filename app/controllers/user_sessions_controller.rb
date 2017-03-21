class UserSessionsController < ApplicationController

  before_action :set_user, only: [:create]
  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user
      redirect_back_or_to root_url, :success => "Добро пожаловать, #{current_user.name}!"
    else
      redirect_back_or_to root_url, :error => 'Ошибка авторизации!'
    end
  end

  def destroy
    logout
    redirect_to root_url, :alert => 'Сессия завершена!'
  end

  private
  def set_user
    @user = login(params[:email], params[:password], params[:remember_me])
  end

  def session_params
    params.require(:user).permit(:email, :password)
  end

end

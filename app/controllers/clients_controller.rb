class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update, :destroy]
  before_action :set_clients, only: [:index, :edit]
  before_action :require_login

  def index

  end

  def new
    @client = Client.new
  end

  def create
    @client = current_user.clients.create(client_params)
    if @client.valid?
      flash[:success]='Клиент успешно сохранен!'
      redirect_to clients_path
    else
      flash[:error]='Ошибка при сохранении!'
      render 'new'
    end
  end

  def edit

  end

  def update
    @client.update_attributes(client_params)
    if @client.valid?
      flash[:success]='Клиент успешно изменен!'
      redirect_to clients_path
    else
      flash[:error]='Ошибка при сохранении!'
      render 'edit'
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  protected

  def set_client
    @client = Client.find(params[:id])
  end

  def set_clients
    if current_user.has_role? :agent
      @clients = current_user.clients
    elsif current_user.has_role? :partner
      @clients = Client.all
    end
  end

  def client_params
    params.require(:client).permit(:name, :inn, :kpp)
  end


end

class ClientsController < ApplicationController
  before_action :find_client, only: [:edit, :update, :destroy]
  before_action :require_login

  def index
    @clients = current_user.clients
  end

  def new
    @client = Client.new
  end

  def create
    @client = current_user.clients.create(client_params)
    if @client.valid?
      redirect_to clients_path, :success => 'Клиент успешно сохранен!'
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @client.update_attributes(client_params)
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  protected

  def find_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :inn, :kpp)
  end


end

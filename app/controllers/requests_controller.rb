class RequestsController < ApplicationController
  before_action :find_request, only: [:edit, :update, :destroy]
  before_action :require_login

  def index
    @requests = current_user.requests
  end

  def new
    @request = Request.new
    @clients = current_user.clients
  end

  def create
    @request = current_user.requests.create(request_params)
    if @request.valid?
      redirect_to requests_path, :success => 'Заявка создана успешно!'
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @request.update_attributes(request_params)
  end

  def destroy
    @request.destroy
    redirect_to requests_path
  end

  protected

  def find_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:client_id)
  end


end

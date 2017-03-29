class RequestsController < ApplicationController
  before_action :set_request, only: [:edit, :update, :destroy]
  before_action :set_requests, :set_clients, only: [:index, :create]
  before_action :require_login

  def index
  end

  def new
    @request = Request.new
    if current_user.has_role? :agent
      @clients = current_user.clients
    elsif current_user.has_role? :partner
      @clients = Client.all
    end
  end

  def create
    @request = current_user.requests.create(request_params)
    if @request.valid?
      flash[:success]='Заявка создана'
      redirect_to requests_path
    else
      flash[:error]='Ошибка при сохранении!'
      render 'new'
    end
  end

  def edit
    if current_user.has_role? :agent
      @clients = current_user.clients
    elsif current_user.has_role? :partner
      @clients = Client.all
    end
  end

  def update
    @request.update_attributes(request_params)
    if @request.valid?
      flash[:success]='Заявка сохранена'
      redirect_to requests_path
    else
      flash[:error]='Ошибка при сохранении!'
      render 'edit'
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_path
  end

  protected

  def set_request
    @request = Request.find(params[:id])
  end

  def set_requests
    if current_user.has_role? :agent
      @requests = current_user.requests
    elsif current_user.has_role? :partner
      @requests = Request.all
    end
  end

  def set_clients
    if current_user.has_role? :agent
      @clients = current_user.clients
    elsif current_user.has_role? :partner
      @clients = Client.all
    end
  end

  def request_params
    params.require(:request).permit(:client_id, :template, :bg_type, :issue, :bg_summ, :summ_currency, :immediately,
                                    :date_end, :prepayment, :comment, :file_application, :file_passports, :file_project,
                                    :file_consent, :file_balans)
  end


end

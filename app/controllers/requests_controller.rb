class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :zip]
  before_action :set_requests, :set_clients, only: [:index, :create]
  before_action :require_login

  def index
  end

  def show
  end

  def new
    @request = Request.new
    @request.build_client
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

  def zip
    require 'rubygems'
    require 'zip'
    require 'pathname'

    Zip.setup do |c|
      c.on_exists_proc = true
      c.continue_on_exists_proc = true
      c.unicode_names = true
      c.default_compression = Zlib::BEST_COMPRESSION
    end

    files = [@request.file_application.current_path, @request.file_passports.current_path, @request.file_project.current_path, @request.file_consent.current_path]
    zipfile_name = "#{Rails.root}/public/uploads/request/#{@request.id}/#{@request.id}.zip"

    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      files.each {
          |file_to_be_zipped|

        filename = File.basename(file_to_be_zipped)

        if filename == @request.file_application_identifier
          filename = "Заявление на предоставление БГ.#{File.extname(filename)}"
        elsif filename == @request.file_passports_identifier
          filename = "Паспорта.#{File.extname(filename)}"
        elsif filename == @request.file_project_identifier
          filename = "Проект контракта.#{File.extname(filename)}"
        elsif filename == @request.file_consent_identifier
          filename = "Согласия на запрос и предоставление информации.#{File.extname(filename)}"
        end

        puts "zipper: archiving #{file_to_be_zipped} as #{filename} into #{zipfile}"

        zipfile.add(filename, file_to_be_zipped)
      }
    end

    File.open(zipfile_name, 'r') do |f|
      send_data f.read,
                :filename => "#{@request.id} - #{Client.find(@request.client_id).name}.zip",
                :type => 'application/zip',
                :disposition => 'attachment',
                :streaming => 'true',
                :buffer_size => '4096'
    end
    File.delete(zipfile_name)
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
                                    :file_consent, :file_balans, :date_start, :client_attributes => [:id, :user_id, :name, :inn, :kpp])
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login, :except => 'index'

  protected
  def not_authenticated
    redirect_to root_url, :notice => 'Сначала авторизуйтесь.'
  end

  def page_not_found
    respond_to do |format|
      format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end
end

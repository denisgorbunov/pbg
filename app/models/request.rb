class Request < ApplicationRecord
  resourcify
  mount_uploader :file_application, RequestUploader
  mount_uploader :file_passports, RequestUploader
  mount_uploader :file_project, RequestUploader
  mount_uploader :file_consent, RequestUploader
  mount_uploader :file_balans, RequestUploader
  belongs_to  :user
  belongs_to  :client

  before_create :set_status
  validates :client_id, presence: { message: "Обязательно укажите клиента" }

  protected

  def set_status
    self.status = "2" if self.status.blank?
  end

end

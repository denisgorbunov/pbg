class Request < ApplicationRecord
  resourcify
  mount_uploader :file_application, RequestUploader
  mount_uploader :file_passports, RequestUploader
  mount_uploader :file_project, RequestUploader
  mount_uploader :file_consent, RequestUploader
  mount_uploader :file_balans, RequestUploader
  belongs_to :user
  belongs_to :client, inverse_of: :requests
  accepts_nested_attributes_for :client, reject_if: :all_blank

  before_create :set_status
  #validates :client_id, presence: { message: "Обязательно укажите клиента" }
  validates :date_end, :date_start, presence: {message: "Укажите дату"}
  validates :bg_type, presence: {message: "Укажите тип БГ"}
  validates :issue, presence: {message: "Укажите номер извещения"}, if: :bg_type?
  validates :bg_summ, presence: {message: "Укажите сумму"}
  #before_validation :check_client_fields

  protected

  def set_status
    self.status = "2" if self.status.blank?
  end

  def check_client_fields
    if self.client_id.blank?
      self.client_id=self.client.id
    end
  end

end

class Request < ApplicationRecord
  resourcify
  belongs_to  :user
  belongs_to  :client

  before_create :set_status
  validates :client_id, presence: true

  protected

  def set_status
    self.status = "2"
  end

end

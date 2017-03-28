class Request < ApplicationRecord
  resourcify
  belongs_to  :user
  belongs_to  :client

  validates :client_id, presence: true
end

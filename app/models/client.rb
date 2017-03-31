class Client < ApplicationRecord
  resourcify
  belongs_to  :user
  has_many    :requests
end

class Client < ApplicationRecord
  resourcify
  has_many    :requests
  belongs_to  :user

end

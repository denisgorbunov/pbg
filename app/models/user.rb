class User < ApplicationRecord
  rolify
  authenticates_with_sorcery!
  has_many :requests
  has_many :clients
  validates :email, presence: true,
                    format: { :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:agent) if self.roles.blank?
  end
end

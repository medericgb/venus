module Accounts
  module Entities
    class User < ApplicationRecord
      self.table_name = "accounts"
      has_secure_password
      has_secure_password :recovery_password, validations: false

      validates :username, presence: true, uniqueness: true
      validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
      validates :password, presence: true

      has_many :comments, class_name: "Comments::Entities::Comment"
    end
  end
end
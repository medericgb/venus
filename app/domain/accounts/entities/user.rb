module Accounts
  module Entities
    class User < ApplicationRecord
      self.table_name = "accounts"
      has_secure_password
      has_secure_password :recovery_password, validations: false

      validates :username, presence: true, uniqueness: true
      validates :email, presence: true, uniqueness: true
      validates :password, presence: true
    end
  end
end
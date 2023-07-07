module Accounts
  module Entities
    class Account < ApplicationRecord
      self.table_name = "accounts"
      has_secure_password
      has_secure_password :recovery_password, validations: false

      ROLES = %w(admin intervenant client).freeze

      has_many :tickets
      has_many :comments
      has_many :notifications

      validates :username, presence: true
      validates :email, presence: true
      validates :role, presence: true,  inclusion: { in: ROLES }
    end
  end
end 
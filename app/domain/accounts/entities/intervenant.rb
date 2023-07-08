module Accounts
  module Entities
    class Intervenant < User
      has_many :tickets
      has_many :comments, as: :commentable
      has_many :notifications
    end
  end
end
module Notifications
  module Entities
    class Notification < ApplicationRecord
      self.table_name = "notifications"

      belongs_to :ticket, class_name: "Tickets::Entities::Ticket"
      belongs_to :user, class_name: "Accounts::Entities::User"

      validates :content, presence: true
    end
  end
end
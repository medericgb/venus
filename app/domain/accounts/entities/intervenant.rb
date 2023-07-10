module Accounts
  module Entities
    class Intervenant < User
      has_many :comments, class_name: "Comments::Entities::Comment"
      has_many :tickets, class_name: "Tickets::Entities::Ticket"
      has_many :notifications, class_name: "Notifications::Entities::Notification"
    end
  end
end
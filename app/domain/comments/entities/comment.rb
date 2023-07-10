module Comments
  module Entities
    class Comment < ApplicationRecord
      self.table_name = "comments"

      belongs_to :ticket, class_name: "Tickets::Entities::Ticket"
      belongs_to :user, class_name: "Accounts::Entities::User"

      validates :content, presence: true
    end
  end
end
module Comments
  module Entities
    class Comment < ApplicationRecord
      self.table_name = "comments"
      belongs_to :account, class_name: "Accounts::Entities::User"
      belongs_to :ticket, class_name: "Tickets::Entities::Ticket"

      validates :content, presence: true
    end
  end
end
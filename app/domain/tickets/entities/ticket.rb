module Tickets
  module Entities
    class Ticket < ApplicationRecord
      self.table_name = "tickets"

      belongs_to :client, class_name: "Accounts::Entities::Client"
      belongs_to :intervenant, class_name: "Accounts::Entities::Intervenant"
      has_many :comments, class_name= "Comments::Entities::Comment"

      validates :title, presence: true
      validates :description, presence: true
    end
  end
end
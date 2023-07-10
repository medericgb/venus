module Tickets
  module Entities
    class Ticket < ApplicationRecord
      self.table_name = "tickets"

      enum state: { open: "open", closed: "closed" }

      belongs_to :client
      belongs_to :intervenant
      has_many :comments
    end
  end
end
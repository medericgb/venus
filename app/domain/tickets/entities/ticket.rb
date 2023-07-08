module Tickets
  module Entities
    class Ticket < ApplicationRecord
      belongs_to :client
      belongs_to :intervenant
      has_many :comments
    end
  end
end
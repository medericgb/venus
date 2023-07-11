module Tickets
  module Repositories
    class Ticket
      def create_ticket(ticket_params:)
        entity.create(ticket_params)
      end

      def close_ticket(ticket_id:)
        entity.find(ticket_id).update(state: "closed")
      end

      def self.find_by_id(ticket_id)
        Ticket.find_by(id: ticket_id)
      end
    
      def self.save(ticket)
        ticket.save
      end

      private 
      def entity
        Tickets::Entities::Ticket
      end
    end
  end
end

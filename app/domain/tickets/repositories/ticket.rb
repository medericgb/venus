module Tickets
  module Repositories
    class Ticket

      def get_by_id(ticket_id:)
        entity.find(ticket_id)
      end

      def create_ticket(ticket_params:)
        entity.create(ticket_params)
      end

      def close_ticket(ticket_id:)
        entity.find(ticket_id).update(state: "closed")
      end

      def find_by_id(ticket_id:)
        entity.find(ticket_id)
      end
    
      def save(ticket)
        ticket.save
      end

      private 
      def entity
        Tickets::Entities::Ticket
      end
    end
  end
end

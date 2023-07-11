module Tickets
  module Operations
    class CloseTicket
      include Interactor
    
      def call
        context.ticket = repo.close_ticket(ticket_id: context.ticket_id)
      rescue => e
        context.fail!(errors: "create_ticket_error: #{e.message}")
      end

      private
      def repo
        Tickets::Repositories::Ticket.new
      end
    end
  end
end
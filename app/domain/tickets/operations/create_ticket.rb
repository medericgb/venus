module Tickets
  module Operations
    class CreateTicket
      include Interactor
    
      def call
        raise context.ticket_params.inspect
        context.ticket = repo.create_ticket(ticket_params: context.ticket_params)
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
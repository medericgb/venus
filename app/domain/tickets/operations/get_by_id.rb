module Tickets
  module Operations
    class GetById
      include Interactor
    
      def call
        context.ticket = repo.get_by_id(ticket_id: context.ticket_id)
      rescue => e
        context.fail!(errors: "get_ticket_by_id_error: #{e.message}")
      end

      private
      def repo
        Tickets::Repositories::Ticket.new
      end
    end
  end
end
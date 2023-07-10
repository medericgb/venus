module Tickets
  module Interactors
    module Ticket
      class CreateTicket
        include Interactor
      
        def call
          context.ticket = repo.create_ticket(context.client_params)
        rescue => e
          context.fail!(errors: "create_ticket_error: #{e.message}")
        end

        private
        def repo
          Tickets::Repositories::TicketRepository.new
        end
      end
    end
  end
end
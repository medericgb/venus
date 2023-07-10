module Tickets
  module Repositories
    class TicketRepository
      def create_ticket(client_params)
        client.ticket.create(client_params)
      end

      def close_ticket(ticket)
        if admin? && ticket.open?
          ticket.update(status: :closed)
          redirect_to @ticket, notice: "Ticket closed successfully."
        else
          redirect_to @ticket, alert: "You don't have permission to close this ticket."
        end
      end

      def self.find_intervenant_with_least_tickets
        where(role: "intervenant")
          .left_joins(:tickets)
          .group(:id)
          .order('COUNT(tickets.id)')
          .first
      end

      private 
      def admin
        Accounts::Entities::Admin
      end
      def client
        Accounts::Entities::Client
      end
      def ticket
        Tickets::Entities::Ticket
      end
    end
  end
end

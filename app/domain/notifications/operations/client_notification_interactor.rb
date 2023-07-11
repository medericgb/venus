module Notifications
  module Operations
    class ClientNotification
      include Interactor

      def call
        ticket = TicketRepository.find_by_id(context.ticket_id)
        client = ticket.client
        NotificationService.send_notification(client.inbox_file, "Réponse de l'intervenant pour le ticket ##{ticket.id}: #{context.message}")
      end

      private
      def repo
        Tickets::Repositories::Ticket.new
      end
    end
  end
end


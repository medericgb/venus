module Notifications
  module Operations
    class NotifyIntervenantReply
      include Interactor

      def call
        ticket = repo.find_by_id(context.ticket_id)
        intervenants = User.where(role: 'intervenant')
        intervenants.each do |intervenant|
          NotificationService.send_notification(intervenant.inbox_file, "Réponse du client pour le ticket ##{ticket.id}: #{context.message}")
        end
      end

      private
        def repo
          Tickets::Repositories::Ticket.new
        end
    end
  end
end

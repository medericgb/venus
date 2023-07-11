module Notifications
  module Operations
    class NotifyIntervenant
      include Interactor

      def call
        ticket = repo.find_by_id(context.ticket_id)
        intervenants = User.where(role: 'intervenant')
        intervenants.each do |intervenant|
          NotificationService.send_notification(intervenant.inbox_file, "Nouveau ticket assigné : ##{ticket.id}")
        end
      end

      private
        def repo
          Tickets::Repositories::Ticket.new
        end
    end
  end
end

# app/interactors/notify_intervenant.rb
class NotifyIntervenant
  include Interactor

  
end



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
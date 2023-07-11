module Accounts
  module Repositories
    class IntervenantRepository
      def create_account(intervenant_params:)
        entity.create(intervenant_params)
      end

      def get_intervenant_with_less_tickets
        intervenant_with_less_active_tickets
      end

      private 
      def entity
        Accounts::Entities::Intervenant
      end

      def intervenant_with_less_active_tickets
        minimum_numbers_of_tickets = entity.all.map { |intervenant| intervenant.tickets.count }.min
        intervenants_with_less_tickets = entity.all.select { |intervenant| intervenant.tickets.count == minimum_numbers_of_tickets }
        intervenants_with_less_tickets.sample
      end
    end
  end
end
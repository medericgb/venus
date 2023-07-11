module Accounts
  module Operations
    module Intervenant
      class GetIntervenantWithLessTickets
        include Interactor

        def call
          context.intervenant = repo.get_intervenant_with_less_tickets
        rescue => e
          context.fail!(errors: "get_intervenant_with_less_tickets_error: #{e.message}")
        end

        private
        def repo
          Accounts::Repositories::IntervenantRepository.new
        end
      end
    end
  end
end
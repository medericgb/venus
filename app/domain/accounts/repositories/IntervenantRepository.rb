module Accounts
  module Repositories
    class IntervenantRepository
      def create_account(intervenant_params)
        entity.create(intervenant_params)
      end

      private 
      def entity
        Accounts::Entities::Intervenant
      end
    end
  end
end
module Accounts
  module Repositories
    class ClientRepository
      
      def create_account(client_params:)
        raise client_params.inspect
        entity.create(client_params)
      end

      private 
      def entity
        Accounts::Entities::Client
      end
    end
  end
end
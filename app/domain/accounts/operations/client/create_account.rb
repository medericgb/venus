module Accounts
  module Operations
    module Client
      class CreateAccount
        include Interactor
      
        def call
          context.client = repo.create_account(context.client_params)
        rescue => e
          context.fail!(errors: "create_client_account_error: #{e.message}")
        end

        private
        def repo
          Accounts::Repositories::ClientRepository.new
        end
      end
    end
  end
end
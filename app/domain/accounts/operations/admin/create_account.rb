module Accounts
  module Operations
    module Admin
      class CreateAccount
        include Interactor

        def call
          context.admin = repo.create_account(context.admin_params)
        rescue => e
          context.fail!(errors: "create_admin_account_error: #{e.message}")
        end
        
        private
        def repo
          Accounts::Repositories::AdminRepository.new
        end
      end
    end
  end
end
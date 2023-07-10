module Accounts
  module Operations
    module User
      class CreateAccount
        include Interactor

        def call
          context.user = repo.create_account(context.user_params)
        rescue => e
          context.fail!(errors: "create_user_account_error: #{e.message}")
        end
        
        private
        def repo
          Accounts::Repositories::UserRepository.new
        end
      end
    end
  end
end
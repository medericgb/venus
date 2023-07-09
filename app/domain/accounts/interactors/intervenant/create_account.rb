module Accounts
  module Interactors
    module Intervenant
      class CreateAccount
        include Interactor
      
        def call
          context.intervenant = repo.create_account(context.intervenant_params)
        rescue => e
          context.fail!(errors: "create_intervenant_account_error: #{e.message}")
        end

        private
        def repo
          Accounts::Repositories::IntervenantRepository.new
        end
      end
    end
  end
end
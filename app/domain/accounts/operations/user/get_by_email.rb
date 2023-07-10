module Accounts
  module Operations
    module User
      class GetByEmail
        include Interactor

        def call
          context.user = repo.get_by_email(user_email: context.user_email)
        rescue => e
          context.fail!(errors: "get_user_by_email_error: #{e.message}")
        end

        private
        def repo
          Accounts::Repositories::UserRepository.new
        end
      end
    end
  end
end
module Accounts
  module Queries
    module User
      class ByEmail
        include Interactor

        def call
          context.user = repo.by_email(context.user_email)
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
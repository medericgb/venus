module Accounts
  module Queries
    module User
      class ById
        include Interactor

        def call
          context.user = repo.by_id(context.user_id)
        rescue => e
          context.fail!(errors: "get_user_by_id_error: #{e.message}")
        end

        private
        def repo
          Accounts::Repositories::UserRepository.new
        end
      end
    end
  end
end
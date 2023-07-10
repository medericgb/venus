module Accounts
  module Operations
    module User
      class GetById
        include Interactor

        def call
          context.user = repo.get_by_id(user_id: context.user_id)
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
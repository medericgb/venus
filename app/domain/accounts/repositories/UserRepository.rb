module Accounts
  module Repositories
    class UserRepository

      def create_account(user_params:)
        entity.create(user_params)
      end

      def all
        entity.all
      end

      def get_by_id(user_id:)
        entity.find(user_id)
      end

      def get_by_email(user_email:)
        entity.find_by(email: user_email)
      end

      private 
      def entity
        Accounts::Entities::User
      end
    end
  end
end
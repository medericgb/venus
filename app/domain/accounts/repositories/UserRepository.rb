module Accounts
  module Repositories
    class UserRepository
      def create_account(user_params)
        entity.create(user_params)
      end

      def all
        entity.all
      end

      # def list_users_by_type(type)
      #   entity.all.where(type: type)
      # end

      def by_id(user_id)
        entity.find(user_id)
      end

      def by_email(user_email)
        entity.find_by(email: user_email)
      end

      private 
      def entity
        Accounts::Entities::User
      end
    end
  end
end
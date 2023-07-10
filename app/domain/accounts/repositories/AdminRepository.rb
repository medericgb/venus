module Accounts
  module Repositories
    class AdminRepository
      def create_account(admin_params:)
        entity.create(admin_params)
      end

      private 
      def entity
        Accounts::Entities::Admin
      end
    end
  end
end
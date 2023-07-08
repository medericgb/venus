module Accounts
  class Repository
    def create_account(username:, email:, role:, password:)
      entity.create(username, email, role, password)
    end

    private
    def entity
      @entity ||= Accounts::Entities::Account.new
    end
  end
end
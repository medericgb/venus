module Accounts
  module Interactors
    class CreateAccount
      include Interactor

      def call
        repo.create_account(context.account_params)
      end

      private
      def repo
        @repo ||= Accounts::Repository.new
      end
    end
  end
end
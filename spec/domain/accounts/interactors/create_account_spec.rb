require 'rails_helper'

RSpec.describe Accounts::Interactors::CreateAccount, type: :Interactor do
  Account = Accounts::Entities::Account

  describe "#call" do
    context "with invalid params" do
      let(:account_params) {}
      subject(:context) { described_class.call(account_params: account_params) }

      it "fails" do
        expect(context).to be_a_failure
      end

      it "doesn't create an account" do
        expect(Account.count).to eq(0)
      end
    end

    context "with valid params" do
      let(:account_params) { FactoryBot.create(:account) }
      subject(:context) { described_class.call(account_params: account_params) }

      it "succeeds" do
        expect(context).to be_a_success
      end

      it "creates an account" do
        expect(Account.count).to eq(1)
      end
    end
  end
end
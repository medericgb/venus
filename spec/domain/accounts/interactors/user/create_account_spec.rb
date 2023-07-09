require 'rails_helper'

RSpec.describe Accounts::Interactors::User::CreateAccount, type: :Interactor do
  User = Accounts::Entities::User
  CreateAccount = Accounts::Interactors::User::CreateAccount

  describe "#call" do
    context "with invalid params" do
      subject(:user) { described_class.call({}) }

      it "fails" do
        expect(user).not_to be_valid
      end

      it "doesn't create an account" do
        expect(User.count).to eq(0)
      end
    end

    context "with valid params" do
      let :attrs do 
        attributes_for(:user)
      end
      
      before do
        user = CreateAccount.call(user_params: attrs)
      end

      it "creates an account" do
        expect(User.count).to eq(1)
      end
    end
  end
end
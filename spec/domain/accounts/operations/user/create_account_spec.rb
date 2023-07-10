require 'rails_helper'

RSpec.describe Accounts::Operations::User::CreateAccount, type: :Interactor do
  User = Accounts::Entities::User
  CreateAccount = Accounts::Operations::User::CreateAccount

  describe "#call" do
    let :attrs do 
      attributes_for(:user)
    end

    context "with invalid params" do
      subject(:user) { described_class.call({}) }

      it "fails" do
        expect(user).not_to be_valid
      end

      it "doesn't create an account" do
        expect(User.count).to eq(0)
      end
    end

    context "when user already exists" do
      before do
        create(:user, attrs)
      end

      it "fails" do
        user = CreateAccount.call(user_params: attrs)
        expect(user).not_to be_valid
      end
    end

    context "with valid params" do
      before do
        user = CreateAccount.call(user_params: attrs)
      end

      it "creates an account" do
        expect(User.count).to eq(1)
      end
    end
  end
end
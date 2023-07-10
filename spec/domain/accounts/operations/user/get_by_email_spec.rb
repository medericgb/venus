require 'rails_helper'

RSpec.describe Accounts::Operations::User::GetByEmail, type: :interactor do
  User = Accounts::Entities::User
  GetByEmail = Accounts::Operations::User::GetByEmail

  describe "#call" do
    context "when user does not exist" do
      it "returns the user count as 0" do
        user = GetByEmail.call(user_email: Faker::Internet.email)
        expect(user).to be_failure
      end
    end

    context "when user exists" do
      let(:user) { FactoryBot.create(:user) }

      it "returns the expected user" do
        expected = GetByEmail.call(user_email: user.email)
        expect(expected.user.email).to eq(user.email)
        expect(expected.user.type).to eq(user.type)
      end
    end
  end
end
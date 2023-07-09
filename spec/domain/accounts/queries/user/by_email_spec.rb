require 'rails_helper'

RSpec.describe Accounts::Queries::User::ByEmail, type: :interactor do
  User = Accounts::Entities::User
  ByEmail = Accounts::Queries::User::ByEmail

  describe "#call" do
    context "when user does not exist" do
      it "returns the user count as 0" do
        user = ByEmail.call(user_email: Faker::Internet.email)
        expect(user).to be_failure
      end
    end

    context "when user exists" do
      let(:user) { FactoryBot.create(:user) }

      it "returns the expected user" do
        expected = ByEmail.call(user_email: user.email)
        expect(expected.user.email).to eq(user.email)
        expect(expected.user.type).to eq(user.type)
      end
    end
  end
end
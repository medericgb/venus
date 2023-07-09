require 'rails_helper'

RSpec.describe Accounts::Queries::User::ById, type: :interactor do
  User = Accounts::Entities::User
  ById = Accounts::Queries::User::ById

  describe "#call" do
    context "when user does not exist" do
      it "returns the user count as 0" do
        user = ById.call(user_id: 1)
        expect(user).to be_failure
      end
    end

    context "when user exists" do
      let(:user) { FactoryBot.create(:user) }

      it "returns the expected user" do
        expected = ById.call(user_id: user.id)
        expect(expected.user.id).to eq(user.id)
        expect(expected.user.type).to eq(user.type)
      end
    end
  end
end
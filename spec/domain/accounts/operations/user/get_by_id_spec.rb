require 'rails_helper'

RSpec.describe Accounts::Operations::User::GetById, type: :interactor do
  User = Accounts::Entities::User
  GetById = Accounts::Operations::User::GetById

  describe "#call" do
    context "when user does not exist" do
      it "returns the user count as 0" do
        user = GetById.call(user_id: 1)
        expect(user).to be_failure
      end
    end

    context "when user exists" do
      let(:user) { FactoryBot.create(:user) }

      it "returns the expected user" do
        expected = GetById.call(user_id: user.id)
        expect(expected.user.id).to eq(user.id)
        expect(expected.user.type).to eq(user.type)
      end
    end
  end
end
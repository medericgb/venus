require 'rails_helper'

RSpec.describe Accounts::Entities::User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  
  describe "validations" do
    it "is not valid without a username" do
      user.username = nil
      expect(user).to_not be_valid
    end

    it "is not valid without a email" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "is not valid without a password" do
      user.password = nil
      expect(user).to_not be_valid
    end

    it "is not valid without a type" do
      user.type = nil
      expect(user).to_not be_valid
    end

    it "is valid when all required fields are present" do
      expect(user).to be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe Accounts::Entities::Account, type: :model do
  let(:account) { FactoryBot.create(:account) }
  
  describe "validations" do
    it "is not valid without a username" do
      account.username = nil
      expect(account).to_not be_valid
    end

    it "is not valid without a email" do
      account.email = nil
      expect(account).to_not be_valid
    end

    it "is not valid without a role" do
      account.role = nil
      expect(account).to_not be_valid
    end

    it "is not valid without a password" do
      account.password = nil
      expect(account).to_not be_valid
    end

    it "is valid when all required fields are present" do
      expect(account).to be_valid
    end
  end

  describe "associations" do
  end
end

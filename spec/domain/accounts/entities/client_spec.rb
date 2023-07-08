require 'rails_helper'

RSpec.describe Accounts::Entities::Client, type: :model do
  let(:client) { FactoryBot.create(:client) }
  
  describe "validations" do
    it "is not valid without a username" do
      client.username = nil
      expect(client).to_not be_valid
    end

    it "is not valid without a email" do
      client.email = nil
      expect(client).to_not be_valid
    end

    it "is not valid without a password" do
      client.password = nil
      expect(client).to_not be_valid
    end

    it "is valid when all required fields are present" do
      expect(client).to be_valid
    end
  end
end

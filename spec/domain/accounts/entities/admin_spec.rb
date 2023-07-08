require 'rails_helper'

RSpec.describe Accounts::Entities::Admin, type: :model do
  let(:admin) { FactoryBot.create(:admin) }
  
  describe "validations" do
    it "is not valid without a username" do
      admin.username = nil
      expect(admin).to_not be_valid
    end

    it "is not valid without a email" do
      admin.email = nil
      expect(admin).to_not be_valid
    end

    it "is not valid without a password" do
      admin.password = nil
      expect(admin).to_not be_valid
    end

    it "is valid when all required fields are present" do
      expect(admin).to be_valid
    end
  end
end

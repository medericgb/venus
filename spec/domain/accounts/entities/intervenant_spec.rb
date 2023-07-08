require 'rails_helper'

RSpec.describe Accounts::Entities::Intervenant, type: :model do
  let(:intervenant) { FactoryBot.create(:intervenant) }
  
  describe "validations" do
    it "is not valid without a username" do
      intervenant.username = nil
      expect(intervenant).to_not be_valid
    end

    it "is not valid without a email" do
      intervenant.email = nil
      expect(intervenant).to_not be_valid
    end

    it "is not valid without a password" do
      intervenant.password = nil
      expect(intervenant).to_not be_valid
    end

    it "is valid when all required fields are present" do
      expect(intervenant).to be_valid
    end
  end
end

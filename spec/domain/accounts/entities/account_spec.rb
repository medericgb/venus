require 'rails_helper'

RSpec.describe Accounts::Entities::Account, type: :model do
  let(:account) { FactoryBot.create(:account) }
  
  describe "validations" do
    it "is not valid without a username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a username" do
      subject.role = nil
      expect(subject).to_not be_valid
    end
  end

  describe "associations" do
   // TODO:
  end
end

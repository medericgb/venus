require 'rails_helper'

RSpec.describe Account, class: Accounts::Entities::User do
  describe "validations" do
    it { is_expected.to validate_presence_of(:username) } 
    it { is_expected.to validate_presence_of(:email) } 

    it { is_expected.to validate_presence_of(:password_digest) } 
    it { is_expected.to validate_presence_of(:recovery_password_digest) } 
  end

  describe "associations" do
    it { is_expected.to have_many(:tickets) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:notifications) }
  end
end
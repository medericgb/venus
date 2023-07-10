require 'rails_helper'

RSpec.describe Tickets::Entities::Ticket, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:state) }
    it { is_expected.to allow_value("open").for(:state) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:client) }
    it { is_expected.to belong_to(:intervenant) }
    it { is_expected.to have_many(:comments) }
  end
end

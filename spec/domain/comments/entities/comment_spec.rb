require 'rails_helper'

RSpec.describe Comments::Entities::Comment, type: :model do
  describe "validations" do
    it { should validate_presence_of(:content) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:ticket)}
    it { is_expected.to belong_to(:user)}
  end
end

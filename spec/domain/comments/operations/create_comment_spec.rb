require 'rails_helper'

RSpec.describe Comments::Operations::CreateComment, type: :Interactor do
  Comment = Comments::Entities::Comment

  describe "#call" do
    let(:ticket) { FactoryBot.create(:ticket) }
    let(:account) { FactoryBot.create(:user) }
    let(:context) { described_class.call(ticket_id: ticket.id, account_id: account.id, content: Faker::Lorem.paragraph) }
    
    it "creates a comment" do
      expect(Comment.count).to eq(1)
    end
  end
end
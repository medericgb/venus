require 'rails_helper'

RSpec.describe Comments::Operations::CreateComment, type: :Interactor do
  Comment = Comments::Entities::Comment
  CreateComment = Comments::Operations::CreateComment

  describe "#call" do

    context "with invalid params" do
      subject(:comment) { described_class.call({}) }
      
      it "fails" do
        expect(comment).not_to be_valid
      end
      
      it "doesn't create a comment" do
        expect(Comment.count).to eq(0)
      end
    end

    context "with valid params" do
      
      let(:ticket) { FactoryBot.create(:ticket) }
      let(:client) { FactoryBot.create(:client) }
      let(:comment_params) do
        {
          ticket_id: ticket.id,
          account_id: client.id,
          content: Faker::Lorem.paragraph
        }
      end

      before do
        CreateComment.call(comment_params: comment_params)
      end

      it "creates a comment" do
        expect(Comment.count).to eq(1)
      end
    end
  end
end
require 'rails_helper'

RSpec.describe Tickets::Operations::CreateTicket, type: :Interactor do
  Ticket = Tickets::Entities::Ticket
  CreateTicket = Tickets::Operations::CreateTicket

  describe "#call" do
    context "with invalid params" do
      subject(:ticket) { described_class.call({}) }
    
      it "fails" do
        expect(ticket).not_to be_valid
      end
      
      it "doesn't create a ticket" do
        expect(Ticket.count).to eq(0)
      end
    end

    context "with valid params" do
      
      let(:intervenant) { FactoryBot.create(:intervenant) }
      let(:client) { FactoryBot.create(:client) }
      let(:ticket_params) do
        {
          client_id: client.id,
          intervenant_id: intervenant.id,
          title: Faker::Name.name,
          content: Faker::Lorem.paragraph,
          state: "open",
        }
      end

      before do
        @ticket = CreateTicket.call(ticket_params: ticket_params)
      end

      it "creates a ticket" do
        # raise @ticket.errors.inspect
        expect(Ticket.count).to eq(1)
      end
    end
  end
end
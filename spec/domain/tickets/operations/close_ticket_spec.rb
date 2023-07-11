require 'rails_helper'

RSpec.describe Tickets::Operations::CloseTicket, type: :Interactor do
  Ticket = Tickets::Entities::Ticket
  CloseTicket = Tickets::Operations::CloseTicket

  describe "#call" do
    context "when ticket does not exist" do
      subject(:ticket) { described_class.call(ticket_id: SecureRandom.uuid) }
      
      it "fails" do
        expect(ticket).not_to be_valid
      end
    end

    context "with valid params" do
      let(:ticket) { FactoryBot.create(:ticket)}

      it "updates ticket state" do
        expected_ticket = CloseTicket.call(ticket_id: ticket.id)
        expect(expected_ticket.ticket).to eq(true)
      end
    end
  end
end
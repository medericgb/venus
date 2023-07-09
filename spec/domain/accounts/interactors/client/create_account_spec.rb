require 'rails_helper'

RSpec.describe Accounts::Interactors::Client::CreateAccount, type: :Interactor do
  Client = Accounts::Entities::Client
  CreateAccount = Accounts::Interactors::Client::CreateAccount

  describe "#call" do
    context "with invalid params" do
      subject(:client) { described_class.call({}) }

      it "fails" do
        expect(client).not_to be_valid
      end

      it "doesn't create an account" do
        expect(Client.count).to eq(0)
      end
    end

    context "with valid params" do
      let :attrs do 
        attributes_for(:client)
      end
      
      before do
        client = CreateAccount.call(client_params: attrs)
      end

      it "creates an account" do
        expect(Client.count).to eq(1)
      end
    end
  end
end
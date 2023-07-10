require 'rails_helper'

RSpec.describe Accounts::Operations::Client::CreateAccount, type: :Interactor do
  Client = Accounts::Entities::Client
  CreateAccount = Accounts::Operations::Client::CreateAccount

  describe "#call" do
    let :attrs do 
      attributes_for(:client)
    end

    context "with invalid params" do
      subject(:client) { described_class.call({}) }

      it "fails" do
        expect(client).not_to be_valid
      end

      it "doesn't create an account" do
        expect(Client.count).to eq(0)
      end
    end

    context "when client already exists" do
      before do
        create(:client, attrs)
      end

      it "fails" do
        client = CreateAccount.call(client_params: attrs)
        expect(client).not_to be_valid
      end
    end

    context "with valid params" do
      before do
        client = CreateAccount.call(client_params: attrs)
      end

      it "creates an account" do
        expect(Client.count).to eq(1)
      end
    end
  end
end
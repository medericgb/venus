require 'rails_helper'

RSpec.describe Accounts::Interactors::Intervenant::CreateAccount, type: :Interactor do
  Intervenant = Accounts::Entities::Intervenant
  CreateAccount = Accounts::Interactors::Intervenant::CreateAccount

  describe "#call" do
    context "with invalid params" do
      subject(:intervenant) { described_class.call({}) }

      it "fails" do
        expect(intervenant).not_to be_valid
      end

      it "doesn't create an account" do
        expect(Intervenant.count).to eq(0)
      end
    end

    context "with valid params" do
      let :attrs do 
        attributes_for(:intervenant)
      end
      
      before do
        intervenant = CreateAccount.call(intervenant_params: attrs)
      end

      it "creates an account" do
        expect(Intervenant.count).to eq(1)
      end
    end
  end
end
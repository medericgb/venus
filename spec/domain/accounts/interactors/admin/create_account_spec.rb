require 'rails_helper'

RSpec.describe Accounts::Interactors::Admin::CreateAccount, type: :Interactor do
  Admin = Accounts::Entities::Admin
  CreateAccount = Accounts::Interactors::Admin::CreateAccount

  describe "#call" do
    context "with invalid params" do
      subject(:admin) { described_class.call({}) }

      it "fails" do
        expect(admin).not_to be_valid
      end

      it "doesn't create an account" do
        expect(Admin.count).to eq(0)
      end
    end

    context "with valid params" do
      let :attrs do 
        attributes_for(:admin)
      end
      
      before do
        admin = CreateAccount.call(admin_params: attrs)
      end

      it "creates an account" do
        expect(Admin.count).to eq(1)
      end
    end
  end
end
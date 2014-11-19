require 'rails_helper'

RSpec.describe Server, type: :model do
  describe 'チェッカ' do
    before { @server = FactoryGirl.build(:server) }
    subject { @server }
    it { is_expected.to respond_to :checker }
  end

  describe 'www.example.com' do
    let(:server) { FactoryGirl.create(:server, name: 'www.example.com') }
    specify { expect(server.status.code).to eq '200' }
    specify { expect(server.status.message).to eq 'OK' }
  end

  # ノートン・コネクト・セーフを使っていると成功したりしなかったりする
  # describe 'it.is.not.exist' do
  #   let (:server) { FactoryGirl.create(:server, name: 'it.is.not.exist') }
  #   specify { expect(server.status.code).not_to eq '200' }
  #   specify do
  #     pending 'ノートン・コネクト・セーフを使っていると無効'
  #     expect(server.status.code).not_to eq '200'
  #   end
  # end
end

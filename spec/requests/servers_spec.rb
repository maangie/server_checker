require 'rails_helper'

RSpec.describe 'Servers', type: :request do
  describe 'GET /servers' do
    it 'works! (now write some real specs)' do
      get servers_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'のカラムについて' do
    before { @server = FactoryGirl.build(:server) }

    subject { @server }

    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :check_type }

    it { is_expected.to be_valid }

    describe 'Check Type が nil の際' do
      before { @server.check_type = nil }
      it { is_expected.not_to be_valid }
    end

    describe 'Check Type が 1 未満の際' do
      before { @server.check_type = 0 }
      it { is_expected.not_to be_valid }
    end

    describe 'Check Type が 2 より大きい際' do
      before { @server.check_type = 3 }
      it { is_expected.not_to be_valid }
    end
  end
end

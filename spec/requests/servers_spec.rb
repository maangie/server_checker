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
    it { is_expected.to respond_to :checker }

    it { is_expected.to be_valid }
    specify { expect(@server.checker).to be_valid }
  end

  describe 'チェッカについて' do
    before { @server = FactoryGirl.build(:server) }

    subject { @server.checker }
    
    it { is_expected.to be_valid }
  end

  describe '登録ページ' do
    before { visit new_server_path }
    subject { page }
    it { is_expected.to have_content('新規 Server') }
  end

  describe '登録する' do
    subject { page }

    before do
      visit new_server_path
      fill_in 'Name', with: 'www.example.com'
    end

    it 'と増える' do
      expect do
        click_button I18n.t('helpers.submit.create')
      end.to change(Server, :count).by(1)
    end
  end

  describe 'チェッカ' do
    it '作成'  do
      visit new_server_path
      fill_in 'Name', with: 'www.example.com'
      click_button I18n.t('helpers.submit.create')
      expect(Server.last.checker).to be_a Checker
    end
  end
end

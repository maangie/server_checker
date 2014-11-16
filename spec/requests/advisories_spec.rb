require 'rails_helper'

RSpec.describe 'Advisories', type: :request do
  subject { page }

  let(:server) { FactoryGirl.create(:server) }

  describe 'GET /advisories' do
    it 'works! (now write some real specs)' do
      get server_advisories_path server
      expect(response).to have_http_status 200
    end
  end

  describe '一覧ページ' do
    before { visit server_advisories_path(server) }
    it { is_expected.to have_link 'ServerChecker', root_path }
  end

  describe 'show' do
    let (:advisory) { server.advisory.create(email: 'foo@example.com') }

    before { visit server_advisory_path server, advisory }

    it { is_expected.to have_link 'テストメイル送信', send_test_mail_path }

    describe 'テストメイル送信' do
      before { click_link 'テストメイル送信' }
      it do
        is_expected.to have_selector 'div.alert.fade.in.alert-success',
                                     text, '送信しました'
      end
    end
  end
end

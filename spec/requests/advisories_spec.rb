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
    before do
      FactoryGirl.create(:advisory, server: server)
      FactoryGirl.create(:advisory, server: server, email: 'bar@example.com')
      visit server_advisories_path(server)
    end

    it { is_expected.to have_link 'ServerChecker', root_path }

    describe '状態メイル送信' do
      before { click_link I18n.t('helpers.links.send_server_status') }
      it do
        is_expected.to have_selector 'div.alert.fade.in.alert-success',
                                     text, I18n.t('notice.sent')
      end
    end
  end

  describe 'show' do
    let (:advisory) { server.advisories.create(email: 'foo@example.com') }

    before { visit server_advisory_path server, advisory }

    it do
      is_expected.to have_link I18n.t('helpers.links.send_server_status'),
                               send_server_status_path
    end

    describe '状態メイル送信' do
      before { click_link I18n.t('helpers.links.send_server_status') }
      it do
        is_expected.to have_selector 'div.alert.fade.in.alert-success',
                                     text, I18n.t('notice.sent')
      end
    end
  end
end

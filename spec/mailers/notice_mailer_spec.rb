require 'rails_helper'

RSpec.describe NoticeMailer, type: :mailer do
  describe 'sendmail_confirm' do
    let(:server) { FactoryGirl.create(:server) }
    let(:mail) { NoticeMailer.sendmail_confirm('to@example.org', server) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Sendmail confirm')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    describe 'renders the body' do
      let(:raw) { mail.html_part.body.raw_source }
      specify do
        expect(raw).to have_content(I18n.t('mail.notify_server_status'))
      end
    end
  end
end

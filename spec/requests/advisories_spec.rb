require 'rails_helper'

RSpec.describe 'Advisories', type: :request do
  let(:server) { FactoryGirl.create(:server) }

  describe 'GET /advisories' do
    it 'works! (now write some real specs)' do
      get server_advisories_path server
      expect(response).to have_http_status 200
    end
  end
end
